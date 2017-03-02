<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 
<%@ page errorPage="problem.jsp" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="processcateg" scope="page" class="gr.softways.dev.util.JSPBean" />

<%
processcateg.initBean(databaseId, request, response, this, session);
   
String action = request.getParameter("action1") != null ? request.getParameter("action1") : "",
       goLabel = request.getParameter("goLabel") == null ? "" : request.getParameter("goLabel"), 
       manufactId = request.getParameter("manufactId") != null ? request.getParameter("manufactId") : "";

String urlSuccess = response.encodeURL("http://" + serverName + "/" + appDir + "admin/manufact_search.jsp?action1=UPDATE_SEARCH&goLabel=results"),
       urlFailure = response.encodeURL("http://" + serverName + "/" + appDir + "admin/problem.jsp"),
       urlCancel = response.encodeURL("http://" + serverName + "/" + appDir + "admin/manufact_search.jsp?goLabel=results"),
       urlSuccessInsAgain = response.encodeURL("http://" + serverName + "/" + appDir + "admin/manufact_update.jsp");

String manufactName = "", manufactNameLG = "";

int found = 0;

String tableHeader = "";

if (action.equals("EDIT")) {
    tableHeader = "Στοιχεία εγγραφής";
    
    found = processcateg.getTablePK("manufact", "manufactId", manufactId);

    if (found < 0) {
        processcateg.closeResources();
        response.sendRedirect( response.encodeURL("noaccess.jsp?authCode=" + found) );
        return;
    }
    else if (found >= 1) {
        manufactName = processcateg.getColumn("manufactName");
        manufactNameLG = processcateg.getColumn("manufactNameLG");
        
        processcateg.closeResources();
    }
}
else {
    tableHeader = "Στοιχεία νέας εγγραφής";
}
%>

<html>
<head>
    <%@ include file="include/metatags.jsp" %>

    <title>eΔιαχείριση</title>
	
    <script language="JavaScript" src="js/jsfunctions.js"></script>
    
    <script language="JavaScript">
        function validateForm(forma) {
            // έλεγξε αν έχουν συμπληρωθεί τα απαραίτητα στοιχεία
            if (isEmpty(forma.manufactId.value)) {
                alert("Παρακαλούμε πληκτρολογήστε τον κωδικό.");
                forma.manufactId.focus();
                return false;
            }
            else if (isEmpty(forma.manufactName.value)) {
                alert("Παρακαλούμε πληκτρολογήστε την ονομασία.");
                forma.manufactName.focus();
                return false;
            }
            else return true;
        }
    </script>
</head>

<body <%= bodyString %>>
    
    <%@ include file="include/top.jsp" %>
    
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <%@ include file="include/left.jsp" %>
        
        <td valign="top">
        
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="searchFrmTBL">
            <tr height="40">
                <td width="30%" class="menuPathTD" align="middle">
                    <table width="0" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                    <td class="menuPathTD" align="middle"><b>Αποθήκη&nbsp;<span class="menuPathTD" id="white">|</span>&nbsp;Κατασκευαστής</b></td>
                    </tr>
                    </table>
                </td>
                <td width="70%" align = "middle">&nbsp;</td>
            </tr>
            </table>
            
            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="inputFrmTBL">
            
            <form name="inputForm" method="post" action="<%= response.encodeURL("/servlet/admin/Manufacturer") %>">
            
            <input type="hidden" name="action1" value="" />
            <input type="hidden" name="urlSuccess" value="" />
            <input type="hidden" name="urlFailure" value="<%= urlFailure %>" />
            <input type="hidden" name="urlNoAccess" value="<%= urlNoAccess %>" />
            <input type="hidden" name="databaseId" value="<%= databaseId %>" />
            
            <input type="hidden" value="0" name="buttonPressed" />
            
            <tr>
                <td class="inputFrmHeader" colspan="2" align="center"><%= tableHeader %></td>
            </tr>
            <tr>
                <td class="inputFrmLabelTD">Κωδικός</td>
                <td class="inputFrmFieldTD"><input type="text" name="manufactId" maxlength="25" value="<%= manufactId %>" <% if (action.equals("EDIT")) out.print("onfocus=\"blur();\""); else out.print("onfocus=\"this.className='inputFrmFieldFocus'\""); %> class="inputFrmField" onblur="this.className='inputFrmField'" /></td>
            </tr>
            <tr>
                <td class="inputFrmLabelTD">Ονομασία</td>
                <td class="inputFrmFieldTD">
                    <table width="0" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                        <td valign="top"><img src="images/flag.gif" /></td>
                        <td class="inputFrmFieldTD"><input type="text" name="manufactName" size="40" maxlength="75" value="<%= manufactName %>" class="inputFrmField" onfocus="this.className='inputFrmFieldFocus'" onblur="this.className='inputFrmField'" /></td>
                    </tr>
                    <tr>
                        <td valign="top"><img src="images/flagLG.gif" /></td>
                        <td class="inputFrmFieldTD"><input type="text" name="manufactNameLG" size="40" maxlength="75" value="<%= manufactNameLG %>" class="inputFrmField" onfocus="this.className='inputFrmFieldFocus'" onblur="this.className='inputFrmField'" /></td></td>
                    </tr>
                    </table>
                </td>
            </tr>
            <tr class="inputFrmFooter">
                <td colspan="2" align="center">
                    <%
                    if (action.equals("EDIT")) { %>
                        <input type="button" value="Αποθήκευση" onClick='if (validateForm(document.inputForm)) { if (checkButton(document.inputForm.buttonPressed) == true) { document.inputForm.urlSuccess.value="<%= urlSuccess %>"; document.inputForm.action1.value="UPDATE"; document.inputForm.submit(); } }' class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                        <input type="button" value="Αποθήκευση/Νέα Καταχώρηση" onClick='if (validateForm(document.inputForm)) { if (checkButton(document.inputForm.buttonPressed) == true) { document.inputForm.urlSuccess.value="<%= urlSuccessInsAgain %>"; document.inputForm.action1.value="UPDATE"; document.inputForm.submit();}}' class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                        <input type="button" value="Διαγραφή" onClick='if (confirm("Είστε σίγουρος(η) για τη διαγραφή") == true) { document.inputForm.urlSuccess.value="<%= urlSuccess %>"; document.inputForm.action1.value="DELETE"; document.inputForm.submit()} else return false;' class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                    <%
                    }
                    else { %>
                        <input type="button" value="Αποθήκευση" onClick='if (validateForm(document.inputForm)) { document.inputForm.action1.value="INSERT"; document.inputForm.urlSuccess.value="<%= urlSuccess %>"; document.inputForm.submit();}' class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                        <input type="button" value="Αποθήκευση/Νέα Καταχώρηση" onClick='if (validateForm(document.inputForm)) { document.inputForm.urlSuccess.value="<%= urlSuccessInsAgain %>"; document.inputForm.action1.value="INSERT"; document.inputForm.submit() }' class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                    <% } %>
                    <input type="button" value="Ακύρωση" onClick="location.href='<%= urlCancel %>'" class="inputFrmBtn" onmouseover="this.className='inputFrmBtnOver'" onmouseout="this.className='inputFrmBtn'" />
                </td>
            </tr>
            
            </form>
            
            </table>
            
        </td>
        
        <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>
    
    <% processcateg.closeResources(); %>
    
</body>
</html>
