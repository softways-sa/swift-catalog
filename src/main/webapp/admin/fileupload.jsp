<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="problem.jsp" %>

<%@ include file="include/config.jsp" %>

<%@ include file="include/auth.jsp" %>

<jsp:useBean id="ebb_listdir" scope="page" class="gr.softways.dev.util.ListDir" />

<%
String urlSuccess = response.encodeURL("http://" + serverName + "/" + appDir + "admin/uploadfiles.jsp"),
       urlFailure = response.encodeURL("http://" + serverName + "/" + appDir + "admin/problem.jsp"),
       urlPost = response.encodeURL("/servlet/admin/UploadFiles");
       
String fileAction = request.getParameter("fileAction") == null ? "" : request.getParameter("fileAction");
String fileName = request.getParameter("fileName") == null ? "" : request.getParameter("fileName");

int filesCount = 5;
%>

<html>
<head>
    <%@ include file="include/metatags.jsp" %>
    
    <title>Upload files</title>

    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/themes/base/jquery-ui.css" id="theme">
    <link rel="stylesheet" href="css/jquery.fileupload-ui.css">

    <script language="JavaScript" src="js/jsfunctions.js"></script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>

    
    <script src="js/jquery.iframe-transport.js"></script>
    <script src="js/jquery.fileupload.js"></script>
    <script src="js/jquery.fileupload-ui.js"></script>
    
    <script language="JavaScript">
    function confirmFileAction(fn) {
        if (confirm("Είστε σίγουρη(ος) ότι θέλετε να διαγράψετε το αρχείο: " + fn) == true) { 
            return true;
        }
        else return false;
    }
    
    $(function () {
        'use strict';

        // Initialize the jQuery File Upload widget:
        $('#fileupload').fileupload();

        // Load existing files:
        $.getJSON($('#fileupload form').prop('action'), function (files) {
            var fu = $('#fileupload').data('fileupload');
            fu._adjustMaxNumberOfFiles(-files.length);
            fu._renderDownload(files)
                .appendTo($('#fileupload .files'))
                .fadeIn(function () {
                    // Fix for IE7 and lower:
                    $(this).show();
                });
        });

        // Open download dialogs via iframes,
        // to prevent aborting current uploads:
        $('#fileupload .files a:not([target^=_blank])').live('click', function (e) {
            e.preventDefault();
            $('<iframe style="display:none;"></iframe>')
                .prop('src', this.href)
                .appendTo('body');
        });

    });
    </script>
</head>

<body <%= bodyString %>>
    <%@ include file="include/top.jsp" %>
    
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <%@ include file="include/left.jsp" %>
        
        <td valign="top">
            <div style="margin:20px 0 20px 0;">
                
            <div id="fileupload">
            <form action="<%= urlPost %>" method="POST" enctype="multipart/form-data">
                <div class="fileupload-buttonbar">

                    <input type="hidden" name="protocol" value="http">
                    <label class="fileinput-button">
                        <span>Add files...</span>
                        <input type="file" name="files[]" multiple>
                    </label>
                    <button type="submit" class="start">Start upload</button>
                    <button type="reset" class="cancel">Cancel upload</button>

                    <button type="button" class="delete">Delete files</button>
                </div>
            </form>
            <div class="fileupload-content">
                <table class="files">
                </table>
                <div class="fileupload-progressbar"></div>
            </div>
            </div>
            
            </div>

        </td>
        <%@ include file="include/right.jsp" %>
    </tr>
    </table>
    
    <%@ include file="include/bottom.jsp" %>

</body>
</html>