<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ page import="gr.softways.dev.util.*" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="manufact_search" scope="session" class="gr.softways.dev.eshop.manufacturer.AdminSearch" />

<%
manufact_search.initBean(databaseId, request, response, this, session);

DbRet dbRet = null;
int dispPageNumbers = 10;

manufact_search.setDispRows(dispRows);
dbRet = manufact_search.doAction(request);

if (dbRet.getAuthError() == 1) {
    manufact_search.closeResources();
    response.sendRedirect( response.encodeURL("noaccess.jsp?authCode=" + dbRet.getAuthErrorCode()) );
    return;
}

int currentPage = 0, currentRowCount = 0, totalRowCount = 0, totalPages = 0;

currentRowCount = manufact_search.getCurrentRowCount();
totalRowCount = manufact_search.getTotalRowCount();
totalPages = manufact_search.getTotalPages();
currentPage = manufact_search.getCurrentPage();

int start = manufact_search.getStart();

String manufactId = manufact_search.getManufactId(),
       manufactName = manufact_search.getManufactName();

String sorted_by_col = manufact_search.getSortedByCol(),
       sorted_by_order = manufact_search.getSortedByOrder();

String urlSearch = response.encodeURL("manufact_search.jsp"),
       urlQuerySearch = "manufact_search.jsp?manufactId=" + SwissKnife.hexEscape(manufactId) + "&manufactName=" + SwissKnife.hexEscape(manufactName)
                                    + "&sorted_by_col=" + SwissKnife.hexEscape(sorted_by_col)
                                    + "&sorted_by_order=" + SwissKnife.hexEscape(sorted_by_order),
       urlNew = response.encodeURL("manufact_update.jsp"),
       action = request.getParameter("action1") == null ? "" : request.getParameter("action1");

String goLabel = request.getParameter("goLabel") == null ? "" : request.getParameter("goLabel");

int rows = 0;
%>

<html>
<head>
    <%@ include file="include/metatags.jsp" %>

    <title>eΔιαχείριση</title>
	
    <script language="JavaScript" src="js/jsfunctions.js"></script>
    
    <script language="JavaScript">
        function resetForm() {
            document.searchForm.manufactId.value="";
            document.searchForm.manufactName.value="";
        }

        function doSortResults(sortedByCol, sortedByOrder) {
            document.searchForm.action1.value = "SORT";

            document.searchForm.sorted_by_col.value = sortedByCol;
            document.searchForm.sorted_by_order.value = sortedByOrder;

            document.searchForm.submit();
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
            
            <form name="searchForm" method="post" action="<%= urlSearch %>">
            
            <input type="hidden" name="action1" value="SEARCH" />
            <input type="hidden" name="goLabel" value="results" />
            <input type="hidden" name="sorted_by_col" value="<%= sorted_by_col %>" />
            <input type="hidden" name="sorted_by_order" value="<%= sorted_by_order %>" />
        
            <tr>
                <td class="menuPathTD" align="middle">
                    <table width="0" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td class="menuPathTD" align="middle"><b>Αποθήκη&nbsp;<span class="menuPathTD" id="white">|</span>&nbsp;Κατασκευαστές</b></td>
                    </tr>
                    </table>
                </td>
                <td>
                    <table width="0" border="0" cellspacing="8" cellpadding="0">
                    <tr>
                        <td>
                            <table width="0" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                <td class="searchFrmTD">Κωδικός <input type="text" name="manufactId" value="<%= manufactId %>" size="20" maxlength="25" class="searchFrmInput" onfocus="this.className='searchFrmInputFocus'" onblur="this.className='searchFrmInput'" /></td>
                                <td class="searchFrmTD">Ονομασία <input type="text" name="manufactName" value="<%= manufactName %>" size="35" maxlength="75" class="searchFrmInput" onfocus="this.className='searchFrmInputFocus'" onblur="this.className='searchFrmInput'" /></td>
                            </tr>
                            </table>
                        </td>
                        <td>
                            <table width="0" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                <td class="searchFrmTD">
                                    <input type="submit" name="" value="αναζήτηση" class="searchFrmBtn" onmouseover="this.className='searchFrmBtnOver'" onmouseout="this.className='searchFrmBtn'" />
                                    <input type="button" name="" value="μηδενισμός" onclick="resetForm()" class="searchFrmBtn" onmouseover="this.className='searchFrmBtnOver'" onmouseout="this.className='searchFrmBtn'" />
                                </td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                    </table>
                </td>
                <td align="right">
                    <table width="0" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><a href="<%= urlNew %>" class="text" id="white"><img src="images/addnew.png" border="0" alt="Νέα εγγραφή" /></a></td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>
                </td>
            </tr>
            
            </form>
            
            </table>
            
            <%
            boolean moreDataRows = true;
            
            if (currentRowCount <= 0) moreDataRows = false;
            %>

            <%-- results --%>
            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="resultsTBL">
            <tr class="resultsLabelTR">
                <td class="resultsLabelTD">Κωδικός <% if (manufact_search.isSortedBy("manufactId","ASC") == false) { %><a href="javascript:doSortResults('manufactId','ASC');"><img src="images/asc.gif" alt="Ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="Ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (manufact_search.isSortedBy("manufactId","DESC") == false) { %><a href="javascript:doSortResults('manufactId','DESC');"><img src="images/desc.gif" alt="Φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="Φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>
                <td class="resultsLabelTD">Ονομασία <% if (manufact_search.isSortedBy("manufactName","ASC") == false) { %><a href="javascript:doSortResults('manufactName','ASC');"><img src="images/asc.gif" alt="Ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="Ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (manufact_search.isSortedBy("manufactName","DESC") == false) { %><a href="javascript:doSortResults('manufactName','DESC');"><img src="images/desc.gif" alt="Φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="Φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>
            </tr>
            <%
            int disp = 0;
            
            // display
            for (disp=0; moreDataRows && disp < dispRows; disp++) {
            %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><a href="<%= response.encodeURL("manufact_update.jsp?action1=EDIT&manufactId=" + manufact_search.getHexColumn("manufactId")) %>" class="resultsLink"><%= manufact_search.getColumn("manufactId") %></a></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><a href="<%= response.encodeURL("manufact_update.jsp?action1=EDIT&manufactId=" + manufact_search.getHexColumn("manufactId")) %>" class="resultsLink"><%= manufact_search.getColumn("manufactName") %></a></td>
                </tr>
            <%
                moreDataRows = manufact_search.nextRow();
            }
            for (; disp < dispRows; disp++) { %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                </tr>
            <% } %>
            <%-- previus - next buttons --%>
            <form name="nav" method="POST" action="<%= urlSearch %>">
            <tr class="resultsFooterTR">
                <td colspan="2"><%@ include file="include/navigationform2.jsp" %></td>
            </tr>
            </form>
            
            </table>
            <%-- end of results --%>
        </td>
        
        <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>
    
</body>
</html>
