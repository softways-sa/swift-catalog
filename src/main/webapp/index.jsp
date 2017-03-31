<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/index.jsp"; %>

<jsp:useBean id="searchArticle" scope="page" class="gr.softways.dev.swift.cmrow.SearchArticle3" />
<jsp:useBean id="cmcategory" scope="page" class="gr.softways.dev.swift.cmcategory.Present" />
<jsp:useBean id="helperBean" scope="page" class="gr.softways.dev.swift.cmrow.Present" />

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("htmlTitle","Νέα / Blog");
  lb.put("htmlTitleLG","News /Blog");
  lb.put("htmlTitleLG1","News /Blog");
  lb.put("htmlTitleLG2","News /Blog");
  lb.put("htmlDescription","");
  lb.put("htmlDescriptionLG","");
  lb.put("htmlDescriptionLG1","");
  lb.put("htmlDescriptionLG2","");

  lb.put("more","Διαβάστε περισσότερα");
  lb.put("moreLG","Read more");
  lb.put("moreLG1","Read more");
  lb.put("moreLG2","Read more");
  
  lb.put("pub","Δημοσιεύθηκε στις");
  lb.put("pubLG","Published on");
  lb.put("pubLG1","Published on");
  lb.put("pubLG2","Published on");

  lb.put("noRecords","Δεν βρέθηκαν καταχωρήσεις.");
  lb.put("noRecordsLG","No records found.");
  lb.put("noRecordsLG1","No records found.");
  lb.put("noRecordsLG2","No records found.");

  lb.put("next","Επόμενη");
  lb.put("nextLG","Next");
  lb.put("nextLG1","Next");
  lb.put("nextLG2","Next");
  lb.put("previous","Προηγούμενη");
  lb.put("previousLG","Previous");
  lb.put("previousLG1","Previous");
  lb.put("previousLG2","Previous");
}
%>

<%
String CMCCode = request.getParameter("CMCCode"),
       CMRCode = request.getParameter("CMRCode");

if (CMCCode == null) CMCCode = "";
if (CMRCode == null) CMRCode = "";

if (CMCCode.equals("") && CMRCode.equals("")) {
    CMCCode = HOME_CMCCode;
}
request.setAttribute("CMCCode",CMCCode);

boolean itemsCarouselModule = false;

if ("1".equals(website_config_catalog) && ITEMS_CAROUSEL && HOME_CMCCode.equals(CMCCode)) {
  itemsCarouselModule = true;
}

searchArticle.initBean(databaseId, request, response, this, session);
cmcategory.initBean(databaseId, request, response, this, session);
helperBean.initBean(databaseId, request, response, this, session);

CMRowAttribs cmrowAttribs = new CMRowAttribs();

int CMRRows = 0;

int dispRows = 10, dispPageNumbers = 10;

int currentPage = 0, currentRowCount = 0, totalRowCount = 0, totalPages = 0;

searchArticle.setDispRows(dispRows);
searchArticle.setSortedByCol("CCCRRank DESC, CMRDateCreated");
searchArticle.setSortedByOrder("DESC");
DbRet dbRet = searchArticle.doAction(request);

currentRowCount = searchArticle.getCurrentRowCount();
totalRowCount = searchArticle.getTotalRowCount();
totalPages = searchArticle.getTotalPages();
currentPage = searchArticle.getCurrentPage();

int startPage = 0, endPage = 0;

int start = searchArticle.getStart();

String urlQuerySearch = "/site/page" + "?CMCCode=" + SwissKnife.hexEscape(searchArticle.getCMCCode()) + "&amp;extLang=" + lang;

StringBuilder htmlText = null, CMRHeadHTML = null, CMRBodyHTML = null;

String htmlTitle = "", htmlKeywords = ""; 

if (totalRowCount == 1) {
    htmlText = new StringBuilder(searchArticle.getColumn("CMRText" + lang));
    
    htmlTitle = searchArticle.getColumn("CMRTitle" + lang);
    htmlKeywords = searchArticle.getColumn("CMRKeyWords" + lang);
    
    CMRHeadHTML = new StringBuilder(searchArticle.getColumn("CMRHeadHTML"));
    CMRBodyHTML = new StringBuilder(searchArticle.getColumn("CMRBodyHTML"));
    
    cmrowAttribs = new CMRowAttribs(searchArticle.getColumn("CMRAttribs"));
    
    if (CMCCode.equals("")) {
      CMCCode = searchArticle.getColumn("CCCR_CMCCode");

      request.setAttribute("CMCCode",CMCCode);
    }
    
    CMRCode = searchArticle.getColumn("CMRCode");
    
    // related subpages
    helperBean.getRelatedCMRows(CMRCode,"CMCMRank DESC, CMCMCode ASC");
    while (helperBean.inBounds() == true) {
      htmlText.append(helperBean.getColumn("CMRText" + lang));
      CMRHeadHTML.append(helperBean.getColumn("CMRHeadHTML"));
      CMRBodyHTML.append(helperBean.getColumn("CMRBodyHTML"));
      
      helperBean.nextRow();
    }
    helperBean.closeResources();
    
    if (itemsCarouselModule) {
      CMRHeadHTML.append("<link href='/css/owl-carousel/owl.carousel.css' rel='stylesheet'>");
      CMRHeadHTML.append("<link href='/css/owl-carousel/owl.theme.css' rel='stylesheet'>");
      CMRBodyHTML.append("<script src='/js/owl.carousel.min.js'></script>");
      CMRBodyHTML.append("<script>$(document).ready(function() {$('#itemsCarousel').owlCarousel({navigation: true, items : 5, itemsDesktop : [1200,4], itemsDesktopSmall : [900,3], itemsTablet: [640,2], itemsMobile : [410,1]});});</script>");
    }
}
else {
    htmlTitle = lb.get("htmlTitle" + lang).toString();
    htmlKeywords = "";
}
String CMCURL = "";
String[][] CMCTree = null;
// get category path
if (!CMCCode.equals("") && !CMCCode.trim().startsWith("01")) {
    CMCTree = cmcategory.getCMCategoryTreePath(CMCCode, lang);
    if (CMCTree != null) {
        for (int i=0; i<CMCTree.length; i++) {
            if (i==0) {
                // the first category
                //top_jsp_path += CMCTree[i][0];
            }
            else {
                top_jsp_path += CMCTree[i][0];

                if ((i+1)<CMCTree.length) top_jsp_path += "&nbsp;|&nbsp;";

                CMCURL = CMCTree[i][2];
                if (CMCURL.equals("")) CMCURL = "/index.jsp?CMCCode=" + CMCTree[i][1] + "&amp;extLang=" + lang;
            }
        }
    }
}

boolean pgallery = false;

if (HOME_CMCCode.equals(CMCCode)) request.setAttribute("CMCCode",null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/include/metatags.jsp" %>

  <%if (htmlKeywords.length() > 0) {%><meta name="keywords" content="<%=htmlKeywords%>" /><%}%>

  <title><%=htmlTitle%></title>

  <%if (CMRHeadHTML != null) out.print(CMRHeadHTML.toString());%>
</head>

<body>

<div id="site">
    
<%@ include file="/include/top.jsp" %>

<div id="swContentSite" class="clearfix">

<%if (!"1".equals(cmrowAttribs.getValue("full_screen_width"))) {%><div class="container"><%}%>
  
<div id="content" class="<%if (cmrowAttribs.getValue("right_sidebar") != null && "0".equals(cmrowAttribs.getValue("right_sidebar"))) out.print("full-width");%>">
<%
if (totalRowCount == 1) {
  String gimg = "", zoom_gimg = "";
%>
    <div class="clearfix">
      <div class="clearfix"><%=htmlText.toString()%></div>
      
      <%
      for (int i=1; i<=20; i++) if (SwissKnife.fileExists(wwwrootFilePath + "/gimages/" + searchArticle.getColumn("CMRCode") + "-" + i + ".jpg")) {pgallery = true; gimg = "/gimages/" + searchArticle.getColumn("CMRCode") + "-" + i + ".jpg"; break;}
      
      if (pgallery == true) {
      %>
      <div id="gallery-wrapper">
        <div id="royalSlider" class="royalSlider rsDefault">
          <%
          for (int i=1; i<=20; i++) {
            if (SwissKnife.fileExists(wwwrootFilePath + "/gimages/" + searchArticle.getColumn("CMRCode") + "-" + i + ".jpg")) {
              gimg = "/gimages/" + searchArticle.getColumn("CMRCode") + "-" + i + ".jpg";
          %>
              <a class="rsImg" href="<%=gimg%>"><img class="rsTmb" src="<%=gimg%>" alt="Photo Gallery" /></a>
          <%
            }
          }
          %>
        </div>
        </div>
    <%
    }
    %>
    
    <%if (itemsCarouselModule) {%><div class="container"><jsp:include page="/WEB-INF/views/itemsCarousel.jsp"><jsp:param name="action1" value="SEARCH"/><jsp:param name="fprd" value="1"/></jsp:include></div><%}%>
    
    </div>
<%
}
else if (totalRowCount > 1) {
    while (searchArticle.inBounds() == true) {
      boolean postHasLink = searchArticle.getColumn("CMRText" + lang).length() > 0 ? true : false;
      %>
        <div class="clearfix post">
          <h5 class="entry-title"><%if (postHasLink == true) {%><a href="<%="/site/page/" + SwissKnife.sefEncode(searchArticle.getColumn("CMRTitle" + lang)) + "?CMRCode=" + searchArticle.getColumn("CMRCode") + "&amp;extLang=" + lang%>"><%}%><%=searchArticle.getColumn("CMRTitle" + lang)%><%if (postHasLink == true) {%></a><%}%></h5>
          <%if (searchArticle.getColumn("CMRSummary" + lang).length()>0) {%><div class="post-content"><%=searchArticle.getColumn("CMRSummary" + lang)%></div><%}%>
          <div class="meta-info">
            <%=lb.get("pub" + lang)%> <%=SwissKnife.formatDate(searchArticle.getTimestamp("CMRDateCreated"),"dd/MM/yyyy")%> 
            <%if (postHasLink == true) {%><div class="right"><a class="read-more" href="<%="/site/page/" + SwissKnife.sefEncode(searchArticle.getColumn("CMRTitle" + lang)) + "?CMRCode=" + searchArticle.getColumn("CMRCode") + "&amp;extLang=" + lang%>"><%=lb.get("more" + lang)%> &rsaquo;</a></div><%}%>
          </div>
        </div>
<%
        searchArticle.nextRow();
    }

    if (totalPages > 1) { %>
        <div id="searchPagination">
        <table class="centerPagination">
        <tr><td align="center">
        <table class="pagination" align="center"><tr>
        <%
        if (currentPage > 1) { %>
            <td><a href="<%=urlQuerySearch + "&amp;start=" + ((currentPage-2)*dispRows)%>"><b class="paginationArrows">&laquo;</b> <%= lb.get("previous" + lang) %></a></td>
        <%
        }
        else { %>
            <td><a href="#" class="searchPreviousPage"><b class="paginationArrows">&laquo;</b> <%= lb.get("previous" + lang) %></a></td>
        <%
        }

        startPage = currentPage - ((dispPageNumbers/2) - 1);

        if (startPage <= 1) {
            startPage = 1;

            endPage = startPage + (dispPageNumbers-1);
        }
        else {
            endPage = currentPage + (dispPageNumbers/2);
        }

        if (endPage >= totalPages) {
            endPage = totalPages;

            startPage = endPage - (dispPageNumbers-1);
            if (startPage <= 1) startPage = 1;
        }

        for (int i=startPage; i<=endPage; i++) {
            if (i == currentPage) { %>
                <td><a href="#" class="searchCurrentPage"><%= i %></a></td>
        <%  } else { %>
                <td class="hidden-xs"><a href="<%=urlQuerySearch + "&amp;start=" + ((i-1)*dispRows)%>"><%= i %></a></td>
        <%  }
        }

        if (currentPage < totalPages) { %>
            <td><a href="<%=urlQuerySearch + "&amp;start=" + (currentPage*dispRows)%>"><%= lb.get("next" + lang) %> <b class="paginationArrows">&raquo;</b></a></td>
        <%
        }
        else { %>
            <td><a href="#" class="searchNextPage"><%= lb.get("next" + lang) %> <b class="paginationArrows">&raquo;</b></a></td>
        <%
        } %>
        </tr></table>
        </td></tr></table>
        </div> <!-- end: pagination -->
<%
    }
}
else if (totalRowCount <= 0) { %>
  <div><strong><%= lb.get("noRecords" + lang) %></strong></div>
<% } %>
</div> <!-- /content -->

<%if ( (cmrowAttribs.getValue("right_sidebar") == null || "1".equals(cmrowAttribs.getValue("right_sidebar"))) && helperBean.getCMRow(RIGHT_SIDEBAR_CMCCode,null).getRetInt() > 0) {%><div id="sidebar"><%=helperBean.getColumn("CMRText" + lang)%></div> <!-- /sidebar --><%}%>

<%if (!"1".equals(cmrowAttribs.getValue("full_screen_width"))) {%></div> <!-- /container --><%}%>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

<%
if (pgallery == true) { %>
  <link href="/css/royalslider/skins/default/rs-default.css?v=1.0.4" rel="stylesheet">
  
  <script>
  jQuery(document).ready(function($) {
    $('#royalSlider').royalSlider({
      fullscreen: {
        enabled: true,
        nativeFS: true
      },
      controlNavigation: 'thumbnails',
      autoScaleSlider: true,
      autoScaleSliderWidth: 1600,
      autoScaleSliderHeight: 1200,
      loop: false,
      imageScaleMode: 'fit-if-smaller',
      navigateByClick: true,
      numImagesToPreload:2,
      arrowsNav:true,
      arrowsNavAutoHide: true,
      arrowsNavHideOnTouch: true,
      keyboardNavEnabled: true,
      fadeinLoadedSlide: true,
      globalCaption: true,
      globalCaptionInside: false,
      thumbs: {
        appendSpan: true,
        firstMargin: true,
        paddingBottom: 4
      }
    });
  });
  </script>
<%
} %>

<%if (CMRBodyHTML != null) out.print(CMRBodyHTML.toString());%>

</div> <!-- /site -->

<%
searchArticle.closeResources();
cmcategory.closeResources();
helperBean.closeResources();
%>

</body>
</html>