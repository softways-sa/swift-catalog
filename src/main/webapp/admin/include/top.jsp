<%@ page pageEncoding="UTF-8" %>

<%@ page import="java.util.*" %>

<div id="header">
  
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td align="right" valign="top">
        <table width="100%" height="0" cellspacing="0" cellpadding="0" border="0" bgcolor="#394049">
        <tr>
            <td width="15%" align="left" valign="top">
                <table width="0" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td class="text" id="white"  valign="top"><a href="<%= "/admin/" + response.encodeURL("index.jsp") %>" class="text" id="white"><img src="images/logo.png" border="0" alt="" title="" hspace="10" /></a></td>                
                </tr>
                </table>
            </td>
            <td width="85%" align="right">
                <table width="0" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td class="text" id="white"><img src="images/user.png" border="0" alt="" title="" hspace="10" /></td>		
                    <td class="text" id="white"><%=authUsername%></td>		
                    <td class="text" id="white"></td>
                    <td class="text"><a href="<%= "/servlet/admin/Logout?urlSuccess=%2Fadmin%2F" %>"><img src="images/exit.png" border="0" alt="Έξοδος" title="Έξοδος" hspace="20" /></a></td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
        <td colspan="2" width="100%" align="left" valign="top" bgcolor="#a3acb7">
          <ul id="menu">
            
            <li class="submenu_size maintab<%if ("content".equals(request.getAttribute("admin.topmenu"))) out.print(" active");%>" id="maintab1">
              <span class="title"><img src="images/admincontent.png" alt="" />Περιεχόμενο</span>
              <ul class="submenu">
                <li><a href="/admin/cmcategory.jsp?action1=SEARCH">Ενότητες</a></li>
                <li><a href="/admin/cmrow.jsp?action1=SEARCH">Σελίδες</a></li>
                <li><a href="/admin/uploadfiles.jsp">Αποστολή αρχείων/εικόνων</a></li>
                <%if ("1".equals(website_config_epay)) {%><li><a href="/admin/epayments_search.jsp?action1=SEARCH">e-πληρωμές</a></li><%}%>
              </ul>
            </li>
            
            <%
            if ("1".equals(website_config_catalog)) { %>
              <li class="submenu_size maintab<%if ("products".equals(request.getAttribute("admin.topmenu"))) out.print(" active");%>" id="maintab3">
                <span class="title"><img src="images/admincatalog.png" alt="" />Αποθήκη</span>
                <ul class="submenu">
                  <li><a href="/admin/product_search.jsp?action1=SEARCH">Προϊόντα</a></li>
                  <li><a href="/admin/category.jsp?action1=SEARCH">Κατηγορίες</a></li>
                  <li><a href="/admin/batchimport.jsp">Μαζική ενημέρωση</a></li>
                  <li><a href="/admin/tax_rate.jsp">Κλίμακες Φ.Π.Α.</a></li>
                </ul>
              </li>
            <%
            } %>
          
          <%
          if ("1".equals(website_config_newsletter)) { %>
            <li class="submenu_size maintab<%if ("newsletter".equals(request.getAttribute("admin.topmenu"))) out.print(" active");%>" id="maintab6">
              <span class="title"><img src="images/adminnewsletter.png" alt="" />Ταχ. Λίστες</span>
              <ul class="submenu">
                <li><a href="/admin/searchemaillists.jsp?action1=SEARCH">Λίστες</a></li>
                <li><a href="/admin/searchemailmembers.jsp">Μέλη</a></li>
                <li><a href="/admin/searchmemperlist.jsp">Μέλη ανα Λίστα</a></li>
                <li><a href="/admin/batchimpemailmembers.jsp">Μαζική Εισαγωγή Μελών</a></li>
                <li><a href="/admin/sendemail.jsp">Αποστολή email</a></li>
              </ul>
            </li>
          <%
          } %>
          
          <li class="submenu_size maintab<%if ("admin".equals(request.getAttribute("admin.topmenu"))) out.print(" active");%>" id="maintab9">
            <span class="title"><img src="images/adminadmin.png" alt="" />Σύστημα</span>
            <ul class="submenu">
              <li><a href="/admin/adminusers.jsp">Χρήστες συστήματος</a></li>
              <li><a href="/admin/configuration_search.jsp?action1=SEARCH">Παράμετροι</a></li>
              <li><a href="<%="/servlet/admin/Logout?urlSuccess=%2Fadmin%2F"%>">Έξοδος</a></li>
            </ul>
          </li>
            
          </ul> <!-- end: menu -->
        </td>
        </tr>
        </table>
    </td>
</tr>
</table>

</div>