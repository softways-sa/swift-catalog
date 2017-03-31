<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ page import="gr.softways.dev.util.*,java.math.BigDecimal" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="payments_search" scope="session" class="gr.softways.dev.epayment.Search" />

<%
if (!"1".equals(website_config_epay)) {response.sendRedirect("/admin/noaccess.jsp"); return;}

payments_search.initBean(databaseId, request, response, this, session);

request.setAttribute("admin.topmenu","content");

DbRet dbRet = null;
int dispPageNumbers = 10;

payments_search.setDispRows(dispRows);
dbRet = payments_search.doAction(request);

if (dbRet.getAuthError() == 1) {
    payments_search.closeResources();
    response.sendRedirect( response.encodeURL("noaccess.jsp?authCode=" + dbRet.getAuthErrorCode()) );
    return;
}

int currentPage = 0, currentRowCount = 0, totalRowCount = 0, totalPages = 0;

currentRowCount = payments_search.getCurrentRowCount();
totalRowCount = payments_search.getTotalRowCount();
totalPages = payments_search.getTotalPages();
currentPage = payments_search.getCurrentPage();

int start = payments_search.getStart();

String PAYNT_Code = payments_search.getPAYNT_Code(),
    PAYNT_BankPayStatus = payments_search.getPAYNT_BankPayStatus();

String sorted_by_col = payments_search.getSortedByCol(),
       sorted_by_order = payments_search.getSortedByOrder();

String urlSearch = "epayments_search.jsp",
       urlQuerySearch = "epayments_search.jsp?PAYNT_Code=" + SwissKnife.hexEscape(PAYNT_Code),
       urlNew = "epayments_update.jsp",
       action = request.getParameter("action1") == null ? "" : request.getParameter("action1"),
       urlSuccess = "/" + appDir + "admin/epayments_search.jsp?action1=UPDATE_SEARCH&goLabel=results",
       urlFailure = "/" + appDir + "admin/problem.jsp";

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
        document.searchForm.PAYNT_Code.value = "";
        document.searchForm.PAYNT_BankPayStatus.selectedIndex = 0;
    }
    </script>
</head>

<body <%= bodyString %>>

    <%@ include file="include/top.jsp" %>
		
		<table width="0" border="0" cellspacing="2" cellpadding="20">
    <tr>
	<td class="menuPathTD" align="middle"><b>Περιεχόμενο&nbsp;<span class="menuPathTD" id="white">|</span>&nbsp;e-πληρωμές</b></td>
	<td class="menuPathTD" align="middle">&nbsp;</td>
    </tr>
    </table>
    
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
                
                <td>
                    <table width="0" border="0" cellspacing="8" cellpadding="0">
                    <tr>
                        <td>
                            <table width="0" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                <td class="searchFrmTD">
                                    Κατάσταση
                                    <select name="PAYNT_BankPayStatus" class="searchFrmSelect">
                                        <option value="">---</option>
                                        <option value="1" <% if (PAYNT_BankPayStatus.equals("1")) { %>SELECTED <% } %>>AUTHORIZED</option>
                                        <option value="2" <% if (PAYNT_BankPayStatus.equals("2")) { %>SELECTED <% } %>>CAPTURED</option>
                                        <option value="6" <% if (PAYNT_BankPayStatus.equals("6")) { %>SELECTED <% } %>>CANCELLED</option>
                                    </select>
                                </td>
																<td class="searchFrmTD">Κωδ. αναφοράς <input type="text" name="PAYNT_Code" value="<%= PAYNT_Code %>" size="20" class="searchFrmInput" onfocus="this.className='searchFrmInputFocus'" onblur="this.className='searchFrmInput'" /></td>
                            </tr>
                            </table>
                        </td>
                        <td>
                          <table width="0" border="0" cellspacing="2" cellpadding="2">
                          <tr>
                              <td class="searchFrmTD"><input type="submit" name="" value="αναζήτηση" class="loginFrmBtn"  onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'"/></td>
                              <td class="searchFrmTD"><input type="button" name="" value="μηδενισμός" onclick="resetForm()" class="loginFrmBtn"  onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'"/></td>
                          </tr>
                          </table>
                        </td>
                    </tr>
                    </table>
                </td>
                <td align="right">
                    &nbsp;
                </td>
            </tr>
            
            </form>
            
            </table>
            
            <%
            boolean moreDataRows = true;
            
            if (currentRowCount <= 0) moreDataRows = false;
            %>

            <%-- results --%>
            <form name="updateForm" method="post" action="/servlet/admin/EPayment">
            
            <input type="hidden" name="PAYNT_Code" value="">
            <input type="hidden" name="PAYNT_BankPayStatus" value="">
            <input type="hidden" name="action1" value="">
            <input type="hidden" name="urlSuccess" value="<%= urlSuccess %>">
            <input type="hidden" name="urlFailure" value="<%= urlFailure %>">
            <input type="hidden" name="urlNoAccess" value="<%= urlNoAccess %>">
            <input type="hidden" name="databaseId" value="<%= databaseId %>">
            
            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="resultsTBL">
            <tr class="resultsLabelTR">
                <td class="resultsLabelTD">Ημ/νία</td>
                <td class="resultsLabelTD">Κωδ. Συναλλαγής Τράπεζας</td>
                <td class="resultsLabelTD">Κωδ. αναφοράς</td>
                <td class="resultsLabelTD">Επιχείρηση</td>
                <td class="resultsLabelTD">ΑΦΜ</td>
                <td class="resultsLabelTD">Ονομ/μο</td>
                <td class="resultsLabelTD">Αιτιολογία</td>
                <td class="resultsLabelTD">Ποσό</td>
                <td class="resultsLabelTD">Δόσεις</td>
                <td class="resultsLabelTD">Κατάσταση</td>
            </tr>
            <%
            int disp = 0;
            
            // display
            for (disp=0; moreDataRows && disp < dispRows; disp++) {
            %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= SwissKnife.formatDate(payments_search.getTimestamp("PAYNT_PayDate"),"dd-MM-yyyy HH:mm") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_BankTransID") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_Code") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_CompanyName") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_IRSNum") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_Fullname") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_Reason") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&euro;<%= SwissKnife.formatNumber(payments_search.getBig("PAYNT_Amount").setScale(2, BigDecimal.ROUND_HALF_UP),localeLanguage,localeCountry,2,2) %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= payments_search.getColumn("PAYNT_Instalments") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">
                        <select name="PAYNT_BankPayStatus<%=disp%>" class="searchFrmSelect">
                            <option value="">---</option>
                            <option value="1" <% if (payments_search.getColumn("PAYNT_BankPayStatus").equals("1")) { %>SELECTED <% } %>>AUTHORIZED</option>
                            <option value="2" <% if (payments_search.getColumn("PAYNT_BankPayStatus").equals("2")) { %>SELECTED <% } %>>CAPTURED</option>
                            <option value="6" <% if (payments_search.getColumn("PAYNT_BankPayStatus").equals("6")) { %>SELECTED <% } %>>CANCELLED</option>
                        </select>
                        <input type="button" onclick='document.updateForm.PAYNT_Code.value="<%=payments_search.getColumn("PAYNT_Code")%>";document.updateForm.PAYNT_BankPayStatus.value=document.updateForm.PAYNT_BankPayStatus<%=disp%>.options[document.updateForm.PAYNT_BankPayStatus<%=disp%>.selectedIndex].value;document.updateForm.action1.value="UPDATE_BANK_STATUS";document.updateForm.submit();' value="Ενημέρωση">
                    </td>
                </tr>
            <%
                moreDataRows = payments_search.nextRow();
            }
            for (; disp < dispRows; disp++) { %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                </tr>
            <% } %>
            </table>
            </form>
            
            <%-- previus - next buttons --%>
            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="resultsTBL">
            <form name="nav" method="POST" action="<%= urlSearch %>">
            <tr class="resultsFooterTR">
                <td colspan="7"><%@ include file="include/navigationform2.jsp" %></td>
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