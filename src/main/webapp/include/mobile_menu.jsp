<%@page pageEncoding="UTF-8"%>

<nav id="mobile-menu" class="hidden">
  <ul>
    <li><a href="<%="/" + (defLang.equals(lang) ? "" : "?extLang=" + lang)%>">Home</a></li>
    
    <%
    menuLevel = 1;

    for (int i=0; i<top_jsp_prdCatMenuLength; i++) {
      PrdCategoryMenuOption2 menuOption = top_jsp_prdCatMenu.getMenuOption(i);
    %>

      <%
      if ("<a>".equals(menuOption.getTag()) && !"1".equals(menuOption.getParent())) {
        top_MenuURL = "/site/search/" + menuOption.getSefFullPath() + "?catId=" + menuOption.getCode() + "&amp;extLang=" + lang;
      %>
        <li><a href="<%=top_MenuURL%>"><%=menuOption.getTitle()%></a><!-- Simple Link -->
      <%
        //if (menuOption.getCode().length() == 2) menuLevel = 1;
      }%>

      <%
      if ("<a>".equals(menuOption.getTag()) && "1".equals(menuOption.getParent())) {
        top_MenuURL = "/site/category/" + menuOption.getSefFullPath() + "?catId=" + menuOption.getCode() + "&amp;extLang=" + lang;
      %>
        <li class="dropdown_parent"><a href="<%=top_MenuURL%>"><%=menuOption.getTitle()%></a><ul class="dropdown_flyout_level">
      <%}%>

      <% if ("</li>".equals(menuOption.getTag())) {%></li><%}%>

      <% if ("<ul>".equals(menuOption.getTag())) {
        menuLevel++;
      }%>

      <% if ("</ul>".equals(menuOption.getTag()) && menuLevel > 1) {%>
        </ul>
      <%
        menuLevel--;
      }%>

    <%}%>
    
    <%
    menuLevel = 0;

    for (int i=0; i<top_jsp_menuLength; i++) {
      MenuOption menuOption = top_jsp_menu.getMenuOption(i);
    %>

      <%if ("<a>".equals(menuOption.getTag()) && menuOption.getCode().length() == 4 && "1".equals(menuOption.getParent())) {%>
        <li>
          <span><%=menuOption.getTitle()%></span><!-- Begin Item -->
          <ul>
      <%
        menuLevel = 1;
      }%>

      <%
      if ("<a>".equals(menuOption.getTag()) && menuOption.getCode().length() >= 4 && !"1".equals(menuOption.getParent())) {
        if (menuOption.getURL() == null) top_MenuURL = "/site/page/" + SwissKnife.sefEncode(menuOption.getTitle()) + "?CMCCode=" + menuOption.getCode() + "&amp;extLang=" + lang;
        else top_MenuURL = menuOption.getURL();
      %>
        <li><a href="<%=top_MenuURL%>"><%=menuOption.getTitle()%></a><!-- Simple Link -->
      <%
        if (menuOption.getCode().length() == 4) menuLevel = 0;
      }%>

      <%if ("<a>".equals(menuOption.getTag()) && menuOption.getCode().length() > 4 && "1".equals(menuOption.getParent())) {%>
        <li><span><%=menuOption.getTitle()%></span><ul>
      <%}%>

      <%if ("</li>".equals(menuOption.getTag()) && menuLevel == 1) out.print("</li>"); else if ("</li>".equals(menuOption.getTag())) out.print("</li>");%>

      <% if ("</ul>".equals(menuOption.getTag()) && menuLevel == 1) {%>
        </ul></div>
      <%
        menuLevel = 0;
      }%>

      <% if ("<ul>".equals(menuOption.getTag())) {
        menuLevel++;
      }%>

      <% if ("</ul>".equals(menuOption.getTag()) && menuLevel > 1) {%>
        </ul>
      <%
        menuLevel--;
      }%>

    <%}%>
    </li>
 </ul>
</nav>