<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/product_detail.jsp"; %>

<jsp:useBean id="helperBean" scope="page" class="gr.softways.dev.eshop.product.v2.Present2_2" />

<jsp:useBean id="product_catalogue" scope="page" class="gr.softways.dev.eshop.category.v2.Present" />

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("zoom","Μεγέθυνση");
  lb.put("zoomLG","Enlarge image");
  lb.put("zoomLG1","Enlarge image");
  lb.put("zoomLG2","Enlarge image");

  lb.put("back","Επιστροφή");
  lb.put("backLG","Back");
  lb.put("backLG1","Back");
  lb.put("backLG2","Back");

  lb.put("rootCat","Προϊόντα");
  lb.put("rootCatLG","Products");
  lb.put("rootCatLG1","Products");
  lb.put("rootCatLG2","Products");

  lb.put("prdCode","Κωδ.");
  lb.put("prdCodeLG","Code");
  lb.put("prdCodeLG1","Code");
  lb.put("prdCodeLG2","Code");

  lb.put("prdPrice","Τιμή");
  lb.put("prdPriceLG","Price");
  lb.put("prdPriceLG1","Price");
  lb.put("prdPriceLG2","Price");
  
  lb.put("pLabelNew","ΝΕΟ");
  lb.put("pLabelNewLG","NEW");
  lb.put("pLabelNewLG1","NEW");
  lb.put("pLabelNewLG2","NEW");
  lb.put("pLabelSale","ΠΡΟΣΦΟΡΑ");
  lb.put("pLabelSaleLG","SALE");
  lb.put("pLabelSaleLG1","SALE");
  lb.put("pLabelSaleLG2","SALE");
}
%>

<%
if (!"1".equals(website_config_catalog)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

helperBean.initBean(databaseId, request, response, this, session);
product_catalogue.initBean(databaseId, request, response, this, session);

String prdId = request.getParameter("prdId"), catId = request.getParameter("catId");

BigDecimal zero = new BigDecimal("0"), one = new BigDecimal("1");

PrdPrice prdPrice = null, hdPrice = null, oldPrice = null;

boolean isOffer = false;

DbRet dbRet = null;

dbRet = helperBean.getPrd(prdId, SwissKnife.jndiLookup("swconf/inventoryType"));
if (dbRet.getNoError() == 0 || dbRet.getRetInt() <= 0) {
  helperBean.closeResources();
  pageContext.forward("/problem.jsp");
  return;
}

if (catId == null || catId.length() == 0) catId = helperBean.getColumn("PINCCatId");

request.setAttribute("catId",catId);

String htmlTitle = "";

int category_path_length = 0;

if (catId.length() > 0) {
    category_path_length = product_catalogue.getCatPath(catId, "catId").getRetInt();
    for (int i=0; i<category_path_length; i++) {
        htmlTitle += product_catalogue.getColumn("catName" + lang);
        if ( product_catalogue.nextRow() == true) htmlTitle += " - ";
    }
}

htmlTitle += " - " + helperBean.getColumn("name" + lang);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/metatags.jsp" %>

    <title><%= htmlTitle %></title>
    
    <link rel="stylesheet" type="text/css" href="/css/magiczoomplus.css" />
</head>

<body>

<div id="site">

<%@ include file="/include/top.jsp" %>

<div id="swCategoryListing">

<div class="container">

<%@ include file="/include/prd_catalog_path.jsp" %>

<%@ include file="/include/product_catalog_left.jsp" %>

<div id="productCatalogListing" class="responsive4Col">
    
<%
String prd_img = "", zoom_prd_img = "";

if (SwissKnife.fileExists(wwwrootFilePath + "/prd_images/" + helperBean.getColumn("prdId") + "-1.jpg")) {
    prd_img = "/prd_images/" + helperBean.getColumn("prdId") + "-1.jpg";
}
else {
    prd_img = "/images/img_not_avail.jpg";
}

if (SwissKnife.fileExists(wwwrootFilePath + "/prd_images/" + helperBean.getColumn("prdId") + "-1z.jpg")) {
    zoom_prd_img = "/prd_images/" + helperBean.getColumn("prdId") + "-1z.jpg";
}

prdPrice = null;

isOffer = false;

if (PriceChecker.isOffer(helperBean.getQueryDataSet(),customerType)) {
  isOffer = true;
  hdPrice = PriceChecker.calcPrd(one,helperBean.getQueryDataSet(),customerType,isOffer,zero);

  oldPrice = PriceChecker.calcPrd(one,helperBean.getQueryDataSet(),customerType,false,zero);
}
prdPrice = PriceChecker.calcPrd(one,helperBean.getQueryDataSet(),customerType,false,zero);

boolean hasTabs = false;
for (int i=1; i<=5; i++) {
    if (helperBean.getColumn("text" + i + "Title" + lang).length()>0) {
        hasTabs = true;
        break;
    }
}
%>
        <div id="item-main" class="clearfix" style="width: 100%;">
            
        <div class="item-images clearfix">

        <div id="item-views">
        <div class="active-view" style="position: relative;">
            <a id="item_gallery" href="<%=zoom_prd_img%>" class="MagicZoomPlus"><img class="preImage" src="<%=prd_img%>" style="width:100%;" alt="<%=helperBean.getColumn("name" + lang).replace("\"", "&quot;")%>"/></a>
            <div class="product_labels">
              <%if (isOffer == true) {%><span class="prdlabel sale"><%=lb.get("pLabelSale" + lang)%></span><%}%>
              <%if ("1".equals(helperBean.getColumn("prdCompFlag"))) {%><span class="prdlabel new"><%=lb.get("pLabelNew" + lang)%></span><%}%>
            </div>
        </div>
				
        <div class="controls-wrp clearfix">

        <div class="imagebox-zoom-control"><a href="<%=zoom_prd_img%>" id="zoomButton" style="float: right;">+ Zoom</a></div>
        <br style="clear: both;"/>
        <div class="alternative-wrp">
          <div class="alternative-view">
              <a href="<%=zoom_prd_img%>" rel="zoom-id:item_gallery" rev="<%=prd_img%>" class="alternative-view-box selected first"><img src="<%=prd_img%>" width="70" height="70" alt="<%=helperBean.getColumn("name" + lang).replace("\"", "&quot;")%>"/></a>
              <%
              int prdImagesFound = 1;
              
              for (int i=2; i<=8; i++) {
                  if (SwissKnife.fileExists(wwwrootFilePath + "/prd_images/" + helperBean.getColumn("prdId") + "-" + i + ".jpg")) {
                    prdImagesFound++;  
                    
                    prd_img = "/prd_images/" + helperBean.getColumn("prdId") + "-" + i + ".jpg";

                      if (SwissKnife.fileExists(wwwrootFilePath + "/prd_images/" + helperBean.getColumn("prdId") + "-" + i + "z.jpg")) {
                          zoom_prd_img = "/prd_images/" + helperBean.getColumn("prdId") + "-" + i + "z.jpg";
                      }
                      else zoom_prd_img = "";
              %>
                      <%if (prdImagesFound == 5) {%><br style="clear: both;"/><%}%>
                      <a href="<%=zoom_prd_img%>" rel="zoom-id:item_gallery" rev="<%=prd_img%>" class="alternative-view-box <%if (prdImagesFound == 5) {out.print("first"); prdImagesFound = 1;}%>"><img src="<%=prd_img%>" width="70" height="70" alt=""/></a>
              <%
                  }
              }
              %>
          </div>
        </div>
        </div>
        </div>
        
        </div> <!-- end: item-images -->
      
        <div class="item-options clearfix">

        <h2 class="item-header-name"><%=helperBean.getColumn("name" + lang)%></h2>
        
        <div class="item-code"><%= lb.get("prdCode" + lang)%>: <%= helperBean.getColumn("prdId")%></div>
        
        <div style="border-bottom:dotted 1px #535353;" class="hidden-xs clearfix">
        <div style="float:right; margin-bottom:5px;">
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style">
        <a class="addthis_button_facebook_like" fb:like:width="125" fb:like:layout="button_count" ></a>
        <a class="addthis_button_google_plusone" g:plusone:annotation="none"></a>
        <a class="addthis_button_twitter"></a>
        <a class="addthis_button_email"></a>
        <a class="addthis_button_print"></a>
        <a class="addthis_button_compact"></a>
        <a class="addthis_counter addthis_bubble_style"></a>
        </div>
        <!-- AddThis Button END -->
        </div>
        </div>
            
        <div class="item-descr"><%= helperBean.getColumn("descr" + lang)%></div>
        
        <%
        if (prdPrice.getUnitGrossCurr1().compareTo(zero) == 1) { %>
          <div class="item-price-line">
          <h3 class="pricelabel"><%= lb.get("prdPrice" + lang)%>:&nbsp;</h3>
          <%
          if (isOffer == true) { %>
            <h3 class="oldprice"><strike><%= SwissKnife.formatNumber(gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_WHOLESALE == customerType ? oldPrice.getUnitNetCurr1() : oldPrice.getUnitGrossCurr1(), localeLanguage, localeCountry, minCurr1DispFractionDigits, curr1DisplayScale)%> &euro;</strike></h3>
            <h3 class="price">&nbsp;<%= SwissKnife.formatNumber(gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_WHOLESALE == customerType ? hdPrice.getUnitNetCurr1() : hdPrice.getUnitGrossCurr1(), localeLanguage, localeCountry, minCurr1DispFractionDigits, curr1DisplayScale)%> &euro;</h3>
          <%
          } else { %>
            <h3 class="price"><%= SwissKnife.formatNumber(gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_WHOLESALE == customerType ? prdPrice.getUnitNetCurr1() : prdPrice.getUnitGrossCurr1(), localeLanguage, localeCountry, minCurr1DispFractionDigits, curr1DisplayScale)%> &euro;</h3>
          <% } %>
          </div>
        <%
        } %>
        
        </div> <!-- end: item-options -->
      
        </div> <!-- end: item-main -->
      
      <%
      if (hasTabs == true) { %>
          <div class="item-tabs">
            <ul class="tabs">
                <%
                for (int i=1; i<=5; i++) { 
                    if (helperBean.getColumn("text" + i + "Title" + lang).length()>0) { %>
                        <li><a href="#tab<%=i%>"><%=helperBean.getColumn("text" + i + "Title" + lang)%></a></li>
                <% 
                    }
                } %>
            </ul>
            <%
            for (int i=1; i<=5; i++) { 
                if (helperBean.getColumn("text" + i + lang).length()>0) { %>
                    <div class="tab_content" id="tab<%=i%>"><%=helperBean.getColumn("text" + i + lang)%></div>
            <% 
                }
            } %>
          </div>
      <% } %>

</div> <!-- end: productCatalogListing -->

</div> <!-- end: container -->

</div> <!-- /swCategoryListing -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript" src="/js/magiczoomplus.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    var ww = document.body.clientWidth;
    
    var disable_zoom = false;
    if (ww < 350) disable_zoom = true;
    
    MagicZoomPlus.options = {
      'zoom-position': 'inner',
      'opacity': '80',
      'zoom-width': '100%',
      'zoom-height': '100%',
      'hint': 'false',
      'show-title': 'false',
      'opacity-reverse': 'true',
      'pan-zoom': 'false',
      'disable-zoom': disable_zoom
    };
    
    $("#zoomButton").click(function(e) {
      e.preventDefault();
      MagicZoomPlus.expand('item_gallery');
    });

  });
</script>
<script type="text/javascript">
    $(function() {
        $('.alternative-view-box img').click(function(e){
            //e.preventDefault();
            
            //$('.preImage').hide();
            
            //$('.preImage').attr('src', $(this).attr('src'));
            
            $('.alternative-view-box').removeClass('selected');
            $(this).parent().addClass('alternative-view-box selected');
            
            //$('.active-view a, .imagebox-zoom-control a').attr('href', $(this).parent().attr('href'));
            
            //$('.preImage').show();
        });
    });
    
    <%
    if (hasTabs == true) { %>
        $(function() {
          //Default Action
          $(".tab_content").hide(); //Hide all content
          $("ul.tabs li:first").addClass("active").show(); //Activate first tab
          $(".tab_content:first").show(); //Show first tab content

          //On Click Event
          $("ul.tabs li").click(function(e) {
            $("ul.tabs li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content").hide(); //Hide all tab content
            var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active content
            return false;
          });
        });
    <% } %>
    </script>

</div> <!-- end: site -->

<%
helperBean.closeResources();
product_catalogue.closeResources();
%>

<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#async=1"></script>
<script type="text/javascript">
var addthis_config = {
  ui_use_css : false
}
$(document).ready(function(){addthis.init()});
</script>

</body>
</html>