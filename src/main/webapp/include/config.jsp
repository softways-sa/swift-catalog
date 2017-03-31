<%@ page pageEncoding="UTF-8" %>

<%@ page import="java.util.*,gr.softways.dev.util.*,java.math.BigDecimal
    ,java.sql.Timestamp,gr.softways.dev.eshop.eways.v5.PriceChecker
    ,gr.softways.dev.eshop.eways.v2.PrdPrice
    ,gr.softways.dev.eshop.eways.v2.TotalPrice
    ,gr.softways.dev.eshop.eways.v2.Product
    ,gr.softways.dev.swift.cmcategory.v1.*
    ,gr.softways.dev.swift.cmrow.CMRowAttribs
    ,gr.softways.dev.eshop.category.v2.PrdCategoryMenuOption2" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String databaseId = SwissKnife.jndiLookup("swconf/databaseId");

String wwwrootFilePath = application.getRealPath("");

String serverName = request.getServerName();

String appDir = "";

String whereAmI = "", top_jsp_path = "";

final String HOME_CMCCode = "0101", BOTTOM_CMCCode = "0103",
    LEFT_SIDEBAR_CMCCode = "0102", RIGHT_SIDEBAR_CMCCode = "0104",
    EPAY_INTRO_TEXT_CMCCode = "0120";
    
String MEGAMENU_PRDPROMO_URL = null, URI_SCHEME = "";

boolean USE_MEGAMENU = true, ITEMS_CAROUSEL = false;

String[] __configurationValues = Configuration.getValues(new String[] {"not_megamenu","megamenu_prdpromo_url","website_config","useSSL","items_carousel"});

if (__configurationValues[0] != null && "1".equals(__configurationValues[0])) USE_MEGAMENU = false;

MEGAMENU_PRDPROMO_URL = __configurationValues[1];
ITEMS_CAROUSEL = __configurationValues[4] == null ? false : "1".equals(__configurationValues[4]) ? true : false;

if (__configurationValues[3] != null && "1".equals(__configurationValues[3])) {
  URI_SCHEME = "https://";
}
else {
  URI_SCHEME = "http://";
}

Properties website_config_attribs = new Properties();
website_config_attribs.load(new java.io.ByteArrayInputStream(__configurationValues[2].getBytes("UTF-8")));

String website_config_catalog = website_config_attribs.getProperty("cat", "0"),
    website_config_epay = website_config_attribs.getProperty("epay", "0");

// DEFAULT username-password
String defaultAuthUsername = "anonymous", defaultAuthPassword = "softways";
String authUsername = defaultAuthUsername, authPassword = defaultAuthPassword;

if (session.getAttribute(databaseId + ".authUsername") == null) {
    session.setAttribute(databaseId + ".authUsername", authUsername);
}
else {
    authUsername = session.getAttribute(databaseId + ".authUsername").toString();
}

if (session.getAttribute(databaseId + ".authPassword") == null) {
    session.setAttribute(databaseId + ".authPassword", authPassword);
}
else {
    authPassword = session.getAttribute(databaseId + ".authPassword").toString();
}

String defLang = "";

String lang = (String) session.getAttribute(databaseId + ".lang");
if (lang == null || request.getParameter("lang") != null || request.getParameter("extLang") != null) {

    if (request.getParameter("lang") != null) {
        lang = request.getParameter("lang");
    }
    else if (request.getParameter("extLang") != null) {
        lang = request.getParameter("extLang");
    }

    if (lang == null) lang = "";
}

if(!lang.equals("LG") && !lang.equals("")) lang = defLang;
session.setAttribute(databaseId + ".lang", lang);

String localeLanguage = "el", localeCountry = "GR";
if (lang.equals("LG")) {
    localeLanguage = "en";
    localeCountry = "UK";
}

// ------- catalog section
BigDecimal exchangeRate = new BigDecimal("1");

int curr1Scale = Integer.parseInt(gr.softways.dev.util.SwissKnife.jndiLookup("swconf/curr1Scale"));

int curr1DisplayScale = 2, curr2DisplayScale = 0;
int minCurr1DispFractionDigits = 2, minCurr2DispFractionDigits = 0;

int defaultCustomerType = gr.softways.dev.eshop.eways.Customer.CUSTOMER_TYPE_RETAIL;
int customerType = defaultCustomerType;
%>
