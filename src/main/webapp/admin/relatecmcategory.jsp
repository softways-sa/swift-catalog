<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ page import="gr.softways.dev.swift.cmcategory.CMCategory" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="sw_CMCBrowser" scope="session" class="gr.softways.dev.swift.cmcategory.AdminCMCBrowser" />

<%
request.setAttribute("admin.topmenu","content");

sw_CMCBrowser.initBean(databaseId, request, response, this, session); 

String action = request.getParameter("action1") == null ? "" : request.getParameter("action1"),
       CMCCode = request.getParameter("CMCCode") == null ? "" : request.getParameter("CMCCode"),
       CMRCode = request.getParameter("CMRCode") == null ? "" : request.getParameter("CMRCode"),
       urlFailure = "/" + appDir + "admin/problem.jsp",
       anchorName = request.getParameter("anchorName") == null ? "" : request.getParameter("anchorName");

String urlBack = "/" + appDir + "admin/processcmrow.jsp?action1=EDIT&CMRCode=" + CMRCode + "&goLabel=CMCat";

boolean openAllCat = false;

int CMCDepth = 0;

if (action.equals("SEARCH")) {
    sw_CMCBrowser.fetchCMCategories(openAllCat, CMRCode, true);
}
else if (action.equals("EXPAND_CATEGORY")) {
    sw_CMCBrowser.switchCMCategory(CMCCode);
}

String pageTitle = "Περιεχόμενο<span class=\"menuPathTD\" id=\"white\">|</span>&nbsp;Σελίδα&nbsp;<span class=\"menuPathTD\" id=\"white\">|</span>&nbsp;Συσχέτιση με ενότητα";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%@ include file="include/metatags.jsp" %>

    <title>eΔιαχείριση</title>
    
    <SCRIPT LANGUAGE="JavaScript" SRC="js/jsfunctions.js"></SCRIPT>
		
    <SCRIPT LANGUAGE="JavaScript">
        function expandCMCategory(CMCCode, anchorName) {
            document.searchForm.action1.value = "EXPAND_CATEGORY";
            document.searchForm.CMCCode.value = CMCCode;

            document.searchForm.anchorName.value = anchorName;
            
            document.searchForm.action = "relatecmcategory.jsp";
            document.searchForm.submit();
        }

        function relateCMCategory(CMCCode) {
            document.searchForm.action1.value = "INSERT";
            document.searchForm.CMCCode.value = CMCCode;
            
            document.searchForm.urlSuccess.value = "<%="/" + appDir + "admin/processcmrow.jsp?action1=EDIT&CMRCode=" + CMRCode + "&goLabel=CMCat"%>";
            
            document.searchForm.action = "/servlet/admin/RelateCMRowCMCategory";
            
            document.searchForm.submit();
        }
    </SCRIPT>
</head>

<body <%= bodyString %>>

    <%@ include file="include/top.jsp" %>
    <table width="0" border="0" cellspacing="2" cellpadding="20">
    <tr>
    <td class="menuPathTD" align="middle"><b><%= pageTitle %></b></td>
    </tr>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <%@ include file="include/left.jsp" %>
        
        <td valign="top">
            <form name="buttonForm" action="" method="">
            <input type="button" value="Επιστροφή" onclick='location.href="<%= urlBack %>"' class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'" />
            </form>
        
            <table width="0" border="0" cellspacing="0" cellpadding="2">
            
            <form name="searchForm" action="" method="POST">
            <input type="hidden" name="action1" value="">
            <input type="hidden" name="CMCCode" value="">
            <input type="hidden" name="CMRCode" value="<%= CMRCode %>">
            <input type="hidden" name="urlSuccess" value="">
            <input type="hidden" name="databaseId" value="<%= databaseId %>">
            <input type="hidden" name="urlNoAccess" value="<%= urlNoAccess %>">
            <input type="hidden" name="urlFailure" value="<%= urlFailure %>">
            <input type="hidden" name="anchorName" value="">
            
            <%
            CMCategory CMCat = null;
        
            int size = sw_CMCBrowser.getSize();
        
            sw_CMCBrowser.firstCMCategory();
            for (int i=0; i<size; i++) {
                CMCat = sw_CMCBrowser.nextCMCategory();
                CMCCode = CMCat.getCMCCode();
                CMCDepth = CMCat.getCMCDepth();
        
                if (CMCat.isVisible() == true) { %>
                    <tr>    
                        <a name="<%= i %>"></a>
                        <%
                        for (int spaces=1; spaces<CMCDepth; spaces++) { %>
                            <td>&nbsp;</td>
                        <% } %>
                        <td>
                        <%
                        if (CMCat.getCMCParentFlag().equals("1")) { %>
                            <a class="resultsLink" href="javascript:expandCMCategory('<%= CMCCode %>','<%= i %>')">(+)</a>
                        <% 
                        }
                        if (!CMCat.isRelated() ) { %><a class="resultsLink" href="javascript:relateCMCategory('<%= CMCCode %>')"><%= CMCat.getCMCName() %></a><% } else { %><span class="text" id="black"><%= CMCat.getCMCName() %></span><% } %>
                        </td>
                    </tr>
                <%
                }
            }
            %>
            </form>
            </table>
        
            <% if (anchorName.length() > 0) { %>
                <SCRIPT LANGUAGE="JavaScript">
                    document.location.hash = "<%= anchorName %>";
                </SCRIPT>
            <% } %>
        
            <br/>
            <form name="buttonForm1" action="" method="">
            <input type="button" value="Επιστροφή" onclick='location.href="<%= urlBack %>"' class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'" />
            </form>
        
        </td>
        
        <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>
  
</body>
</html>