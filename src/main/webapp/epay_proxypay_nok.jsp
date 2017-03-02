<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/epay_proxypay_nok.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("htmlTitle","e-πληρωμές");
  lb.put("htmlTitleLG","e-payments");
  
  lb.put("text1","Η πληρωμή σας ακυρώθηκε. Η πιστωτική σας κάρτα δεν χρεώθηκε.");
  lb.put("text1LG","Your payment was cancelled. Your credit card was not charged.");
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
  
<p style="color: red;"><strong><%= lb.get("text1" + lang)%></strong></p>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

</div> <!-- /site -->

</body>
</html>