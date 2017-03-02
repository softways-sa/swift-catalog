<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ page import="gr.softways.dev.util.*" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="sw_relCMRow" scope="session" class="gr.softways.dev.swift.cmrow.AdminRelCMRowSearch" />

<jsp:useBean id="helperBean" scope="page" class="gr.softways.dev.util.JSPBean" />

<%
sw_relCMRow.initBean(databaseId, request, response, this, session);
helperBean.initBean(databaseId, request, response, this, session);

request.setAttribute("admin.topmenu","content");

DbRet dbRet = null;

int dispPageNumbers = 10;
sw_relCMRow.setDispRows(dispRows);
dbRet = sw_relCMRow.doAction(request);

if (dbRet.getAuthError() == 1) {
  sw_relCMRow.closeResources();
  response.sendRedirect( response.encodeURL("noaccess.jsp?authCode=" + dbRet.getAuthErrorCode()) );
  return;
}

int currentPage = 0, currentRowCount = 0, totalRowCount = 0, totalPages = 0;

currentRowCount = sw_relCMRow.getCurrentRowCount();
totalRowCount = sw_relCMRow.getTotalRowCount();
totalPages = sw_relCMRow.getTotalPages();
currentPage = sw_relCMRow.getCurrentPage();

int start = sw_relCMRow.getStart();

String CMCM_CMRCode1 = request.getParameter("CMCM_CMRCode1"),
    CMRTitle = request.getParameter("CMRTitle");

if (CMCM_CMRCode1 != null && CMCM_CMRCode1.length()>0) {
  sw_relCMRow.setCMCM_CMRCode1(CMCM_CMRCode1);
}
if (CMRTitle != null && CMRTitle.length()>0) {
  sw_relCMRow.setCMRTitle(CMRTitle);
}

CMCM_CMRCode1 = sw_relCMRow.getCMCM_CMRCode1();
CMRTitle = sw_relCMRow.getCMRTitle();

if (CMCM_CMRCode1 == null || CMCM_CMRCode1.equals("")) {
  sw_relCMRow.closeResources();
  response.sendRedirect( response.encodeURL("problem.jsp") );
  return;
}

String sorted_by_col = sw_relCMRow.getSortedByCol(),
       sorted_by_order = sw_relCMRow.getSortedByOrder();

String searchCMRDateCreatedDay = sw_relCMRow.getSearchCMRDateCreatedDay(),
   searchCMRDateCreatedMonth = sw_relCMRow.getSearchCMRDateCreatedMonth(),
   searchCMRDateCreatedYear = sw_relCMRow.getSearchCMRDateCreatedYear(),
   searchCMRDateUpdatedDay = sw_relCMRow.getSearchCMRDateUpdatedDay(),
   searchCMRDateUpdatedMonth = sw_relCMRow.getSearchCMRDateUpdatedMonth(),
   searchCMRDateUpdatedYear = sw_relCMRow.getSearchCMRDateUpdatedYear(),
   searchCMRTitle = sw_relCMRow.getSearchCMRTitle(),
   searchCMCCode = sw_relCMRow.getSearchCMCCode();


String urlSearch = response.encodeURL("relatecmrow.jsp"),
       urlReturn = response.encodeURL("http://" + serverName + "/" + appDir + "admin/processcmrow.jsp?action1=EDIT&goLabel=relCMRow&CMRCode=" + CMCM_CMRCode1),
       urlRelCMRow = response.encodeURL("/servlet/admin/RelateCMRow"),
       urlSuccess = response.encodeURL("http://" + serverName + "/" + appDir + "admin/relatecmrow.jsp?action1=UPDATE_SEARCH&goLabel=results"),
       urlFailure = response.encodeURL("http://" + serverName + "/" + appDir + "admin/problem.jsp"),
       action = request.getParameter("action1") == null ? "" : request.getParameter("action1"),
       urlQuerySearch = "relatecmrow.jsp?searchCMRTitle=" + SwissKnife.hexEscape(searchCMRTitle)
                        + "&searchCMRDateCreatedDay=" + SwissKnife.hexEscape(searchCMRDateCreatedDay)        
                        + "&searchCMRDateCreatedMonth=" + SwissKnife.hexEscape(searchCMRDateCreatedMonth)        
                        + "&searchCMRDateCreatedYear=" + SwissKnife.hexEscape(searchCMRDateCreatedYear)        
                        + "&searchCMRDateUpdatedDay=" + SwissKnife.hexEscape(searchCMRDateUpdatedDay)        
                        + "&searchCMRDateUpdatedMonth=" + SwissKnife.hexEscape(searchCMRDateUpdatedMonth)        
                        + "&searchCMRDateUpdatedYear=" + SwissKnife.hexEscape(searchCMRDateUpdatedYear)
                        + "&sorted_by_col=" + SwissKnife.hexEscape(sorted_by_col)
                        + "&sorted_by_order=" + SwissKnife.hexEscape(sorted_by_order),        
       goLabel = request.getParameter("goLabel") == null ? "" : request.getParameter("goLabel");
int rows = 0;

String[] months = new String[] {"","Ιαν","Φεβ","Μαρ","Απρ","Μάϊ","Ιουν","Ιουλ","Αυγ","Σεπ","Οκτ","Νοε","Δεκ"};

int currYear = SwissKnife.getTDateInt(SwissKnife.currentDate(), "YEAR");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<HEAD>
    <%@ include file="include/metatags.jsp" %>

    <TITLE>eΔιαχείριση</TITLE>

    <script type="text/javascript" language="javascript" src="js/jsfunctions.js" charset="UTF-8"></script>
    <script language="JavaScript" src="js/date.js"></script>
    
    <script language="JavaScript">
        function resetForm() {
            document.searchForm.searchCMRTitle.value = "";
            
            document.searchForm.searchCMRDateCreatedDay.value = "";
            document.searchForm.searchCMRDateCreatedMonth.selectedIndex = 0;
            document.searchForm.searchCMRDateCreatedYear.selectedIndex = 0;
            
            document.searchForm.searchCMRDateUpdatedDay.value = "";
            document.searchForm.searchCMRDateUpdatedMonth.selectedIndex = 0;
            document.searchForm.searchCMRDateUpdatedYear.selectedIndex = 0;            
            
            document.searchForm.searchCMCCode.selectedIndex = 0;                        
            
        }
        
        function doSortResults(sortedByCol, sortedByOrder) {
            document.searchForm.action1.value = "SORT";
    
            document.searchForm.sorted_by_col.value = sortedByCol;
            document.searchForm.sorted_by_order.value = sortedByOrder;
            
            document.searchForm.submit();
        }

        var downYear = <%= currYear - yearDnLimit %>;
        var upYear = <%= currYear + yearUpLimit %>;
    </script>
</HEAD>

<body <%= bodyString %>>

  <%@ include file="include/top.jsp" %>

  <table width="0" border="0" cellspacing="2" cellpadding="20">
  <tr>
    <td class="menuPathTD" align="middle"><b><%=CMRTitle%>&nbsp<span class="menuPathTD" id="white">|</span>&nbsp;Υποσελίδες - Modules</b></td>
  </tr>
  </table>
    
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <%@ include file="include/left.jsp" %>
        
        <td valign="top">
        
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="searchFrmTBL">
            
            <form name="searchForm" method="POST" action="<%= urlSearch %>">
            <input type="hidden" name="goLabel" value="results">
            <input type="hidden" name="action1" value="SEARCH">
            <input type="hidden" name="sorted_by_col" value="<%= sorted_by_col %>" />
            <input type="hidden" name="sorted_by_order" value="<%= sorted_by_order %>" />                        
            
            <tr>
                <td>
                    <table width="0" border="0" cellspacing="8" cellpadding="0">
                    <tr>
                        <td>
                            <table width="0" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                <td class="searchFrmTD" align="right">Καταχώρηση από</td>
                                <td class="searchCalendarTD">
                                    <table width="0" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                        <td><input type="text" name="searchCMRDateCreatedDay" size="2" value="<%= searchCMRDateCreatedDay %>" maxlength="2" class="inputFrmField" onblur="valInt('searchForm', 'searchCMRDateCreatedDay', 0, 1, 31); this.className='inputFrmField'" onfocus="this.className='inputFrmFieldFocus'" /></td>
                                        <td>
                                            <select name="searchCMRDateCreatedMonth" class="inputFrmField">
                                                <option value="">ΜΗΝΑΣ</option>
                                                <% 
                                                for (int i=1; i<=12; i++) { %>
                                                    <option value="<%= i %>" <% if (searchCMRDateCreatedMonth.equals( String.valueOf(i) )) out.print("SELECTED"); %>><%= months[i] %></option>
                                                <% } %>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="searchCMRDateCreatedYear" class="inputFrmField">
                                                <option value="">ETOΣ</option>
                                                <%
                                                for (int i = (currYear - yearDnLimit); i <= (currYear + yearUpLimit); i++) { %>
                                                    <option value="<%= i %>" <% if (searchCMRDateCreatedYear.equals( String.valueOf(i) )) out.print("SELECTED"); %>><%= i %></option>
                                                <% } %>
                                            </select>
                                        </td>
                                    </tr>
                                    </table>
                                </td>
                                <td class="searchFrmTD" align="right">Τίτλος</td>
                                <td><input type="text" name="searchCMRTitle" value="<%= searchCMRTitle %>" size="30" class="inputFrmField" onfocus="this.className='inputFrmFieldFocus'" onblur="this.className='inputFrmField'" /></td>
                            </tr>
                            <tr>
                                <td class="searchFrmTD" align="right">Ενημέρωση από</td>
                                <td class="searchCalendarTD">
                                    <table width="0" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                        <td><input type="text" name="searchCMRDateUpdatedDay" size="2" value="<%= searchCMRDateUpdatedDay %>" maxlength="2" class="inputFrmField" onblur="valInt('searchForm', 'searchCMRDateUpdatedDay', 0, 1, 31); this.className='inputFrmField'" onfocus="this.className='inputFrmFieldFocus'" /></td>
                                        <td>
                                            <select name="searchCMRDateUpdatedMonth" class="inputFrmField">
                                                <option value="">ΜΗΝΑΣ</option>
                                                <% 
                                                for (int i=1; i<=12; i++) { %>
                                                    <option value="<%= i %>" <% if (searchCMRDateUpdatedMonth.equals( String.valueOf(i) )) out.print("SELECTED"); %>><%= months[i] %></option>
                                                <% } %>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="searchCMRDateUpdatedYear" class="inputFrmField">
                                                <option value="">ETOΣ</option>
                                                <%
                                                for (int i = (currYear - yearDnLimit); i <= (currYear + yearUpLimit); i++) { %>
                                                    <option value="<%= i %>" <% if (searchCMRDateUpdatedYear.equals( String.valueOf(i) )) out.print("SELECTED"); %>><%= i %></option>
                                                <% } %>
                                            </select>
                                        </td>
                                    </tr>
                                    </table>
                                </td>
                                <td class="searchFrmTD" align="right">Ενότητα</td>
                                <td colspan="3">
                                    <select name="searchCMCCode" class="inputFrmField">
                                        <option value="">---</option>
                                        <%
                                        int CMCRows = helperBean.getTable("CMCategory", "CMCCode");
                    
                                        for (int i=0; i<CMCRows; i++) { %>
                                            <option value="<%= helperBean.getColumn("CMCCode") %>" <% if (helperBean.getColumn("CMCCode").equals(searchCMCCode)) { %>SELECTED <% } %>><% for (int i0=0; i0<(helperBean.getColumn("CMCCode").length()-2); i0++) out.print("&nbsp;&nbsp;"); %><%= helperBean.getColumn("CMCName") %></option>
                                        <%
                                            helperBean.nextRow();
                                        } %>
                                    </select>
                                </td>                            
                            </tr>
                            </table>
                        </td>
                        <td>
                          <table width="0" border="0" cellspacing="2" cellpadding="2">
                          <tr>
                              <td class="searchFrmTD"><input type="submit" name="" value="αναζήτηση" class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'"/></td>
                              <td class="searchFrmTD"><input type="button" name="" value="μηδενισμός" onclick="resetForm()" class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'"/></td>
                              <td class="searchFrmTD"><input type="button" name="" value="επιστροφή" onClick='location.href="<%= urlReturn %>"' class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'"/></td>
                          </tr>
                          </table>
                        </td>
                        <td align="right">&nbsp;</td>
                    </tr>
                    </table>
                </td>
            </tr>
            </form>
            </table>
            
            <%
            // see if there are rows to display
            boolean moreDataRows = true;
            if (currentRowCount <= 0) moreDataRows = false;
            %>

            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="resultsTBL">
            <form name="relCMRForm" method="POST" action="<%= urlRelCMRow %>" />
            <input type="hidden" name="action1" value="RELATE" />
            <input type="hidden" name="databaseId" value="<%= databaseId %>" />
            <input type="hidden" name="urlSuccess" value="<%= urlSuccess %>" />
            <input type="hidden" name="urlNoAccess" value="<%= urlNoAccess %>" />
            <input type="hidden" name="urlFailure" value="<%= urlFailure %>" />
            <input type="hidden" name="CMCM_CMRCode1" value="<%= CMCM_CMRCode1 %>" />
            <input type="hidden" name="CMCM_CMRCode2" value="" />            
            
            <tr class="resultsLabelTR">
                <td class="resultsLabelTD">Κωδικός <% if (sw_relCMRow.isSortedBy("CMRCode","ASC") == false) { %><a href="javascript:doSortResults('CMRCode','ASC');"><img src="images/asc.gif" alt="αύξουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="αύξουσα ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (sw_relCMRow.isSortedBy("CMRCode","DESC") == false) { %><a href="javascript:doSortResults('CMRCode','DESC');"><img src="images/desc.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>            
                <td class="resultsLabelTD">Καταχώρηση <% if (sw_relCMRow.isSortedBy("CMRDateCreated","ASC") == false) { %><a href="javascript:doSortResults('CMRDateCreated','ASC');"><img src="images/asc.gif" alt="αύξουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="αύξουσα ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (sw_relCMRow.isSortedBy("CMRDateCreated","DESC") == false) { %><a href="javascript:doSortResults('CMRDateCreated','DESC');"><img src="images/desc.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>
                <td class="resultsLabelTD">Ενημέρωση <% if (sw_relCMRow.isSortedBy("CMRDateUpdated","ASC") == false) { %><a href="javascript:doSortResults('CMRDateUpdated','ASC');"><img src="images/asc.gif" alt="αύξουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="αύξουσα ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (sw_relCMRow.isSortedBy("CMRDateUpdated","DESC") == false) { %><a href="javascript:doSortResults('CMRDateUpdated','DESC');"><img src="images/desc.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>
                <td class="resultsLabelTD">Τίτλος <% if (sw_relCMRow.isSortedBy("CMRTitle","ASC") == false) { %><a href="javascript:doSortResults('CMRTitle','ASC');"><img src="images/asc.gif" alt="αύξουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/asc_off.gif" alt="αύξουσα ταξινόμηση" align="top" border="0"><% } %>&nbsp;<% if (sw_relCMRow.isSortedBy("CMRTitle","DESC") == false) { %><a href="javascript:doSortResults('CMRTitle','DESC');"><img src="images/desc.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /></a><% } else { %><img src="images/desc_off.gif" alt="φθίνουσα ταξινόμηση" align="top" border="0" /><% } %></td>
                <td class="resultsLabelTD">&nbsp;</td>                
            </tr>
            <%
            // display
            int disp = 0;
            
            for (disp=0; moreDataRows && disp < dispRows; disp++) {
            %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= sw_relCMRow.getColumn("CMRCode") %></td>                
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= SwissKnife.formatDate(sw_relCMRow.getTimestamp("CMRDateCreated"),"dd-MM-yyyy") %><a target="_blank" href="<%= response.encodeURL("processcmrow.jsp?action1=EDIT&CMRCode=" + sw_relCMRow.getHexColumn("CMRCode")) %>" class="resultsLink"><img src="images/nw2.gif" height="11" width="11" border="0" alt="Εμφάνιση σε νέο παράθυρο" title="Εμφάνιση σε νέο παράθυρο" /></a></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= SwissKnife.formatDate(sw_relCMRow.getTimestamp("CMRDateUpdated"),"dd-MM-yyyy") %></td>                    
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><%= sw_relCMRow.getColumn("CMRTitle") %></td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'"><input type="button" name="relcmr" value="συσχέτιση" onclick='document.relCMRForm.CMCM_CMRCode2.value="<%= sw_relCMRow.getColumn("CMRCode") %>"; document.relCMRForm.submit(); void(0)' class="loginFrmBtn" onmouseover="this.className='loginFrmBtnOver'" onmouseout="this.className='loginFrmBtn'" /></td>
                </tr>
            <%
                moreDataRows = sw_relCMRow.nextRow();
            }
            for (; disp < dispRows; disp++) {
            %>
                <tr class="resultsDataTR" onmouseover="this.className='resultsDataTROver'" onmouseout="this.className='resultsDataTR'">
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>                
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>
                    <td class="resultsDataTD" onmouseover="this.className='resultsDataTDOver'" onmouseout="this.className='resultsDataTD'">&nbsp;</td>                    
                </tr>
            <%
            }
            %>
            <%-- / παρουσίαση άρθρων --%>
    
            <%-- previus - next buttons --%>
            <form name="nav" method="POST" action="<%= urlSearch %>">
            <tr class="resultsFooterTR">
                <td colspan="5"><%@ include file="include/navigationform2.jsp" %></td>
            </tr>
            </form>
            <%-- / previus - next --%>
            
            </table>
            
            </div>
        </td>
    
        <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>
    
    <% helperBean.closeResources(); %>
    
</body>
</html>