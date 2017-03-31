<%@ page pageEncoding="UTF-8" %>

<%@ page import="java.util.Properties,gr.softways.dev.util.Configuration" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String serverName = request.getServerName();

String databaseId = gr.softways.dev.util.SwissKnife.jndiLookup("swconf/databaseId");

String wwwrootFilePath = application.getRealPath("");

String appDir = "";

String userImagesWebPath = "/images",
    userImagesFilePath = wwwrootFilePath + userImagesWebPath,
    gImagesWebPath = "/gimages",
    gImagesFilePath = wwwrootFilePath + gImagesWebPath,
    userFilesWebPath = "/misc",
    userFilesFilePath = wwwrootFilePath + userFilesWebPath,
    newsletterFilesWebPath = "/newsletter",
    newsletterFilesFilePath = wwwrootFilePath + newsletterFilesWebPath,
    productImagesWebPath = "/prd_images",
    productImagesFilePath = wwwrootFilePath + productImagesWebPath;

/** directory for import-export templates */
String TEMPLATE_DIR_IN_WEB_PATH = "/admin/template_data/in/",
       TEMPLATE_DIR_IN = wwwrootFilePath + TEMPLATE_DIR_IN_WEB_PATH;
       
String TEMPLATE_DIR_OUT = wwwrootFilePath + "/admin/template_data/out/";

String bodyString = "bgcolor=\"#ffffff\" leftMargin=0 topMargin=0 marginheight=\"0\" marginwidth=\"0\" ";

int dispRows = 10;

String urlLoginFirst = "/admin/" + response.encodeURL("login.jsp"),
       urlNoAccess = "/admin/" + response.encodeURL("noaccess.jsp");

/** FileTemplate σταθερές { */
String TEMPLATE_OP_INNew = "INNew";
String TEMPLATE_OP_IN = "IN";
String TEMPLATE_OP_OUT = "OUT";
/** } FileTemplate σταθερές */

if (session != null) session.setMaxInactiveInterval(1 * 60 * 60);

int yearDnLimit = 10, yearUpLimit = 5;

String localeLanguage = "el", localeCountry = "GR";

int curr1Scale = Integer.parseInt(gr.softways.dev.util.SwissKnife.jndiLookup("swconf/curr1Scale"));
int curr2Scale = 0;
try {
    curr2Scale = Integer.parseInt(gr.softways.dev.util.SwissKnife.jndiLookup("swconf/curr2Scale"));
}
catch (Exception e) { }

int curr1DisplayScale = 2, curr2DisplayScale = 0;
int minCurr1DispFractionDigits = 2, minCurr2DispFractionDigits = 0;
int curr1CheckFractionDigits = 2, curr2CheckFractionDigits = 0;

String website_config_values = Configuration.getValue("website_config");
if (website_config_values == null) website_config_values = "";

Properties config_attribs = new Properties();
config_attribs.load(new java.io.ByteArrayInputStream(website_config_values.getBytes("UTF-8")));

String website_config_catalog = config_attribs.getProperty("cat", "0"),
    website_config_newsletter = config_attribs.getProperty("nwl", "0"),
    website_config_epay = config_attribs.getProperty("epay", "0");
%>