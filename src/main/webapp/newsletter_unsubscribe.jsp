<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/problem.jsp" %>

<%@ include file="/include/config.jsp" %>

<% whereAmI = "/newsletter_unsubscribe.jsp"; %>

<%!
static Hashtable lb = new Hashtable();
static {
    lb.put("htmlTitle","Απεγγραφή από το Newsletter");
    lb.put("htmlTitleLG","Unsubscribe from Newsletter");
    lb.put("htmlTitleLG1","Unsubscribe from Newsletter");
    lb.put("htmlTitleLG2","Unsubscribe from Newsletter");
    
    lb.put("ftitle","Απεγγραφή από το Newsletter");
    lb.put("ftitleLG","Unsubscribe from Newsletter");
    lb.put("ftitleLG1","Unsubscribe from Newsletter");
    lb.put("ftitleLG2","Unsubscribe from Newsletter");
    
    lb.put("text","Εάν δεν επιθυμείτε να λαμβάνετε πλέον το ενημερωτικό μας email, καταχωρήστε παρακάτω το email σας και πατήστε απεγγραφή.");
    lb.put("textLG","If you wish to unsubscribe, enter your email below and click 'Unsubscribe'.");
    lb.put("textLG1","If you wish to unsubscribe, enter your email below and click 'Unsubscribe'.");
    lb.put("textLG2","If you wish to unsubscribe, enter your email below and click 'Unsubscribe'.");

    lb.put("submitBtn","Απεγγραφή");
    lb.put("submitBtnLG","Unsubscribe");
    lb.put("submitBtnLG1","Unsubscribe");
    lb.put("submitBtnLG2","Unsubscribe");
    
    lb.put("success","Η απεγγραφή σας ολοκληρώθηκε.");
    lb.put("successLG","You have been unsubscribed.");
    lb.put("successLG1","You have been unsubscribed.");
    lb.put("successLG2","You have been unsubscribed.");
    
    lb.put("js_email","Παρακαλούμε ελέγξτε το email σας.");
    lb.put("js_emailLG","Please check your email spelling.");
    lb.put("js_emailLG1","Please check your email spelling.");
    lb.put("js_emailLG2","Please check your email spelling.");
    
    lb.put("errorResponse","Παρουσιάστηκε κάποιο πρόβλημα. Παρακαλούμε δοκιμάστε αργότερα.");
    lb.put("errorResponseLG","There was some problem. Please try again later.");
    lb.put("errorResponseLG1","There was some problem. Please try again later.");
    lb.put("errorResponseLG2","There was some problem. Please try again later.");
    lb.put("successResponse","Η απεγγραφή σας ήταν επιτυχημένη. Σας ευχαριστούμε.");
    lb.put("successResponseLG","Your request was successfully submitted. Thank you.");
    lb.put("successResponseLG1","Your request was successfully submitted. Thank you.");
    lb.put("successResponseLG2","Your request was successfully submitted. Thank you.");
}
%>

<%
String unsubscribe_email = request.getParameter("c");
if (unsubscribe_email == null) unsubscribe_email = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/metatags.jsp" %>

    <title><%= lb.get("htmlTitle" + lang) %></title>
</head>

<body>

<div id="site">
    
<%@ include file="/include/top.jsp" %>

<div id="swContentSite">
  
<div class="container">

<div style="padding:20px 20px 20px 20px; font-size:12px;" id="unsubscribeFrameContainer">
        
<div id="unsubscribeFrame">
<h2><%= lb.get("ftitle" + lang) %></h2>

<p><%=lb.get("text" + lang)%></p>

<span>Email:</span> <input id="unsubscribe_email" name="unsubscribe_email" type="text" size="35" value="<%=unsubscribe_email%>" style="padding:2px;" />
<input type="button" name="unsubscribe_submit" value="<%=lb.get("submitBtn" + lang)%>" onclick="return unsubscribe();"/>

<div id="unsubscribeValidatorErrorMessages" style="margin:10px 0 0 0; color:red;"></div>
</div> <!-- end: unsubscribeFrame -->

</div> <!-- end: unsubscribeFrameContainer -->

</div>

</div> <!-- /swContentSite -->

<%@ include file="/include/bottom.jsp" %>

<script type="text/javascript">
function unsubscribe() {
    var unsubscribeEmail = $("#unsubscribe_email").val();

    if (emailCheck(unsubscribeEmail)) {
        sendUnsubscribe(unsubscribeEmail);
    }
    else {
        $("#unsubscribeValidatorErrorMessages").text("<%=lb.get("js_email" + lang)%>");
    }

    return false;
}

function sendUnsubscribe(email) {
    $.ajax({
        type: "GET",
        url: "/newsletter.do?cmd=unsubscribe&id=NEWSLETTER&EMLMEmail=" + email,
        dataType: "html",
        success: function(serverresponse) {
            if (serverresponse == 1) $("#unsubscribeFrame").text("<%=lb.get("successResponse" + lang)%>").css('font-weight','bold');
            else $("#unsubscribeFrame").text("<%=lb.get("errorResponse" + lang)%>").css('font-weight','bold').css('color','red');
        }
    });
}
</script>

</div> <!-- /site -->

</body>
</html>