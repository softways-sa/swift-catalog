<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="btm_cmrow" scope="page" class="gr.softways.dev.swift.cmrow.Present" />

<%!
static Hashtable bottom_lb = new Hashtable();
static {
  bottom_lb.put("nlHeader","ΕΓΓΡΑΦΗ NEWSLETTER");
  bottom_lb.put("nlHeaderLG","Newsletter Signup");
  bottom_lb.put("nlHeaderLG1","Newsletter Signup");
  bottom_lb.put("nlHeaderLG2","Newsletter Signup");
  bottom_lb.put("nlTitle","Γραφτείτε στο newsletter μας");
  bottom_lb.put("nlTitleLG","Sign up for newsletter");
  bottom_lb.put("nlTitleLG1","Sign up for newsletter");
  bottom_lb.put("nlTitleLG2","Sign up for newsletter");
  bottom_lb.put("js_email","Παρακαλούμε ελέγξτε το email σας.");
  bottom_lb.put("js_emailLG","Please check your email spelling.");
  bottom_lb.put("js_emailLG1","Please check your email spelling.");
  bottom_lb.put("js_emailLG2","Please check your email spelling.");

  bottom_lb.put("errorResponse","Παρουσιάστηκε κάποιο πρόβλημα. Παρακαλούμε δοκιμάστε αργότερα.");
  bottom_lb.put("errorResponseLG","There was some problem. Please try again later.");
  bottom_lb.put("errorResponseLG1","There was some problem. Please try again later.");
  bottom_lb.put("errorResponseLG2","There was some problem. Please try again later.");
  bottom_lb.put("successResponse","Η εγγραφή σας ήταν επιτυχημένη. Σας ευχαριστούμε.");
  bottom_lb.put("successResponseLG","Your request was successfully submitted. Thank you.");
  bottom_lb.put("successResponseLG1","Your request was successfully submitted. Thank you.");
  bottom_lb.put("successResponseLG2","Your request was successfully submitted. Thank you.");
  
  bottom_lb.put("socialMediaHeader","ΑΚΟΛΟΥΘΗΣΤΕ ΜΑΣ");
  bottom_lb.put("socialMediaHeaderLG","Follow Us");
  bottom_lb.put("socialMediaHeaderLG1","Follow Us");
  bottom_lb.put("socialMediaHeaderLG2","Follow Us");
  bottom_lb.put("socialMediaTitle","Ακολουθήστε μας στα social media");
  bottom_lb.put("socialMediaTitleLG","Follow us in social media");
  bottom_lb.put("socialMediaTitleLG1","Follow us in social media");
  bottom_lb.put("socialMediaTitleLG2","Follow us in social media");
  
  bottom_lb.put("infocolumnHeader","ΠΛΗΡΟΦΟΡΙΕΣ");
  bottom_lb.put("infocolumnHeaderLG","INFORMATION");
  bottom_lb.put("infocolumnHeaderLG1","INFORMATION");
  bottom_lb.put("infocolumnHeaderLG2","INFORMATION");
  bottom_lb.put("infocolumnLine1","2310 335033, 2310 335034");
  bottom_lb.put("infocolumnLine1LG","2310 335033, 2310 335034");
  bottom_lb.put("infocolumnLine1LG1","2310 335033, 2310 335034");
  bottom_lb.put("infocolumnLine1LG2","2310 335033, 2310 335034");
  bottom_lb.put("infocolumnLine2","Σκουφά 3, Πυλαία, 55535, Θεσσαλονίκη");
  bottom_lb.put("infocolumnLine2LG","Skoufa 3, Pilaia, 55535, Thessaloniki");
  bottom_lb.put("infocolumnLine2LG1","Skoufa 3, Pilaia, 55535, Thessaloniki");
  bottom_lb.put("infocolumnLine2LG2","Skoufa 3, Pilaia, 55535, Thessaloniki");
  
  bottom_lb.put("displayAll","Δείτε όλα τα αποτελέσματα");
  bottom_lb.put("displayAllLG","Display all");
  bottom_lb.put("displayAllLG1","Display all");
  bottom_lb.put("displayAllLG2","Display all");
}
%>

<footer id="footer">
  <div class="footer-top">
    <div class="container">
      <div class="row sidebar">
        <aside class="col-xs-12 col-sm-6 col-md-3 widget social">
          <div class="title-block"><h3 class="title"><%=bottom_lb.get("socialMediaHeader" + lang)%></h3></div>
          <p><%=bottom_lb.get("socialMediaTitle" + lang)%></p>
          <a class="sbtnf" href="#"><img src="/images/social-1.png" alt=""/></a>
          <a class="sbtnf" href="#"><img src="/images/social-2.png" alt=""/></a>
          <a class="sbtnf" href="#"><img src="/images/social-3.png" alt=""/></a>
          <a class="sbtnf" href="#"><img src="/images/social-4.png" alt=""/></a>
          <a class="sbtnf" href="#"><img src="/images/social-5.png" alt=""/></a>
          <div class="clearfix"></div>
        </aside>

        <aside class="col-xs-12 col-sm-6 col-md-3 widget newsletter">
          <div class="title-block">
          <h3 class="title"><%=bottom_lb.get("nlHeader" + lang)%></h3>
          </div>
          <div>
          <p><%=bottom_lb.get("nlTitle" + lang)%></p>
          <div class="clearfix"></div>
          <form id="sent-email" method="POST">
            <input class="form-control" type="text" id="leftNewsletterEmail" name="leftNewsletterEmail" title="<%=bottom_lb.get("nlTitle" + lang)%>" />
            <button id="join-us" class="submit" onclick="return sendNewsletterForm();"><span class="glyphicon glyphicon-arrow-right"></span></button>
            <div id="leftNewsletterValidatorErrorMessages"></div>
          </form>
          </div>
        </aside>
        
        <aside class="col-xs-12 col-sm-6 col-md-3 widget links">
        <%
        top_jsp_menu.getMenu("30", lang);
        top_jsp_menu.closeResources();
        top_jsp_menuLength = top_jsp_menu.getMenuLength();
        
        for (int i=0; i<top_jsp_menuLength; i++) {
          MenuOption menuOption = top_jsp_menu.getMenuOption(i);
        %>
          <%if ("<a>".equals(menuOption.getTag()) && "1".equals(menuOption.getParent())) {%>
            <div class="title-block">
            <h3 class="title"><%=menuOption.getTitle()%></h3>
            </div>
            <nav>
            <ul>
          <%
          }
          else if ("<a>".equals(menuOption.getTag())) {%>
            <li><%if (!"1".equals(menuOption.getParent()) && menuOption.getURL() == null) {%><a href="<%="/site/page/" + SwissKnife.sefEncode(menuOption.getTitle()) + "?CMCCode=" + menuOption.getCode() + "&amp;extLang=" + lang%>"><%= menuOption.getTitle() %></a><%}%><%if (!"1".equals(menuOption.getParent()) && menuOption.getURL() != null) {%><a href="<% if (menuOption.getURL().startsWith("/")) out.print(menuOption.getURL().replace("&", "&amp;")); else out.print(menuOption.getURL().replace("&", "&amp;")); %>"><%= menuOption.getTitle() %></a><%}%></li>
          <%
          }
          else if ("</ul>".equals(menuOption.getTag())) {%>
            </ul>
            </nav>
        <%
          }
        }%>
        </aside>

        <aside class="col-xs-12 col-sm-6 col-md-3 widget links">
          <div class="title-block">
          <h3 class="title"><%=bottom_lb.get("infocolumnHeader" + lang)%></h3>
          </div>
          <div class="phone">
            <div class="footer-icon">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
              <path fill="#c6c6c6" d="M11.001,0H5C3.896,0,3,0.896,3,2c0,0.273,0,11.727,0,12c0,1.104,0.896,2,2,2h6c1.104,0,2-0.896,2-2
               c0-0.273,0-11.727,0-12C13.001,0.896,12.105,0,11.001,0z M8,15c-0.552,0-1-0.447-1-1s0.448-1,1-1s1,0.447,1,1S8.553,15,8,15z
              M11.001,12H5V2h6V12z"></path>
            </svg>
            </div>
            <%=bottom_lb.get("infocolumnLine1" + lang)%>
          </div>
          <div class="address">
            <div class="footer-icon">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
              <g>
              <g>
                <path fill="#c6c6c6" d="M8,16c-0.256,0-0.512-0.098-0.707-0.293C7.077,15.491,2,10.364,2,6c0-3.309,2.691-6,6-6
                c3.309,0,6,2.691,6,6c0,4.364-5.077,9.491-5.293,9.707C8.512,15.902,8.256,16,8,16z M8,2C5.795,2,4,3.794,4,6
                c0,2.496,2.459,5.799,4,7.536c1.541-1.737,4-5.04,4-7.536C12.001,3.794,10.206,2,8,2z"></path>
              </g>
              <g>
                <circle fill="#c6c6c6" cx="8.001" cy="6" r="2"></circle>
              </g>
              </g>
            </svg>
            </div>
            <%=bottom_lb.get("infocolumnLine2" + lang)%>
          </div>
        </aside>
      </div>
    </div>
  </div><!-- /footer-top -->
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="copyright col-xs-12 col-sm-3 col-md-3">Copyright &copy; Loren Ipsum S.A.</div>
        <div class="copyright col-xs-12 col-sm-3 col-md-3"></div>
        <div class="copyright col-xs-12 col-sm-3 col-md-3"></div>
        <div class="poweredby col-xs-12 col-sm-3 col-md-3">Powered by <a href="https://www.softways.gr">Softways</a></div>
      </div>
    </div>
  </div><!-- /footer-bottom -->
</footer>

<a href="#" class="back-to-top"><span class="glyphicon glyphicon-arrow-up"></span></a>

<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="/js/typeahead.bundle.js"></script>
<script src="/js/jquery.easing-1.3.js"></script>
<script src="/js/jquery.royalslider.min.js"></script>
<script type="text/javascript" src="/js/jsfunctions.js"></script>
<script src="/js/megamenu_plugins.js"></script>
<script src="/js/megamenu.js"></script>
<script src="/js/mmenu/jquery.mmenu.min.js"></script>
<script src="/js/mmenu/jquery.mmenu.fixedelements.min.js"></script>

<script type="text/javascript">
var productSearch = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/product_search_ajax.jsp?action1=SEARCH&qid=%QUERY'
});

productSearch.initialize();

$(document).ready(function(){
  
  var scroll_to_top_duration = 500;
  $(window).scroll(function() {
    if ($(this).scrollTop() > 120) {
      $('#sticky').addClass('concrete');
      $('.back-to-top').fadeIn(scroll_to_top_duration);
    }
    else {
      $('#sticky').removeClass('concrete');
      $('.back-to-top').fadeOut(scroll_to_top_duration);
    }
  });

  $('.back-to-top').click(function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop: 0}, scroll_to_top_duration);
    return false;
  });
  
  $('.megamenu').megaMenuCompleteSet({
      menu_speed_show : 0, // Time (in milliseconds) to show a drop down
      menu_speed_hide : 0, // Time (in milliseconds) to hide a drop down
      menu_speed_delay : 0, // Time (in milliseconds) before showing a drop down
      menu_effect : 'hover_fade', // Drop down effect, choose between 'hover_fade', 'hover_slide', etc.
      menu_click_outside : 1, // Clicks outside the drop down close it (1 = true, 0 = false)
      menu_show_onload : 0, // Drop down to show on page load (type the number of the drop down, 0 for none)
      menu_responsive: 1 // 1 = Responsive, 0 = Not responsive
  });
  
  $("#mobile-menu").removeClass('hidden');
  $("#mobile-menu").mmenu();
  var mmenuAPI = $("#mobile-menu").data("mmenu");
  $("#mobile-menu-link").on("click", function(event){event.preventDefault(); mmenuAPI.open()});
  
  $('#product-search-top .typeahead').typeahead({
      minLength: 3
    },
    {
      name: 'product-search',
      displayKey: 'value',
      source: productSearch.ttAdapter(),
      templates: {
        footer: function(ctx) {
          if (ctx.isEmpty == false) return '<div class="footer-message"><a href="/site/search?qid=' + ctx.query + '"><%=bottom_lb.get("displayAll" + lang)%></a></div>';
        }
      }
    }
  ).on('typeahead:selected', function($e, suggestion) {
    window.location = suggestion.link;
  });
  
});

function sendNewsletterForm() {
  var leftNewsletterEmail = $("#leftNewsletterEmail").val();

  if (emailCheck(leftNewsletterEmail)) {
    sendNewsletterData(leftNewsletterEmail);
  }
  else {
    $("#leftNewsletterValidatorErrorMessages").text("<%=bottom_lb.get("js_email" + lang)%>");
  }

  return false;
}

function sendNewsletterData(email) {
  $.ajax({
    type: "GET",
    url: "/newsletter.do?cmd=subscribe&id=NEWSLETTER&EMLMEmail=" + email,
    dataType: "html",
    success: function(serverresponse) {
      if (serverresponse == 1) $("#sent-email").text("<%=bottom_lb.get("successResponse" + lang)%>").css('font-weight','bold');
      else $("#sent-email").text("<%=bottom_lb.get("errorResponse" + lang)%>").css('font-weight','bold');
    }
  });
}
</script>

<% 
btm_cmrow.initBean(databaseId, request, response, this, session);
btm_cmrow.getCMRow("0105", "");
while (btm_cmrow.inBounds() == true) {out.println(btm_cmrow.getColumn("CMRBodyHTML")); btm_cmrow.nextRow();}
btm_cmrow.closeResources();
%>