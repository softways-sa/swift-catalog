<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 
<%@ page errorPage="problem.jsp" %>

<%@ page import="gr.softways.dev.util.DbRet" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<%
String urlSuccess = "/" + appDir + "admin/groups.jsp?action1=UPDATE_SEARCH&goLabel=results",
       urlFailure = "/" + appDir + "admin/problem.jsp",
       urlReturnGroup = "groups.jsp?goLabel=results";

int rows = 0;
  
String title = "ΚΑΤΑΧΩΡΗΣΗ ΝΕΑΣ ΟΜΑΔΑΣ ΧΡΗΣΤΩΝ";
%>

<HTML>
<HEAD>
    <%@ include file="include/metatags.jsp" %>

    <TITLE><%= title %></TITLE>

    <SCRIPT LANGUAGE="javascript">
        function validateForm(){
            if (document.inputForm.userGroupId.value == ""){
                alert("Παρακαλούμε εισάγετε τον κωδικό");
                document.inputForm.userGroupId.focus();
                return false;
            }
            else if (document.inputForm.userGroupName.value == ""){
                alert("Παρακαλούμε εισάγετε το όνομα");
                document.inputForm.userGroupName.focus();
                return false;
            } 
            return true;
        } 
    </SCRIPT>  

    <SCRIPT LANGUAGE="JavaScript" SRC="js/jsfunctions.js"></SCRIPT>
</HEAD>

<BODY <%= bodyString %>>

    <CENTER>
    <BR>
       
    <table width="80%" cellspacing="1" cellpadding="5" border="0" class="tablecolor">
    <tr>
        <td class="tableheader" colspan="2" align="center">ΣΤΟΙΧΕΙΑ ΟΜΑΔΑΣ ΧΡΗΣΤΩΝ</td>
    </tr>
    <form name="inputForm" method="POST" ACTION="<%= response.encodeURL("/servlet/admin/UserGroups") %>">
        <input type="Hidden" name="action1" value="INSERT">
        <input type="Hidden" name="urlSuccess" value="<%= urlSuccess %>">
        <input type="Hidden" name="urlFailure" value="<%= urlFailure %>">
        <input type="Hidden" name="databaseId" value="<%= databaseId %>">
        <input type="Hidden" NAME="buttonPressed" VALUE="0">
    
        <TR class="trcolor1">
            <TD><span class="normalBold">Κωδικός</span></TD>
            <TD><INPUT TYPE="text" NAME="userGroupId" SIZE="10" MAXLENGTH="25" onFocus="this.className='inputFocused'" onBlur="this.className='input'" class="input"></TD>
        </TR>
        <TR class="trcolor1">
            <TD><span class="normalBold">Ονομασία</span></TD>
            <TD><INPUT TYPE="text" NAME="userGroupName" SIZE="25" MAXLENGTH="25" onFocus="this.className='inputFocused'" onBlur="this.className='input'" class="input"></TD>
        </TR>
        <TR class="trcolor1">
            <TD><span class="normalBold">Περιγραφή</span></TD>
            <TD><INPUT TYPE="text" NAME="userGroupDescr" SIZE="40" MAXLENGTH="100" onFocus="this.className='inputFocused'" onBlur="this.className='input'" class="input"></TD>
        </TR>
        <TR class="trcolor1">
            <TD><span class="normalBold">Εξ' ορισμού ομάδα (κύρια χρήση για τους πελάτες του καταστήματος)</span></TD>
            <TD>
                <select name="userGroupDefFlag" style="HEIGHT: 25px; WIDTH: 200px" width="200" height="25" class="select">
                    <option value="0">ΟΧΙ</option>
                    <option value="1">ΝΑΙ</option>
                </select>
            </TD>
        </TR>
        <TR class="trcolor1">
            <TD><span class="normalBold">Δυνατότητα σύνδεσης στο σύστημα διαχείρισης του καταστήματος</span></TD>
            <TD>
                <select name="userGroupGrantLogin" style="HEIGHT: 25px; WIDTH: 200px" width="200" height="25" class="select">
                    <option value="0">ΟΧΙ</option>
                    <option value="1">ΝΑΙ</option>
                </select>
            </TD>
        </TR>
        <TR class="tablefooter">
            <TD colspan="2" align="center">
                <input type="Button" value="Δημιουργία" onClick='if (validateForm() == true){ if (checkButton(document.inputForm.buttonPressed) == true){ document.inputForm.submit(); } else return false }' onMouseOver="this.className='submitFocused'" onMouseOut="this.className='submit'" class="submit">
                <input type="Button" value="Επιστροφή" onClick='location.href="<%= urlReturnGroup %>"' onMouseOver="this.className='submitFocused'" onMouseOut="this.className='submit'" class="submit">
            </TD>
        </TR>
    </form>
    </TABLE>

    <br>
    </center>

</BODY>
</HTML>
