<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ page import="java.sql.Timestamp,java.math.BigDecimal,gr.softways.dev.epayment.EPayment,org.apache.commons.codec.binary.Base64" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/epay_proxypay_gate.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("htmlTitle","e-πληρωμές");
  lb.put("htmlTitleLG","e-payments");
  
  lb.put("text1","Μεταφορά σε ασφαλές περιβάλλον για πληρωμή.");
  lb.put("text1LG","You are now being transferred to bank's website.");
}
%>

<%
if (!"1".equals(website_config_epay)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

EPayment epayment = null;

if (session.getAttribute(databaseId + ".epayment") != null) epayment = (EPayment) session.getAttribute(databaseId + ".epayment");
else {
  response.sendRedirect("/problem.jsp");
  return;
}

if (epayment.getPAYNT_CompanyName() == null || epayment.getPAYNT_CompanyName().length() == 0
    || epayment.getPAYNT_Fullname() == null || epayment.getPAYNT_Fullname().length() == 0
    || epayment.getPAYNT_Reason() == null || epayment.getPAYNT_Reason().length() == 0
    || epayment.getPAYNT_Amount() == null || epayment.getPAYNT_Amount().compareTo(new BigDecimal("0")) <= 0) {
    response.sendRedirect("/problem.jsp");
    return;
}

BigDecimal PAYNT_Amount = epayment.getPAYNT_Amount();

String PAYNT_Code = epayment.getPAYNT_Code();

String PAYNT_Instalments = epayment.getPAYNT_Instalments() > 1 ? String.valueOf(epayment.getPAYNT_Instalments()) : "";
String extInstallmentoffset = epayment.getPAYNT_Instalments() > 1 ? "0" : "";

String customerEmail = epayment.getPAYNT_Email();

session.setAttribute(databaseId + ".epayment", null);

String[] values = Configuration.getValues(new String[] {"proxypayURL","proxypayMerchantID","proxypayConfirmPass"});

String proxypayURL = values[0],
    proxypayMerchantID = values[1],
    proxyPayConfirmPass = values[2];

String checkout_lang = null;
if ("".equals(lang)) checkout_lang = "el";
else checkout_lang = "en";

String orderDesc = "e-payments";

String confirmUrl = URI_SCHEME + serverName + "/epay_cardlink_confirm.do",
    cancelUrl = URI_SCHEME + serverName + "/epay_cardlink_confirm.do";
      
String data = proxypayMerchantID + checkout_lang + PAYNT_Code + orderDesc +
    PAYNT_Amount.setScale(2, BigDecimal.ROUND_HALF_UP) + "EUR" +
    customerEmail + extInstallmentoffset + PAYNT_Instalments + confirmUrl + cancelUrl + proxyPayConfirmPass;

java.security.MessageDigest mdigest = java.security.MessageDigest.getInstance("SHA-1");
byte [] digestResult = mdigest.digest(data.getBytes("UTF-8"));
String digest = new String(Base64.encodeBase64(digestResult));
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/include/metatags.jsp" %>

  <title><%=lb.get("htmlTitle" + lang)%></title>
</head>

<body>

<div id="site">
    
<%@ include file="/include/top.jsp" %>

<div id="swContentSite">
  
<div class="container">
  
<div style="height:300px;">
<div>
  <div style="margin:100px 0 20px 350px;"><%=lb.get("text1" + lang)%></div>
  <div style="margin:0 0 0 400px;"><img src="/images/loading_big.gif" alt=""/></div>
</div>
</div>

<form name="epayForm" id="epayForm" method="POST" action="<%=proxypayURL%>" accept-charset="UTF-8">
<input type="hidden" name="mid" value="<%=proxypayMerchantID%>">
<input type="hidden" name="lang" value="<%=checkout_lang%>">
<input type="hidden" name="orderid" value="<%=PAYNT_Code%>">
<input type="hidden" name="orderDesc" value="<%=orderDesc%>">
<input type="hidden" name="orderAmount" value="<%=PAYNT_Amount.setScale(2, BigDecimal.ROUND_HALF_UP)%>">
<input type="hidden" name="currency" value="EUR">
<input type="hidden" name="payerEmail" value="<%=customerEmail%>">
<input type="hidden" name="extInstallmentoffset" value="<%=extInstallmentoffset%>">
<input type="hidden" name="extInstallmentperiod" value="<%=PAYNT_Instalments%>">
<input type="hidden" name="confirmUrl" value="<%=confirmUrl%>">
<input type="hidden" name="cancelUrl" value="<%=cancelUrl%>">
<input type="hidden" name="digest" value="<%=digest%>">
</form>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
$(function() {
  $('#epayForm').submit();
});
</script>

</div> <!-- /site -->

</body>
</html>