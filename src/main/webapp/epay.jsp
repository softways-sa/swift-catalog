<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ page import="java.sql.Timestamp,gr.softways.dev.epayment.EPayment,java.text.NumberFormat,java.util.Locale" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/epay.jsp"; %>

<jsp:useBean id="helperBean" scope="page" class="gr.softways.dev.swift.cmrow.Present" />

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
  
  lb.put("jsPAYNT_CompanyName","Παρακαλούμε συμπληρώστε την επωνυμία της επιχείρησης.");
  lb.put("jsPAYNT_CompanyNameLG","Please enter company.");
  lb.put("jsPAYNT_Fullname","Παρακαλούμε συμπληρώστε το ονοματεπώνυμο σας.");
  lb.put("jsPAYNT_FullnameLG","Please enter full name.");
  lb.put("jsPAYNT_Reason","Παρακαλούμε συμπληρώστε την αιτιολογία.");
  lb.put("jsPAYNT_ReasonLG","Please enter paying for.");
  lb.put("jsPAYNT_Email","Παρακαλούμε ελέγξτε το email σας.");
  lb.put("jsPAYNT_EmailLG","Please check email.");
  lb.put("jsPAYNT_Amount","Παρακαλούμε ελέγξτε το ποσό.");
  lb.put("jsPAYNT_AmountLG","Please check amount.");
  
  lb.put("text1","Συμπληρώστε τα παρακάτω πεδία και πατήστε στο κουμπί συνέχεια.");
  lb.put("text1LG","Please enter the following fields and click on continue.");
  
  lb.put("btn","συνέχεια");
  lb.put("btnLG","continue");
  lb.put("select","επιλέξτε");
  lb.put("selectLG","select");
}
%>

<%
if (!"1".equals(website_config_epay)) {response.sendError(HttpServletResponse.SC_FORBIDDEN); return;}

EPayment epayment = null;

if (session.getAttribute(databaseId + ".epayment") != null) epayment = (EPayment) session.getAttribute(databaseId + ".epayment");
else epayment = new EPayment();

NumberFormat nf = NumberFormat.getNumberInstance( SwissKnife.Locale_GR );
nf.setGroupingUsed(false);
nf.setMinimumFractionDigits(2);
nf.setMaximumFractionDigits(2);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/include/metatags.jsp" %>

  <title><%= lb.get("htmlTitle" + lang) %></title>
  
  <style>#epayForm input, #epayForm select {padding: 5px;}</style>
</head>

<body>

<div id="site">
    
<%@ include file="/include/top.jsp" %>

<div id="swContentSite">
  
<div class="container">

<form id="epayForm" name="epayForm" action="<%=URI_SCHEME + serverName + "/epay_checkout.jsp"%>" method="post" onsubmit="return confirmOrder();">

  <div class="sectionHeader"><%=lb.get("htmlTitle" + lang)%></div>

  <% 
  helperBean.initBean(databaseId, request, response, this, session);
  helperBean.getCMRow(EPAY_INTRO_TEXT_CMCCode, "");
  while (helperBean.inBounds() == true) {out.println(helperBean.getColumn("CMRText" + lang)); helperBean.nextRow();}
  helperBean.closeResources();
  %>

  <div style="padding-bottom:20px;">

  <div style="margin:10px 0 10px 0;"><%=lb.get("text1" + lang)%></div>

  <table width="0" cellpadding="4" cellspacing="0" border="0">
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_CompanyName" + lang)%></td>
      <td align="left"><input class="text" type="text" name="PAYNT_CompanyName" value="<%if (epayment.getPAYNT_CompanyName() != null) out.print(epayment.getPAYNT_CompanyName()); %>" size="45" maxlength="100" /></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_Fullname" + lang)%></td>
      <td align="left"><input class="text" type="text" name="PAYNT_Fullname" value="<%if (epayment.getPAYNT_Fullname() != null) out.print(epayment.getPAYNT_Fullname());%>" size="45" maxlength="100" /></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_Reason" + lang)%></td>
      <td align="left"><input class="text" type="text" name="PAYNT_Reason" value="<%if (epayment.getPAYNT_Reason() != null) out.print(epayment.getPAYNT_Reason());%>" size="45" maxlength="250" /></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;">Email</td>
      <td align="left"><input class="text" type="text" name="PAYNT_Email" value="<%if (epayment.getPAYNT_Email() != null) out.print(epayment.getPAYNT_Email());%>" size="45" maxlength="100" /></td>
  </tr>
  <tr>
      <td align="right" style="font-weight:bold;"><%=lb.get("PAYNT_Amount" + lang)%></td>
      <td align="left"><input style="text-align:right;" class="text" type="text" id="PAYNT_Amount" name="PAYNT_Amount" value="<%if(epayment.getPAYNT_Amount() != null) out.print(nf.format(epayment.getPAYNT_Amount()));%>" size="15" maxlength="20"/> EUR</td>
  </tr>
  <%if ("".equals(lang)) {%>
    <tr>
      <td align="right">&nbsp;</td>
      <td align="left"><div style="width:330px; font-size:90%;">Παρακαλούμε χρησιμοποιήστε το κόμμα (,) ως σύμβολο υποδιαστολής. Παράδειγμα: Το ποσό δέκα χιλιάδες πεντακόσια ΕΥΡΩ και σαράντα λεπτά, πρέπει να καταχωρηθεί 10500,40</div></td>
    </tr>
  <%}%>
  <tr>
    <td align="right"><b><%=lb.get("PAYNT_Instalments" + lang)%></b></td>
    <td align="left">
      <select id="PAYNT_Instalments" name="PAYNT_Instalments" class="inputFrmField"></select>
    </td>
  </tr>
  </table>

  <div style="margin-top: 10px;"><button type="submit" class="btn btn-primary btn-md" name="submitbtn" id="submitbtn"><%=lb.get("btn" + lang)%>&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></button></div>

  </div>

</form>

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
var isSubmitted = false;
var regExpAmt = new RegExp("^[0-9,]+$");

var doseis;

function confirmOrder() {
  if (isSubmitted) {
    return false;
  }
  else if (document.epayForm.PAYNT_CompanyName.value == "") {
    alert("<%=lb.get("jsPAYNT_CompanyName" + lang)%>");
    document.epayForm.PAYNT_CompanyName.focus();
    return false;
  }
  else if (document.epayForm.PAYNT_Fullname.value == "") {
    alert("<%=lb.get("jsPAYNT_Fullname" + lang)%>");
    document.epayForm.PAYNT_Fullname.focus();
    return false;
  }
  else if (document.epayForm.PAYNT_Reason.value == "") {
    alert("<%=lb.get("jsPAYNT_Reason" + lang)%>");
    document.epayForm.PAYNT_Reason.focus();
    return false;
  }
  else if (emailCheck(document.epayForm.PAYNT_Email.value) == false) {
    alert("<%=lb.get("jsPAYNT_Email" + lang)%>");
    document.epayForm.PAYNT_Email.focus();
    return false;
  }

  var isOK = true;

    if(!ValidateValue(document.epayForm.PAYNT_Amount.value, false, regExpAmt, document.epayForm.PAYNT_Amount)
                        ||document.epayForm.PAYNT_Amount.value.replace(/,/, ".")==0
                        ||document.epayForm.PAYNT_Amount.value > 1000000)
                {
                        alert("Παρακαλούμε ελέξτε το ποσό.");
                        isOK = false;	
                }
                if (isOK)
                {
                        if (!CheckAmountField(document.epayForm.PAYNT_Amount.value, "Παρακαλούμε ελέξτε το ποσό.", document.epayForm.PAYNT_Amount))
                        {
                                isOK = false;
                        }
                }

    if (isOK == false) return false;

    isSubmitted = true;
    return true;
}

function ValidateValue(Value, AllowEmpty, regExp, Obj) {
Value = remove_spaces(Value);
if (Value=='') return(AllowEmpty);
var arr = regExp.exec(Value);
try
{
var idx = arr.index;
Obj.value = Value;

return(true);
}
catch(e)
{
return(false);
}
}

function remove_spaces(str) {
while (str.charAt(str.length-1)==' ')
{
str = str.substring(0, str.length-1)
}
while (str.charAt(0)==' ')
{
str = str.substring(1, str.length)
}
while (str.search('  ')!=-1)
{
str = str.replace('  ', ' ');
if (str.length == 1) str='';
}
    return(str);
}


function CheckAmountField(text, errMsg, element) {

function CheckCommas()
{
if (text.indexOf(",", 0)!= text.lastIndexOf(",", text.length))  return false
if (text.substr(text.indexOf(",", 0)+1, text.length).length!=2) return false
return true
}
function CheckPoints()
{
function CheckPointsInt(str)
{
  if (str =='') return true
  str1=str.substr(0, str.indexOf(".", 0))
  str2=str.substr(str1.length+1, str.length)
  result=(str1.length==3)
  if (result) result=CheckPointsInt(str2)
  return result
}
text2=text
if (text2.indexOf(",", 0)!=-1) text2=text2.substr(0, text2.indexOf(",", 0))
text2=text2.substr(text2.indexOf(".", 0)+1, text2.length)+'.'		
return CheckPointsInt(text2)
}
flag=(text!="")
if (flag)
{
haspoints=(text.indexOf(".", 0)!=-1)
hascommas=(text.indexOf(",", 0)!=-1)
if (hascommas) flag=CheckCommas()		
if ((flag)&&(haspoints)) flag=CheckPoints()		
}
if (!flag)
{ 
//if (errMsg!="") s=errMsg+'. '; else s='';
//s=s+errMsg
alert (errMsg); 
if (element!=null) element.focus()
}

return flag
}

$(function() {
    doseis = $.parseJSON('{ "doseis":['
      + ' {"epiloges":[ {"optionValue":"0", "optionDisplay":"<%=lb.get("select" + lang)%>"} ]}'
      + ',{"epiloges":[ {"optionValue":"0", "optionDisplay":"<%=lb.get("select" + lang)%>"}, {"optionValue":"2", "optionDisplay":"2"}, {"optionValue":"3", "optionDisplay":"3"} ]}'
      + ',{"epiloges":[ {"optionValue":"0", "optionDisplay":"<%=lb.get("select" + lang)%>"}, {"optionValue":"2", "optionDisplay":"2"}, {"optionValue":"3", "optionDisplay":"3"}, {"optionValue":"4", "optionDisplay":"4"}, {"optionValue":"5", "optionDisplay":"5"}, {"optionValue":"6", "optionDisplay":"6"}]}'
      + ' ] }');

    function updateDoseis(poso, doseisSelected) {
      var amnt = poso.replace(/,/, ".");

      if (amnt > 50.00 && amnt <= 300.00) fillDoseis(doseis.doseis[1].epiloges, doseisSelected);
      else if (amnt > 300.00) fillDoseis(doseis.doseis[2].epiloges, doseisSelected);
      else fillDoseis(doseis.doseis[0].epiloges, doseisSelected);

      $('#PAYNT_Instalments').fadeOut( function(){$('#PAYNT_Instalments').fadeIn()} );
    }

    function fillDoseis(j, doseisSelected) {
        var options = '';

        for (var i = 0; i < j.length; i++) {
            options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>';
        }

        $("#PAYNT_Instalments").html(options);
        $("#PAYNT_Instalments option:first").attr('selected', 'selected');

        if (doseisSelected > 0) $("#PAYNT_Instalments option[value='" + doseisSelected + "']").attr('selected', 'selected');
    }

    $('#PAYNT_Amount').change(function() {
      updateDoseis(this.value, 0);
    });

    updateDoseis( $('#PAYNT_Amount').val(), '<%=epayment.getPAYNT_Instalments()%>');
});
</script>

</div> <!-- /site -->

</body>
</html>