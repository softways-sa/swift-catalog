<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="metatag_cmrow" scope="page" class="gr.softways.dev.swift.cmrow.Present" />

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />

<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700&amp;subset=latin,greek-ext,greek' rel='stylesheet' type='text/css'>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/megamenu.css" />
<link rel="stylesheet" type="text/css" href="/css/megamenu-light.css" />
<link rel="stylesheet" type="text/css" href="/css/core.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" href="/css/royalslider/royalslider.css">

<script type="text/javascript">
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}
</script>

<%
metatag_cmrow.initBean(databaseId, request, response, this, session);
metatag_cmrow.getCMRow("0105", "");
while (metatag_cmrow.inBounds() == true) {out.println(metatag_cmrow.getColumn("CMRHeadHTML")); metatag_cmrow.nextRow();}
metatag_cmrow.closeResources();
%>