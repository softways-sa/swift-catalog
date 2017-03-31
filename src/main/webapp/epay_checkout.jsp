<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ page import="java.sql.Timestamp,gr.softways.dev.epayment.EPayment,java.text.NumberFormat,java.util.Locale" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/epay_checkout.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
  lb.put("htmlTitle","e-πληρωμές");
  lb.put("htmlTitleLG","e-payments");

  lb.put("PAYNT_CompanyName","Επωνυμία επιχείρησης");
  lb.put("PAYNT_CompanyNameLG","Company");
  lb.put("PAYNT_Fullname","Ονομ/μο");
  lb.put("PAYNT_FullnameLG","Full name");
  lb.put("PAYNT_Reason","Αιτιολογία");
  lb.put("PAYNT_ReasonLG","Paying for");
  lb.put("PAYNT_Amount","Ποσό");
  lb.put("PAYNT_AmountLG","Amount");
  lb.put("PAYNT_Instalments","Δόσεις");
  lb.put("PAYNT_InstalmentsLG","Instalments");
  
  lb.put("text1","Για να ολοκληρωθεί η διαδικασία πληρωμής θα μεταφερθείτε σε ασφαλή τόπο της τράπεζας όπου θα σας ζητηθούν τα στοιχεία της πιστωτικής σας κάρτας.");
  lb.put("text1LG","To complete payment you will be transfered to banks's secure website and you will be asked for your credit card information.");
  
  lb.put("btn","συνέχεια στην τράπεζα");
  lb.put("btnLG","continue to bank");
  lb.put("editbtn","διόρθωση στοιχείων");
  lb.put("editbtnLG","edit");
  
  lb.put("confirmHeader","Επιβεβαιώστε τα στοιχεία σας παρακάτω.");
  lb.put("confirmHeaderLG","Confirm your information below.");
  
  lb.put("termsofuse","Διάβασα και αποδέχομαι τους όρους χρήσης");
  lb.put("termsofuseLG","I accept the terms of use");
  lb.put("termsofuseLink","(Διαβάστε τους όρους χρήσης)");
  lb.put("termsofuseLinkLG","(See terms of use)");
  lb.put("jstermsofuse","Πρέπει να αποδεχτείτε τους όρους χρήσης για να συνεχίσετε.");
  lb.put("jstermsofuseLG","You have to accept the terms of use to continue.");
}
%>

<%
if (!"1".equals(website_config_epay)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

EPayment epayment = new EPayment();
   
String PAYNT_CompanyName = request.getParameter("PAYNT_CompanyName"),
    PAYNT_Fullname = request.getParameter("PAYNT_Fullname"),
    PAYNT_Reason = request.getParameter("PAYNT_Reason"),
    PAYNT_Email = request.getParameter("PAYNT_Email");
    
BigDecimal PAYNT_Amount = SwissKnife.parseBigDecimal(request.getParameter("PAYNT_Amount"), "el", "GR");

int PAYNT_Instalments = 0;
try {
    PAYNT_Instalments = Integer.parseInt( request.getParameter("PAYNT_Instalments") );
}
catch (Exception e) { }

if (PAYNT_CompanyName == null || PAYNT_CompanyName.length() == 0
    || PAYNT_Fullname == null || PAYNT_Fullname.length() == 0
    || PAYNT_Reason == null || PAYNT_Reason.length() == 0
    || PAYNT_Amount == null || PAYNT_Amount.compareTo(new BigDecimal("0")) <= 0) {
    response.sendRedirect("/epay.jsp");
    return;
}

epayment.setPAYNT_Code(SwissKnife.buildPK());

epayment.setPAYNT_CompanyName(PAYNT_CompanyName);
epayment.setPAYNT_Fullname(PAYNT_Fullname);
epayment.setPAYNT_Reason(PAYNT_Reason);
epayment.setPAYNT_Email(PAYNT_Email);
epayment.setPAYNT_Amount(PAYNT_Amount);
epayment.setPAYNT_Instalments(PAYNT_Instalments);

session.setAttribute(databaseId + ".epayment", epayment);
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

  <div class="sectionHeader"><%=lb.get("htmlTitle" + lang)%></div>

  <p style="margin-bottom:10px;"><%=lb.get("confirmHeader" + lang)%></p>
  <table width="0" cellpadding="5" cellspacing="2" border="0">
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_CompanyName" + lang)%></td>
      <td align="left" style="border:1px solid #2D2D2D;"><%=epayment.getPAYNT_CompanyName()%></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_Fullname" + lang)%></td>
      <td align="left" style="border:1px solid #2D2D2D;"><%=epayment.getPAYNT_Fullname()%></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_Reason" + lang)%></td>
      <td align="left" style="border:1px solid #2D2D2D;"><%=epayment.getPAYNT_Reason()%></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;">Email</td>
      <td align="left" style="border:1px solid #2D2D2D;"><%=epayment.getPAYNT_Email()%></td>
  </tr>
  <tr>
      <td align="right" valign="top" style="font-weight:bold;"><%=lb.get("PAYNT_Amount" + lang)%></td>
      <td align="left" style="border:1px solid #2D2D2D;">&euro;<%=SwissKnife.formatNumber(epayment.getPAYNT_Amount(),"el","GR",2,2)%></td>
  </tr>
  <tr>
    <td align="right" valign="top" style="font-weight:bold;"><%=lb.get("PAYNT_Instalments" + lang)%></td>
    <td align="left" style="border:1px solid #2D2D2D;"><%=epayment.getPAYNT_Instalments()%></td>
  </tr>
  </table>

  <div style="margin-top: 15px;"><%=lb.get("text1" + lang)%></div>
  
  <div style="margin: 15px 0 0 0;"><input type="checkbox" id="accepttermsoufuse" name="accepttermsoufuse" value="Y" /> <label for="accepttermsoufuse"><%=lb.get("termsofuse" + lang) %></label> <a href="/site/page/Όροι-Χρήσης?CMCCode=300107&extLang=<%=lang%>" target="_blank"><%=lb.get("termsofuseLink" + lang) %></a></div>
  
  <div style="margin-top: 10px;">
    <a href="/epay.jsp"><button type="button" class="btn btn-primary btn-md" name="submitbtn" id="submitbtn"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;<%=lb.get("editbtn" + lang)%></button></a>
    <a id="payLink" href="<%=URI_SCHEME + serverName + "/epay_checkout.do"%>"><button type="button" class="btn btn-primary btn-md" name="submitbtn" id="submitbtn"><%=lb.get("btn" + lang)%>&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></button></a>
  </div>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
$("#payLink").click(function(){
  if ($("input[name=accepttermsoufuse]:checked").length == 0) {
    alert("<%=lb.get("jstermsofuse" + lang)%>");
    return false;
  }
});
</script>

</div> <!-- /site -->

</body>
</html>