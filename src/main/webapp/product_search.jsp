<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/product_search.jsp"; %>

<jsp:useBean id="product_search" scope="page" class="gr.softways.dev.eshop.product.v2.Search2_3" />

<jsp:useBean id="product_catalogue" scope="page" class="gr.softways.dev.eshop.category.v2.Present" />

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("resultsFor","Αποτελέσματα αναζήτησης για");
  lb.put("resultsForLG","Search results for");
  lb.put("resultsForLG1","Search results for");
  lb.put("resultsForLG2","Search results for");

  lb.put("prdsFrom","Προϊόντα");
  lb.put("prdsFromLG","Products");
  lb.put("prdsFromLG1","Products");
  lb.put("prdsFromLG2","Products");
  lb.put("fromTotal","από σύνολο");
  lb.put("fromTotalLG","of total");
  lb.put("fromTotalLG1","of total");
  lb.put("fromTotalLG2","of total");
  lb.put("pages","Σελίδες");
  lb.put("pagesLG","Pages");
  lb.put("pagesLG1","Pages");
  lb.put("pagesLG2","Pages");
  lb.put("pPage","Προηγούμενη");
  lb.put("pPageLG","Previous");
  lb.put("pPageLG1","Previous");
  lb.put("pPageLG2","Previous");
  lb.put("nPage","Επόμενη");
  lb.put("nPageLG","Next");
  lb.put("nPageLG1","Next");
  lb.put("nPageLG2","Next");

  lb.put("noResults","Δεν βρέθηκαν εγγραφές την παρούσα στιγμή.");
  lb.put("noResultsLG","We are sorry but no results were found.");
  lb.put("noResultsLG1","We are sorry but no results were found.");
  lb.put("noResultsLG2","We are sorry but no results were found.");

  lb.put("searchTips","Πληροφορίες Αναζήτησης");
  lb.put("searchTipsLG","Search Tips");
  lb.put("searchTipsLG1","Search Tips");
  lb.put("searchTipsLG2","Search Tips");
  lb.put("spellingCheck","Κάντε ορθογραφικό έλεγχο");
  lb.put("spellingCheckLG","Double-check your spelling");
  lb.put("spellingCheckLG1","Double-check your spelling");
  lb.put("spellingCheckLG2","Double-check your spelling");
  lb.put("useWords","Χρησιμοποιήστε μία ή δύο λέξεις");
  lb.put("useWordsLG","Use only one or two words");
  lb.put("useWordsLG1","Use only one or two words");
  lb.put("useWordsLG2","Use only one or two words");

  lb.put("featuredPrds","Προτάσεις");
  lb.put("featuredPrdsLG","Featured Products");
  lb.put("featuredPrdsLG1","Featured Products");
  lb.put("featuredPrdsLG2","Featured Products");

  lb.put("rootCat","Προϊόντα");
  lb.put("rootCatLG","Products");
  lb.put("rootCatLG1","Products");
  lb.put("rootCatLG2","Products");

  lb.put("insteadOf","από");
  lb.put("insteadOfLG","instead of");
  lb.put("insteadOfLG1","instead of");
  lb.put("insteadOfLG2","instead of");
    
  lb.put("pLabelNew","ΝΕΟ");
  lb.put("pLabelNewLG","NEW");
  lb.put("pLabelNewLG1","NEW");
  lb.put("pLabelNewLG2","NEW");
  lb.put("pLabelSale","ΠΡΟΣΦΟΡΑ");
  lb.put("pLabelSaleLG","SALE");
  lb.put("pLabelSaleLG1","SALE");
  lb.put("pLabelSaleLG2","SALE");
  
  lb.put("sortLabel","Ταξινόμηση");
  lb.put("sortLabelLG","Sort");
  lb.put("sortAscLabel","φθηνότερο -> ακριβότερο");
  lb.put("sortAscLabelLG","price ascending");
  lb.put("sortDescLabel","ακριβότερο -> φθηνότερο");
  lb.put("sortDescLabelLG","price descending");
  lb.put("itemsPerPageLabel","Προϊόντα ανα σελίδα");
  lb.put("itemsPerPageLabelLG","Items per page");
  lb.put("newfirstLabel","νέες αφίξεις");
  lb.put("newfirstLabelLG","new arrivals");
}
%>

<%
if (!"1".equals(website_config_catalog)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

product_search.initBean(databaseId, request, response, this, session);
product_catalogue.initBean(databaseId, request, response, this, session);

int dispRows = 16, dispPageNumbers = 10;

int currentPage = 0, currentRowCount = 0, totalRowCount = 0, totalPages = 0;

String sortBy = "",
    sort = request.getParameter("sort"),
    pperpage = request.getParameter("pperpage");
    
if ("newfirst".equals(sort)) sortBy = "prdCompFlag DESC";
//else if ("priceasc".equals(sort)) sortBy = "retailPrcEU ASC";
//else if ("pricedesc".equals(sort)) sortBy = "retailPrcEU DESC";
else {sort = ""; sortBy = "prdId ASC";}

if ("32".equals(pperpage)) {dispRows = 32; pperpage = "32";}
else if ("48".equals(pperpage)) {dispRows = 48; pperpage = "48";}
else {dispRows = 16; pperpage = "16";}

product_search.setSortedByCol(sortBy);
product_search.setSortedByOrder("");
product_search.setDispRows(dispRows);

DbRet dbRet = product_search.doAction(request);

if (dbRet.getNoError() == 0) {
    product_search.closeResources();
    pageContext.forward("/");
    return;
}

String catId = product_search.getCatId();

currentRowCount = product_search.getCurrentRowCount();
totalRowCount = product_search.getTotalRowCount();
totalPages = product_search.getTotalPages();
currentPage = product_search.getCurrentPage();

int startPage = 0, endPage = 0;

int start = product_search.getStart();

String htmlTitle = lb.get("rootCat" + lang).toString(), sef_url = "";

int category_path_length = 0;

if (catId.length() > 0) {
    category_path_length = product_catalogue.getCatPath(catId, "catId").getRetInt();
    
    for (int i=0; i<category_path_length; i++) {
        htmlTitle += " - " + product_catalogue.getColumn("catName" + lang);
        
        sef_url += SwissKnife.sefEncode( product_catalogue.getColumn("catName" + lang) ) + "/";
        
        product_catalogue.nextRow();
    }
}

BigDecimal zero = new BigDecimal("0"), one = new BigDecimal("1");

PrdPrice prdPrice = null, hdPrice = null, oldPrice = null;

boolean isOffer = false;

request.setAttribute("catId",catId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/metatags.jsp" %>

    <title><%=htmlTitle%></title>
</head>

<body>

<div id="site">

<%@ include file="/include/top.jsp" %>

<div id="swCategoryListing">
  
<div class="container">

<%@ include file="/include/prd_catalog_path.jsp" %>
  
<%@ include file="/include/product_catalog_left.jsp" %>

<div id="productCatalogListing" class="responsive4Col">

<%if (catId.length() > 0 && product_catalogue.getColumn("catDescr" + lang).length() > 0) {%><div id="productSearchCatDescr"><%=product_catalogue.getColumn("catDescr" + lang)%></div><%}%>
  
<%
if (product_search.getQID().length()>0) { %>
  <div id="productSearchFor" style="margin: 0 0 15px;">
    <b><%= lb.get("resultsFor" + lang) %> "<%= product_search.getQID() %>"</b>
  </div>
<%
} %>

<div>
<%
if (totalRowCount > 0) {
  int cols_by_row = 4;

  String prd_img = "", viewPrdPageURL = "";
%>
  <div class="searchSort" style="float:right;">
  <form id="searchSortForm" action="<%="/site/search" + (sef_url.length() > 0 ? "/" + sef_url.substring(0,sef_url.length()-1) : "")%>" method="get">
    <input name="qid" value="<%=product_search.getQID()%>" type="hidden">
    <input name="catId" value="<%=product_search.getCatId()%>" type="hidden">
    <input name="spof" value="<%=product_search.getHotdealFlag()%>" type="hidden">
    <input name="fprd" value="<%=product_search.getPrdNewColl()%>" type="hidden">
    <input name="newarr" value="<%=product_search.getPrdCompFlag()%>" type="hidden">
    
    <select name="sort" onchange="this.form.submit();" title="<%=lb.get("sortLabel" + lang)%>">
      <option value="" <%if ("".equals(sort)) out.print("selected");%>><%=lb.get("sortLabel" + lang)%></option>
      <%--<option value="priceasc" <%if ("priceasc".equals(sort)) out.print("selected");%>><%=lb.get("sortAscLabel" + lang)%></option>
      <option value="pricedesc" <%if ("pricedesc".equals(sort)) out.print("selected");%>><%=lb.get("sortDescLabel" + lang)%></option>--%>
      <option value="newfirst" <%if ("newfirst".equals(sort)) out.print("selected");%>><%=lb.get("newfirstLabel" + lang)%></option>
    </select>

    <select name="pperpage" class="pperpage" onchange="this.form.submit();" title="<%=lb.get("itemsPerPageLabel" + lang)%>">
    <option value="16" <%if ("16".equals(pperpage)) out.print("selected");%>>16</option>
    <option value="32" <%if ("32".equals(pperpage)) out.print("selected");%>>32</option>
    <option value="48" <%if ("48".equals(pperpage)) out.print("selected");%>>48</option>
    </select>
  </form>
  </div><br style="clear:both;" />
  
  <div id="productSearchListSection">
<%
  while (product_search.inBounds() == true) {
    viewPrdPageURL = "/site/product/" + SwissKnife.sefEncode(product_search.getColumn("catName" + lang)) + "/" + SwissKnife.sefEncode(product_search.getColumn("name" + lang)) + "?prdId=" + product_search.getHexColumn("prdId") + "&amp;extLang=" + lang;

    prdPrice = null;

    isOffer = false;

    if (PriceChecker.isOffer(product_search.getQueryDataSet(),customerType)) {
      isOffer = true;
      hdPrice = PriceChecker.calcPrd(one,product_search.getQueryDataSet(),customerType,isOffer,zero);

      oldPrice = PriceChecker.calcPrd(one,product_search.getQueryDataSet(),customerType,false,zero);
    }
    prdPrice = PriceChecker.calcPrd(one,product_search.getQueryDataSet(),customerType,isOffer,zero);

    if (SwissKnife.fileExists(wwwrootFilePath + "/prd_images/" + product_search.getColumn("prdId") + "-1.jpg")) {
        prd_img = "/prd_images/" + product_search.getColumn("prdId") + "-1.jpg";
    }
    else {
        prd_img = "/images/img_not_avail.jpg";
    }
    %>
      <div class="prdcell" onclick="document.location.href='<%=viewPrdPageURL%>'">
        
      <div class="prdimage">
        <div class="product_labels">
          <%if (isOffer == true) {%><span class="prdlabel sale"><%=lb.get("pLabelSale" + lang)%></span><%}%>
          <%if ("1".equals(product_search.getColumn("prdCompFlag"))) {%><span class="prdlabel new"><%=lb.get("pLabelNew" + lang)%></span><%}%>
        </div>
        
        <img width="200" height="200" src="<%=prd_img%>" alt="<%=product_search.getColumn("name" + lang).replace("\"", "&quot;")%>" title="<%=product_search.getColumn("name" + lang).replace("\"", "&quot;")%>" />
      </div>
      
      <span class="prddesc">
      <a href="<%=viewPrdPageURL%>" class="name"><%=product_search.getColumn("name" + lang)%></a>
      
      <%
      if (prdPrice.getUnitGrossCurr1().compareTo(zero) == 1) { %>
        <span class="price<%if (isOffer == true) {%> sale<%}%>">
          <%=SwissKnife.formatNumber(gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_WHOLESALE == customerType ? prdPrice.getUnitNetCurr1() : prdPrice.getUnitGrossCurr1(), localeLanguage, localeCountry, minCurr1DispFractionDigits, curr1DisplayScale)%>&nbsp;&euro;
          <%if (isOffer == true) {%><span class="oldPrice"><%=lb.get("insteadOf" + lang)%>&nbsp;<%= SwissKnife.formatNumber(gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_WHOLESALE == customerType ? oldPrice.getUnitNetCurr1() : oldPrice.getUnitGrossCurr1(), localeLanguage, localeCountry, minCurr1DispFractionDigits, curr1DisplayScale)%>&nbsp;&euro;</span><%}%>
        </span>
      <%
      } %>
      </span>
      
      </div>
<%
    product_search.nextRow();
  }
%>
  </div> <!-- /productSearchListSection -->
  
  <br style="clear:both;" />
  <div class="searchSort hidden-xs" style="float:right;">
  <form id="searchSortFormBtm" action="<%="/site/search" + (sef_url.length() > 0 ? "/" + sef_url.substring(0,sef_url.length()-1) : "")%>" method="get">
    <input name="qid" value="<%=product_search.getQID()%>" type="hidden">
    <input name="catId" value="<%=product_search.getCatId()%>" type="hidden">
    <input name="spof" value="<%=product_search.getHotdealFlag()%>" type="hidden">
    <input name="fprd" value="<%=product_search.getPrdNewColl()%>" type="hidden">
    <input name="newarr" value="<%=product_search.getPrdCompFlag()%>" type="hidden">
    
    <select name="sort" onchange="this.form.submit();" title="<%=lb.get("sortLabel" + lang)%>">
      <option value="" <%if ("".equals(sort)) out.print("selected");%>><%=lb.get("sortLabel" + lang)%></option>
      <%--<option value="priceasc" <%if ("priceasc".equals(sort)) out.print("selected");%>><%=lb.get("sortAscLabel" + lang)%></option>
      <option value="pricedesc" <%if ("pricedesc".equals(sort)) out.print("selected");%>><%=lb.get("sortDescLabel" + lang)%></option>--%>
      <option value="newfirst" <%if ("newfirst".equals(sort)) out.print("selected");%>><%=lb.get("newfirstLabel" + lang)%></option>
    </select>

    <select name="pperpage" class="pperpage" onchange="this.form.submit();" title="<%=lb.get("itemsPerPageLabel" + lang)%>">
      <option value="16" <%if ("16".equals(pperpage)) out.print("selected");%>>16</option>
      <option value="32" <%if ("32".equals(pperpage)) out.print("selected");%>>32</option>
      <option value="48" <%if ("48".equals(pperpage)) out.print("selected");%>>48</option>
    </select>
  </form>
  </div><br style="clear:both;" />
<%
    if (totalPages > 1) {
        String urlQuerySearch = "/site/search" + (sef_url.length() > 0 ? "/" + sef_url.substring(0,sef_url.length()-1) : "") + "?catId=" + SwissKnife.hexEscape(product_search.getCatId()) + "&amp;qid=" + SwissKnife.hexEscape(product_search.getQID()) + "&amp;spof=" + SwissKnife.hexEscape(product_search.getHotdealFlag()) + "&amp;newarr=" + SwissKnife.hexEscape(product_search.getPrdCompFlag()) + "&amp;fprd=" + SwissKnife.hexEscape(product_search.getPrdNewColl()) + "&amp;sort=" + SwissKnife.hexEscape(sort) + "&amp;pperpage=" + SwissKnife.hexEscape(pperpage) + "&amp;extLang=" + lang;
    %>
        <div id="searchPagination" class="clearfix">

        <table class="centerPagination">
        <tr><td align="center">
        <table class="pagination" align="center"><tr>
        <%
        if (currentPage > 1) { %>
            <td><a href="<%=urlQuerySearch + "&amp;start=" + ((currentPage-2)*dispRows)%>"><b class="paginationArrows">&laquo;</b> <%= lb.get("pPage" + lang) %></a></td>
        <%
        }
        else { %>
            <td><a href="#" class="searchPreviousPage"><b class="paginationArrows">&laquo;</b> <%= lb.get("pPage" + lang) %></a></td>
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
            <td><a href="<%=urlQuerySearch + "&amp;start=" + (currentPage*dispRows)%>"><%= lb.get("nPage" + lang) %> <b class="paginationArrows">&raquo;</b></a></td>
        <%
        }
        else { %>
            <td><a href="#" class="searchNextPage"><%= lb.get("nPage" + lang) %> <b class="paginationArrows">&raquo;</b></a></td>
        <%
        } %>
        </tr></table>
        </td></tr></table>

        </div> <!-- end: searchPagination -->
<%
    }
}
else { %>
    <%--<div><b><%= lb.get("noResults" + lang) %></b></div>--%>
<% } %>

</div>

</div> <!-- end: productCatalogListing -->

</div> <!-- /container -->

</div> <!-- /swCategoryListing -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
  $(".prdcell").hover(
  function() {
    $(this).find(".prdimage").stop().animate({opacity: "0.65"}, 500);
  },
  function() {
    $(this).find(".prdimage").stop().animate({opacity: "1"}, 500);
  }
  );
});
</script>

</div> <!-- end: site -->

<%
product_search.closeResources();
product_catalogue.closeResources();
%>

</body>
</html>