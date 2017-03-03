<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/product_catalog.jsp"; %>

<jsp:useBean id="product_catalogue" scope="page" class="gr.softways.dev.eshop.category.v2.Present" />

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("rootCat","Προϊόντα");
  lb.put("rootCatLG","Products");
  lb.put("rootCatLG1","Products");
  lb.put("rootCatLG2","Products");
}
%>

<%
if (!"1".equals(website_config_catalog)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

product_catalogue.initBean(databaseId, request, response, this, session);

String catId = request.getParameter("catId");
if (catId == null) catId = "";

int category_path_length = 0;

String htmlTitle = lb.get("rootCat" + lang).toString(), sef_url = "";

if (catId.length() > 0) {
  category_path_length = product_catalogue.getCatPath(catId, "catId").getRetInt();
  
  for (int i=0; i<category_path_length; i++) {
    htmlTitle += " - " + product_catalogue.getColumn("catName" + lang);

    sef_url += SwissKnife.sefEncode( product_catalogue.getColumn("catName" + lang) ) + "/";

    product_catalogue.nextRow();
  }
}

request.setAttribute("catId",catId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/metatags.jsp" %>

    <title><%= htmlTitle %></title>
    
    <style>
    .catcell {
      width: 202px;
      border: 1px solid #CCCCCC;
      cursor: pointer;
      float: left;
      display: inline;
      height: 250px;
      margin-bottom: 20px;
      margin-right: 20px;
      position: relative;
    }
    .catcell .desc {
      border-top: 1px solid #CCCCCC;
      display: block;
      font-weight: bold;
      line-height: 20px;
      font-weight: normal;
      height: 100px;
      margin: 0 9px;
      padding-top: 9px;
    }
    .catcell .desc a.name {
      display: block;
      width: 180px;
      color: #333333;
      text-align: center;
    }
    </style>
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
product_catalogue.getSubCateg(catId, (catId.length() + 2) / 2,"catRank DESC,catId");

while (product_catalogue.inBounds() == true) { %>

<%
    String cat_img = "", cat_url = "";
    
    if (product_catalogue.getColumn("catImgName1").length() > 0 && SwissKnife.fileExists(wwwrootFilePath + "/images/" + product_catalogue.getColumn("catImgName1").trim())) {
        cat_img = "/images/" + product_catalogue.getColumn("catImgName1").trim();
    }
    else {
        cat_img = "/images/prd_cat_not_avail.png";
    }

    if (product_catalogue.getColumn("catParentFlag").equals("1")) cat_url = "http://" + serverName + "/site/category/" + sef_url + SwissKnife.sefEncode(product_catalogue.getColumn("catName" + lang)) + "?catId=" + product_catalogue.getColumn("catId") + "&amp;extLang" + lang;
    else cat_url = "http://" + serverName + "/site/search/" + sef_url + SwissKnife.sefEncode(product_catalogue.getColumn("catName" + lang)) + "?catId=" + product_catalogue.getColumn("catId") + "&amp;extLang=" + lang;
%>
    <div class="catcell" onclick="document.location.href='<%=cat_url%>'">
      <div class="prdcat_img_link"><a href="<%=cat_url%>"><img src="<%=cat_img%>" alt="<%=product_catalogue.getColumn("catName" + lang).replace("\"", "&quot;")%>" title="<%=product_catalogue.getColumn("catName" + lang).replace("\"", "&quot;")%>" /></a></div>

      <span class="desc">
      <a href="<%=cat_url%>" class="name"><%=product_catalogue.getColumn("catName" + lang)%></a>
      </span>
    </div>
<%
      product_catalogue.nextRow();
}
%>
</div> <!-- /productCatalogListing -->

</div> <!-- /container -->

</div> <!-- /swCategoryListing -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
  $(".catcell").hover(
  function() {
    $(this).find(".prdcat_img_link").stop().animate({opacity: "0.65"}, 500);
  },
  function() {
    $(this).find(".prdcat_img_link").stop().animate({opacity: "1"}, 500);
  }
  );
});
</script>

<% product_catalogue.closeResources(); %>

</div> <!-- end: site -->

</body>
</html>