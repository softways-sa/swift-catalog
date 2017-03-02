<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/epay_proxypay_ok.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("htmlTitle","e-πληρωμές");
  lb.put("htmlTitleLG","e-payments");
  
  lb.put("msgOK","Η πληρωμή σας ολοκληρώθηκε.");
  lb.put("msgOKLG","Your payment has been completed.");

  lb.put("msgOK2","Σύντομα θα λάβετε ένα email με τις λεπτομέρειες τις πληρωμής σας.");
  lb.put("msgOK2LG","Shortly you will receive an email with the details of your payment.");

  lb.put("msgThanks","Σας ευχαριστούμε πολύ.");
  lb.put("msgThanksLG","Thank you.");
}
%>

<%
if (!"1".equals(website_config_epay)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}
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
  
<p><strong><%=lb.get("msgOK" + lang)%></strong></p>
<p><%=lb.get("msgOK2" + lang)%></p>
<p><%=lb.get("msgThanks" + lang)%></p>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

</div> <!-- /site -->

</body>
</html>