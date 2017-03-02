<%@page pageEncoding="UTF-8"%>

<%@ include file="/include/config.jsp" %>

<jsp:useBean id="product_search" scope="page" class="gr.softways.dev.eshop.product.v2.Search2_3" />

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("pLabelNew","ΝΕΟ");
  lb.put("pLabelNewLG","NEW");
  lb.put("pLabelNewLG1","NEW");
  lb.put("pLabelNewLG2","NEW");
  lb.put("pLabelSale","ΠΡΟΣΦΟΡΑ");
  lb.put("pLabelSaleLG","SALE");
  lb.put("pLabelSaleLG1","SALE");
  lb.put("pLabelSaleLG2","SALE");
  lb.put("insteadOf","από");
  lb.put("insteadOfLG","instead of");
  lb.put("insteadOfLG1","instead of");
  lb.put("insteadOfLG2","instead of");
  lb.put("title","Οι προτάσεις μας");
  lb.put("titleLG","Featured Products");
  lb.put("titleLG1","Featured Products");
  lb.put("titleLG2","Featured Products");
}
%>

<%
product_search.initBean(databaseId, request, response, this, session);

product_search.setDispRows(12);

DbRet dbRet = product_search.doAction(request);

int totalRowCount = product_search.getTotalRowCount();

BigDecimal zero = BigDecimal.ZERO, one = new BigDecimal("1");

PrdPrice prdPrice = null, hdPrice = null, oldPrice = null;

boolean isOffer = false;
%>

<div id="itemsCarouselWrapper">

<h2><%=lb.get("title" + lang)%></h2>

<div id="itemsCarousel" class="owl-carousel">
<%
String prd_img = "", viewPrdPageURL = "";

while (product_search.inBounds() == true) {
  viewPrdPageURL = "http://" + serverName + "/site/product/" + SwissKnife.sefEncode(product_search.getColumn("catName" + lang)) + "/" + SwissKnife.sefEncode(product_search.getColumn("name" + lang)) + "?prdId=" + product_search.getHexColumn("prdId") + "&amp;extLang=" + lang;

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
  <div class="item">
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
  </div>
<%
  product_search.nextRow();
}
product_search.closeResources();
%>
</div>

</div> <!-- /itemsCarouselWrapper -->