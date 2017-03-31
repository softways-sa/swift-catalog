<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%@ include file="include/metatags.jsp" %>
    
    <title>eΔιαχείριση</title>
	
    <script language="JavaScript" src="js/jsfunctions.js"></script>
</head>

<body <%= bodyString %>>
    <%@ include file="include/top.jsp" %>
    
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <%@ include file="include/left.jsp" %>
        
        <td valign="top" class="indexLogoTD"></br></br></br>
        <div align="center">
            
        <table width="0" cellspacing="4" cellpadding="10" border="0">
        <tr>
          <td><img src="images/1pages.png" alt="" border=""></td>
          <td valign="top">            
            <table width="0" cellspacing="4" cellpadding="4" border="0">
            <tr>
              <td class="inputFrmLabelTDheader"><b>Περιεχόμενο</b></td>
            </tr>
            <tr>
              <td><a href="/admin/processcmrow.jsp" class="indexLink">Νέα σελίδα</a></td>
            </tr>	
            <tr>
              <td><a href="/admin/cmrow.jsp?action1=SEARCH" class="indexLink">Τροποποίηση σελίδας</a></td>
            </tr>
            <tr>
              <td><a href="/admin/cmrow.jsp?CMCCode=0101&action1=SEARCH" class="indexLink">Αρχική σελίδα</a></td>
            </tr>
            <tr>
              <td><a href="/admin/cmrow.jsp?CMCCode=1006&action1=SEARCH" class="indexLink">Στοιχεία επικοινωνίας</a></td>
            </tr>
            </table>
          </td>
          <td><img src="images/1various.png" alt="" border=""></td>
          <td valign="top">
            <table width="0" cellspacing="4" cellpadding="4" border="0">
            <tr>
              <td class="inputFrmLabelTDheader"><b>Παραμετροποίηση</b></td>
            </tr>
            <tr>
              <td><a href="/admin/uploadfiles.jsp" class="indexLink">Ανέβασμα αρχείων / εικόνων</a></td>
            </tr>
            <tr>
              <td><a href="/admin/configuration_update.jsp?action1=EDIT&CO_Code=005" class="indexLink">Email παραλήπτη φόρμας επικοινωνίας</a></td>
            </tr>
            </table>
          </td>
        </tr>
        <%
        if ("1".equals(website_config_catalog)) { %>
          <tr>
            <td><img src="images/1products.png" alt="" border=""></td>
            <td valign="top">
              <table width="0" cellspacing="4" cellpadding="4" border="0">
              <tr>
                <td class="inputFrmLabelTDheader"><b>Προϊόντα</b></td>
              </tr>
              <tr>
                <td class="resultsDataTD"><a href="/admin/product_update.jsp" class="indexLink">Νέο προϊόν</a></td>
              </tr>	
              <tr>
                <td class="resultsDataTD"><a href="/admin/product_search.jsp?action1=SEARCH" class="indexLink">Μεταβολή στοιχείων προϊόντος</a></td>
              </tr>
              </table>
            </td>
            <td>&nbsp;</td>			
            <td valign="top">				
              &nbsp;
            </td>
          </tr>
        <% } %>
        </table>
              
        <br/><br/><br/>
            
        </div>
        </td>
        
      <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>

</body>
</html>