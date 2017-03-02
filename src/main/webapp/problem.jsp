<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page isErrorPage="true" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/problem.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
    lb.put("htmlTitle","Σφάλμα");
    lb.put("htmlTitleLG","Error");
    lb.put("htmlTitleLG1","Error");
    lb.put("htmlTitleLG2","Error");
    lb.put("htmlTitleLG3","Error");

    lb.put("Problem","Παρουσιάστηκε κάποιο σφάλμα.");
    lb.put("ProblemLG","There was an error encountered.");
    lb.put("ProblemLG1","There was an error encountered.");
    lb.put("ProblemLG2","There was an error encountered.");
    lb.put("ProblemLG3","There was an error encountered.");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/metatags.jsp" %>

    <title><%= lb.get("htmlTitle" + lang) %></title>

</head>

<body>

<div id="site">
    
<%@ include file="/include/top.jsp" %>

<div id="swContentSite">
  
<div class="container">

<div style="font-weight: bold;"><%= lb.get("Problem" + lang) %></div>

<%
if (exception != null) { %>
    <div style="margin-top:20px;"><% exception.printStackTrace(new java.io.PrintWriter(out)); %></div>
<% } %>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

</div> <!-- /site -->

</body>
</html>