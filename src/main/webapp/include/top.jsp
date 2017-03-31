<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="top_jsp_prdCatMenu" scope="page" class="gr.softways.dev.eshop.category.v2.PrdCategoryMenu2" />
<jsp:useBean id="top_jsp_menu" scope="page" class="gr.softways.dev.swift.cmcategory.v1.Menu2" />

<%!
static Hashtable top_jsp_lb = new Hashtable();
static {
  top_jsp_lb.put("productSearch","Αναζήτηση προϊόντων");
  top_jsp_lb.put("productSearchLG","Search products");
  top_jsp_lb.put("searchBtn","Αναζήτηση");
  top_jsp_lb.put("searchBtnLG","Search");
  
  top_jsp_lb.put("menuTitle","Επιλογές");
  top_jsp_lb.put("menuTitleLG","Menu");
  
  top_jsp_lb.put("prdTitle","ΠΡΟΪΟΝΤΑ");
  top_jsp_lb.put("prdTitleLG","PRODUCTS");
  
  top_jsp_lb.put("showAllCat","Δείτε όλες τις κατηγορίες");
  top_jsp_lb.put("showAllCatLG","Show all categories");
  
  top_jsp_lb.put("showAllCatFly","Όλες οι κατηγορίες");
  top_jsp_lb.put("showAllCatFlyLG","All categories");
}
%>

<%
top_jsp_prdCatMenu.initBean(databaseId, request, response, this, session);
top_jsp_menu.initBean(databaseId, request, response, this, session);

String prd_catalogue_left_catId = (String) request.getAttribute("catId");

if (prd_catalogue_left_catId == null) prd_catalogue_left_catId = "";

top_jsp_prdCatMenu.getMenu("", lang);
top_jsp_prdCatMenu.closeResources();

top_jsp_menu.getMenu("10", lang);
top_jsp_menu.closeResources();

int top_jsp_prdCatMenuLength = top_jsp_prdCatMenu.getMenuLength();
int top_jsp_menuLength = top_jsp_menu.getMenuLength();

int menuLevel = 0;
String top_MenuURL = "";

String top_CMCCode = request.getParameter("CMCCode");

if (top_CMCCode == null) top_CMCCode = "";

if (whereAmI.equals("/index.jsp") && top_CMCCode.equals("")) top_CMCCode = HOME_CMCCode;
%>
  
<div id="header">
<div id="sticky">

  <%@ include file="/include/mobile_menu.jsp" %>

  <div id="headerContainer" class="container">

  <div class="row">
  <div class="col-xs-12 col-sm-5 col-md-3">
    <a id="top_logo" href="<%="/" + (defLang.equals(lang) ? "" : "?extLang=" + lang)%>"><img id="top_logo_img" src="/images/logo<%=lang%>.png" alt="logo"/></a>
  </div>

  <div style="margin-top:10px;" class="col-xs-12 col-sm-7 col-md-9">

  <div id="search-lang-top" class="clearfix">
    <div><form id="langForm" method="post" action="#"><input type="hidden" name="lang" value="" /></form></div>
    <div><noscript><a href="<%="/index.jsp?extLang="%>">ΕΛΛΗΝΙΚΑ</a></noscript></div>
    <div><noscript><a href="<%="/index.jsp?extLang=LG"%>">ENGLISH</a></noscript></div>

    <div id="header-flags" class="clearfix">
    <div class="pull-right">
    <div class="pull-left" style="margin-right:10px;"><% if (!lang.equals("")) { %><a href="javascript:document.getElementById('langForm').lang.value='';document.getElementById('langForm').submit();void(0);"><% } %><img src="/images/flag.png" alt="ΕΛΛΗΝΙΚΑ" title="ΕΛΛΗΝΙΚΑ" /><% if (!lang.equals("")) { %></a><% } %></div>
    <div class="pull-left" style=""><% if (!lang.equals("LG")) { %><a href="javascript:document.getElementById('langForm').lang.value='LG';document.getElementById('langForm').submit();void(0);"><% } %><img src="/images/flagLG.png" alt="ENGLISH" title="ENGLISH" /><% if (!lang.equals("LG")) { %></a><% } %></div>
    </div>
    </div>

    <div id="product-search-top-wrapper" class="clearfix">
    <div id="product-search-top" class="pull-right">
    <form id="searchForm" name="searchForm" action="/site/search" method="get">
      <input id="qid" name="qid" class="form-control typeahead" type="text" placeholder="<%=top_jsp_lb.get("productSearch" + lang)%>" onclick="this.value=''" title="<%=top_jsp_lb.get("productSearch" + lang)%>">
      <button class="submit"><span class="glyphicon glyphicon-search"></span></button>
    </form>
    </div>
    </div>
  </div>

  <div id="megamenu_wrapper"><%@ include file="/include/top_menu.jsp" %></div> <!-- /megamenu_wrapper -->

  </div>
  </div>
  
  <div class="row"><div class="col-xs-12"><div class="mobileMenuBtnWrap"><a href="#" id="mobile-menu-link"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></div></div></div>

  </div> <!-- /headerContainer -->

</div> <!-- /sticky -->
</div> <!-- /header -->

<%
String top_banner_imgname = "top_full_banner", top_banner_imgext = ".jpg", 
    top_banner_code = null, top_banner_identifier = null, top_banner_fullimgpath = null;
    
if (request.getAttribute("CMCCode") != null) {
  top_banner_code = request.getAttribute("CMCCode").toString();
  top_banner_identifier = "";
  
  if (top_banner_code.length() >= 8) top_banner_code = top_banner_code.substring(0, 6);
}
else if (request.getAttribute("catId") != null) {
  top_banner_code = request.getAttribute("catId").toString();
  top_banner_identifier = "_products";
  
  if (top_banner_code.length() > 2) top_banner_code = top_banner_code.substring(0, 2);
}

if (top_banner_code != null) {
  top_banner_fullimgpath = "/images/" + top_banner_imgname + top_banner_identifier + top_banner_code + top_banner_imgext;
  if (SwissKnife.fileExists(wwwrootFilePath + top_banner_fullimgpath) == false && top_banner_code.length() == 6) {
		top_banner_code = top_banner_code.substring(0, 4);
		top_banner_fullimgpath = "/images/" + top_banner_imgname + top_banner_identifier + top_banner_code + top_banner_imgext;
	}
	if (SwissKnife.fileExists(wwwrootFilePath + top_banner_fullimgpath) == false) top_banner_fullimgpath = "/images/" + top_banner_imgname + top_banner_identifier + top_banner_imgext;
  if (SwissKnife.fileExists(wwwrootFilePath + top_banner_fullimgpath) == true) {
%>
    <div id="topMenuPath"><img src="<%=top_banner_fullimgpath%>" class="img-responsive" alt="banner"/></div>
<%
  } 
}  
%>

<% top_jsp_menu.closeResources(); %>