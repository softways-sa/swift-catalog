SET SQL DIALECT 3;
CREATE DATABASE '/usr/local/firebird.data/swift-catalog-v1.fdb' USER 'SYSDBA' PASSWORD 'tmrcumb$' PAGE_SIZE 8192 DEFAULT CHARACTER SET UTF8;

create table EPayment
(
    PAYNT_Code char(25) not null,
    PAYNT_PayDate timestamp,
    PAYNT_CompanyName varchar(100),
    PAYNT_IRSNum char(10),
    PAYNT_RefCode char(25),
    PAYNT_Fullname varchar(100),
    PAYNT_Reason varchar(250),
    PAYNT_Email varchar(100),
    PAYNT_Amount numeric(13,4),
    PAYNT_Instalments int,
    PAYNT_BankPayStatus char(1),
    PAYNT_BankTransID char(25),
    PAYNT_Lang char(3),
    constraint PK_EPayment primary key (PAYNT_Code)
);

create table VAT
(
    VAT_ID char(25) not null,
    VAT_Title varchar(50),
    VAT_Pct numeric(5,3),
    constraint PK_VAT_ID primary key (VAT_ID)
);

create table Newsletter
(
    NWLR_Code char(25) not null,
    NWLR_Date timestamp,
    NWLR_Title varchar(80),
    NWLR_From varchar(80),
    NWLR_Subject varchar(250),
    NWLR_ContentType char(25),
    NWLR_Charset char(25),
    NWLR_Message BLOB SUB_TYPE 1,
    constraint PK_Newsletter primary key (NWLR_Code)
);

create table Configuration
(
    CO_Code char(25) not null,
    CO_GroupID int,
    CO_Title varchar(80),
    CO_Key varchar(80),
    CO_Value varchar(250),
    CO_ValueLG varchar(250),
    CO_ValueLG1 varchar(250),
    CO_ValueLG2 varchar(250),
    CO_Params varchar(250),
    CO_ParamsLG varchar(250),
    CO_ParamsLG1 varchar(250),
    CO_ParamsLG2 varchar(250),
    CO_Description varchar(250),
    CO_SortOrder int,
    CO_Visible int,
    CO_Editable int,
    constraint PK_Configuration primary key (CO_Code)
);
create unique asc index IX_CO_Key on Configuration (CO_Key);

create table CMRow
(
    CMRCode char(25) not null,
    CMRDateCreated timestamp,
    CMRDateUpdated timestamp,
    CMRTitle varchar(160),
    CMRTitle1Up varchar(80),
    CMRTitle2Up varchar(80),
    CMRTitleLG varchar(160),
    CMRTitle1UpLG varchar(80),
    CMRTitle2UpLG varchar(80),
    CMRKeyWords varchar(500),
    CMRKeyWords1Up varchar(80),
    CMRKeyWords2Up varchar(420),
    CMRKeyWordsLG varchar(500),
    CMRKeyWords1UpLG varchar(80),
    CMRKeyWords2UpLG varchar(420),
    CMRSummary BLOB SUB_TYPE 1,
    CMRSummaryLG BLOB SUB_TYPE 1,
    CMRText BLOB SUB_TYPE 1,
    CMRTextLG BLOB SUB_TYPE 1,
    CMRIsSticky char(1),
    CMRIsProtected char(1),
    CMRTitleLG1 varchar(160),
    CMRTitle1UpLG1 varchar(80),
    CMRTitle2UpLG1 varchar(80),
    CMRKeyWordsLG1 varchar(500),
    CMRKeyWords1UpLG1 varchar(80),
    CMRKeyWords2UpLG1 varchar(420),
    CMRSummaryLG1 BLOB SUB_TYPE 1,
    CMRTextLG1 BLOB SUB_TYPE 1,
    CMRTitleLG2 varchar(160),
    CMRTitle1UpLG2 varchar(80),
    CMRTitle2UpLG2 varchar(80),
    CMRKeyWordsLG2 varchar(500),
    CMRKeyWords1UpLG2 varchar(80),
    CMRKeyWords2UpLG2 varchar(420),
    CMRSummaryLG2 BLOB SUB_TYPE 1,
    CMRTextLG2 BLOB SUB_TYPE 1,
    CMRTitleLG3 varchar(160),
    CMRTitle1UpLG3 varchar(80),
    CMRTitle2UpLG3 varchar(80),
    CMRKeyWordsLG3 varchar(500),
    CMRKeyWords1UpLG3 varchar(80),
    CMRKeyWords2UpLG3 varchar(420),
    CMRSummaryLG3 BLOB SUB_TYPE 1,
    CMRTextLG3 BLOB SUB_TYPE 1,
    CMRHeadHTML BLOB SUB_TYPE 1,
    CMRBodyHTML BLOB SUB_TYPE 1,
    CMRAttribs BLOB SUB_TYPE 1,
    constraint PK_CMRow primary key (CMRCode)
);
/**
alter table CMRow alter CMRKeyWords type varchar(500);
alter table CMRow alter CMRKeyWords2Up type varchar(420);
alter table CMRow alter CMRKeyWordsLG type varchar(500);
alter table CMRow alter CMRKeyWords2UpLG type varchar(420);
alter table CMRow alter CMRKeyWordsLG1 type varchar(500);
alter table CMRow alter CMRKeyWords2UpLG1 type varchar(420);
alter table CMRow alter CMRKeyWordsLG2 type varchar(500);
alter table CMRow alter CMRKeyWords2UpLG2 type varchar(420);
alter table CMRow alter CMRKeyWordsLG3 type varchar(500);
alter table CMRow alter CMRKeyWords2UpLG3 type varchar(420);

alter table CMRow add CMRTitleLG3 varchar(160);
alter table CMRow add CMRTitle1UpLG3 varchar(80);
alter table CMRow add CMRTitle2UpLG3 varchar(80);
alter table CMRow add CMRKeyWordsLG3 varchar(500);
alter table CMRow add CMRKeyWords1UpLG3 varchar(80);
alter table CMRow add CMRKeyWords2UpLG3 varchar(420);
alter table CMRow add CMRSummaryLG3 BLOB SUB_TYPE 1;
alter table CMRow add CMRTextLG3 BLOB SUB_TYPE 1;

alter table CMRow add CMRTitleLG4 varchar(160);
alter table CMRow add CMRTitle1UpLG4 varchar(80);
alter table CMRow add CMRTitle2UpLG4 varchar(80);
alter table CMRow add CMRKeyWordsLG4 varchar(500);
alter table CMRow add CMRKeyWords1UpLG4 varchar(80);
alter table CMRow add CMRKeyWords2UpLG4 varchar(420);
alter table CMRow add CMRSummaryLG4 BLOB SUB_TYPE 1;
alter table CMRow add CMRTextLG4 BLOB SUB_TYPE 1;
alter table CMRow add CMRTitleLG5 varchar(160);
alter table CMRow add CMRTitle1UpLG5 varchar(80);
alter table CMRow add CMRTitle2UpLG5 varchar(80);
alter table CMRow add CMRKeyWordsLG5 varchar(500);
alter table CMRow add CMRKeyWords1UpLG5 varchar(80);
alter table CMRow add CMRKeyWords2UpLG5 varchar(420);
alter table CMRow add CMRSummaryLG5 BLOB SUB_TYPE 1;
alter table CMRow add CMRTextLG5 BLOB SUB_TYPE 1;
alter table CMRow add CMRTitleLG6 varchar(160);
alter table CMRow add CMRTitle1UpLG6 varchar(80);
alter table CMRow add CMRTitle2UpLG6 varchar(80);
alter table CMRow add CMRKeyWordsLG6 varchar(500);
alter table CMRow add CMRKeyWords1UpLG6 varchar(80);
alter table CMRow add CMRKeyWords2UpLG6 varchar(420);
alter table CMRow add CMRSummaryLG6 BLOB SUB_TYPE 1;
alter table CMRow add CMRTextLG6 BLOB SUB_TYPE 1;
alter table CMRow add CMRTitleLG7 varchar(160);
alter table CMRow add CMRTitle1UpLG7 varchar(80);
alter table CMRow add CMRTitle2UpLG7 varchar(80);
alter table CMRow add CMRKeyWordsLG7 varchar(500);
alter table CMRow add CMRKeyWords1UpLG7 varchar(80);
alter table CMRow add CMRKeyWords2UpLG7 varchar(420);
alter table CMRow add CMRSummaryLG7 BLOB SUB_TYPE 1;
alter table CMRow add CMRTextLG7 BLOB SUB_TYPE 1;

alter table CMRow add CMRHeadHTML BLOB SUB_TYPE 1;
alter table CMRow add CMRBodyHTML BLOB SUB_TYPE 1;
alter table CMRow add CMRAttribs BLOB SUB_TYPE 1;
**/
create table CMCategory
(
    CMCCode char(25) not null,
    CMCName varchar(80),
    CMCNameUp varchar(80),
    CMCNameLG varchar(80),
    CMCNameUpLG varchar(80),
    CMCText BLOB SUB_TYPE 1,
    CMCTextLG BLOB SUB_TYPE 1,
    CMCRank int,
    CMCShowFlag char(1),
    CMCParentFlag char(1),
    CMCURL varchar(150),
    CMCURLLG varchar(150),
    CMCIsProtected char(1),
    CMCNameLG1 varchar(80),
    CMCNameUpLG1 varchar(80),
    CMCTextLG1 BLOB SUB_TYPE 1,
    CMCURLLG1 varchar(150),
    CMCNameLG2 varchar(80),
    CMCNameUpLG2 varchar(80),
    CMCTextLG2 BLOB SUB_TYPE 1,
    CMCURLLG2 varchar(150),
    CMCNameLG3 varchar(80),
    CMCNameUpLG3 varchar(80),
    CMCTextLG3 BLOB SUB_TYPE 1,
    CMCURLLG3 varchar(150),
    constraint PK_CMCategory primary key (CMCCode)
);
/**
alter table CMCategory add CMCNameLG4 varchar(80);
alter table CMCategory add CMCNameUpLG4 varchar(80);
alter table CMCategory add CMCTextLG4 BLOB SUB_TYPE 1;
alter table CMCategory add CMCURLLG4 varchar(150);
alter table CMCategory add CMCNameLG5 varchar(80);
alter table CMCategory add CMCNameUpLG5 varchar(80);
alter table CMCategory add CMCTextLG5 BLOB SUB_TYPE 1;
alter table CMCategory add CMCURLLG5 varchar(150);
alter table CMCategory add CMCNameLG6 varchar(80);
alter table CMCategory add CMCNameUpLG6 varchar(80);
alter table CMCategory add CMCTextLG6 BLOB SUB_TYPE 1;
alter table CMCategory add CMCURLLG6 varchar(150);
alter table CMCategory add CMCNameLG7 varchar(80);
alter table CMCategory add CMCNameUpLG7 varchar(80);
alter table CMCategory add CMCTextLG7 BLOB SUB_TYPE 1;
alter table CMCategory add CMCURLLG7 varchar(150);
**/
create table CMCRelCMR
(
    CCCRCode char(25)not null,
    CCCR_CMCCode char(25)not null,
    CCCR_CMRCode char(25)not null,
    CCCRPrimary char(1),
    CCCRRank int,
    CCCRIsHidden char(1),
    constraint PK_CCCR primary key (CCCRCode)
);
create table CMRRelCMR
(
    CMCMCode char(25) not null,
    CMCM_CMRCode1 char(25) not null,
    CMCM_CMRCode2 char(25) not null,
    CMCMRank int,
    CMCMIsHidden char(1),
    constraint PK_CMCM primary key (CMCMCode)
);
alter table CMCRelCMR add foreign key (CCCR_CMCCode) references CMCategory (CMCCode);
alter table CMCRelCMR add foreign key (CCCR_CMRCode) references CMRow (CMRCode) on update cascade on delete cascade;
alter table CMRRelCMR add foreign key (CMCM_CMRCode1) references CMRow (CMRCode) on update cascade on delete cascade;
alter table CMRRelCMR add foreign key (CMCM_CMRCode2) references CMRow (CMRCode);

create table emailListTab
(
  EMLTCode		char(25) not null,
  EMLTName		varchar(75) not null,
  EMLTNameUp		varchar(75) not null,
  EMLTDescr		varchar(150),
  EMLTTo		varchar(75),
  EMLTActive		char(1),
  EMLTField1		varchar(100),
  EMLTField2		varchar(100),
  primary key (EMLTCode)
);

create table emailListMember
(
  EMLMCode		char(25) not null,
  EMLMEmail		varchar(75),
  EMLMAltEmail		varchar(75),
  EMLMLastName		varchar(75),
  EMLMLastNameUp	varchar(75),
  EMLMFirstName		varchar(75),
  EMLMBirthDate		timestamp,
  EMLMRegDate		timestamp,
  EMLMCompanyName	varchar(75),
  EMLMCompanyNameUp	varchar(75),
  EMLMAddress		varchar(100),
  EMLMZipCode		char(10),
  EMLMCity		varchar(50),
  EMLMCountry		varchar(50),
  EMLMPhone		varchar(50),
  EMLMActive		char(1),
  EMLMField1		varchar(100),
  EMLMField2		varchar(100),
  EMLMField3		varchar(100),
  primary key (EMLMCode)
);

create table emailListReg
(
  EMLRCode		char(25) not null,
  EMLRListCode		char(25) not null,
  EMLRMemberCode	char(25) not null,
  primary key (EMLRCode)
);

alter table emailListReg add constraint FK_EMLRListCode foreign key (EMLRListCode) references emailListTab (EMLTCode) on update cascade on delete cascade;
alter table emailListReg add constraint FK_EMLRMemberCode foreign key (EMLRMemberCode) references emailListMember (EMLMCode) on update cascade on delete cascade;

create unique asc index IX_EMLTName on emailListTab (EMLTName);
create unique asc index IX_EMLTNameUp on emailListTab (EMLTNameUp);
create unique asc index IX_EMLMEmail on emailListMember (EMLMEmail);
create asc index IX_EMLMLastName on emailListMember (EMLMLastName);
create asc index IX_EMLMLastNameUp on emailListMember (EMLMLastNameUp);
create asc index IX_EMLMCompanyNameUp on emailListMember (EMLMCompanyNameUp);

create table country
(
    countryCode char(25) not null,
    countryName varchar(50),
    countryNameLG varchar(50),
    countryNameLG1 varchar(50),
    countryNameLG2 varchar(50),
    countryNameLG3 varchar(50),
    countryNameLG4 varchar(50),
    countryNameLG5 varchar(50),
    constraint PK_countryCode primary key (countryCode)
);
create asc index IX_countryName on country (countryName);
create asc index IX_countryNameLG on country (countryNameLG);

create table fileTemplate
(
    FTemCode char(25) not null,
    FTemName varchar(70),
    FTemNameUp varchar(70),
    FTemTablename varchar(100),
    FTemRemTablename varchar(100),
    FTemFilename varchar(100),
    FTemDelimiter char(5),
    primary key (FTemCode)
);

create table fileTemplateFormat
(
    FTeFCode char(25) not null,
    FTeFFileTemCode char(25),
    FTeFColName varchar(100),
    FTeFColType char(1),
    FTeFColOrder int,
    FTeFColLength int,
    FTeFColPKFlag char(1),
    FTeFColFormat varchar(50),
    FTeFRemColName varchar(100),
    FTeFRemColType char(1),
    FTeFRemColPKFlag char(1),
    FTeFRemColFormat varchar(50),
    primary key (FTeFCode)
);

create table userGroups
(
    userGroupId int not null,
    userGroupName char(25),
    userGroupDescr varchar(100),
    userGroupDescrLG varchar(100),
    userGroupDescrLG1 varchar(100),
    userGroupDescrLG2 varchar(100),
    userGroupDescrLG3 varchar(100),
    userGroupDescrLG4 varchar(100),
    userGroupDescrLG5 varchar(100),
    userGroupDefFlag char(1),
    userGroupGrantLogin char(1),
    primary key (userGroupId)
);

create table securityObjects
(
    SOId int not null,
    SOObjectName char(50) not null,
    SODescr varchar(250),
    SODefPerm int,
    primary key (SOId)
);

create table securityPolicy
(
    SPId int not null,
    SPObject char(50) not null,
    SPPermissions int not null,
    primary key (SPId, SPObject)
);

create table adminUsers
(
    ausrCode char(25) not null,
    ausrFirstname varchar(50),
    ausrFirstnameUp varchar(50),
    ausrLastname varchar(50),
    ausrLastnameUp varchar(50),
    ausrLogCode char(25),
    constraint PK_ADMINUSERS primary key (ausrCode)
);

create table users
(
    logCode char(25) not null,
    usrName char(80) not null,
    usrPasswd char(100) not null,
    usrAccessLevel int,
    lastIpUsed varchar(50),
    dateLastUsed timestamp,
    primary key (logCode)
);

alter table securityPolicy add constraint FK_SECURITYP_USERGROU foreign key (SPId) references userGroups (userGroupId);
alter table users add constraint FK_LOGIN_USERGROU foreign key (usrAccessLevel) references userGroups (userGroupId);
alter table adminUsers add constraint FK_ADMINUSE_LOGIN foreign key (ausrLogCode) references users (logCode);
alter table fileTemplateFormat add constraint FK_FILETEMP_FILETEMFO_FILETEMP foreign key (FTeFFileTemCode) references fileTemplate (FTemCode);

create asc index IX_FTemNameUp on fileTemplate (FTemNameUp);
create asc index IX_FTeFColOrder on fileTemplateFormat (FTeFColOrder);
create unique asc index IX_SOName on securityObjects (SOObjectName);
create index IX_ausrLastnameUp on adminUsers (ausrLastnameUp);
create index IX_ausrLastname on adminUsers (ausrLastname);
create unique asc index IX_logUsername on users (usrName);

create table manufact
(
    manufactId char(25) not null,
    manufactAfm char(15),
    manufactName varchar(75),
    manufactNameUp varchar(75),
    manufactNameLG varchar(75),
    manufactNameUpLG varchar(75),
    manufactNameLG1 varchar(75),
    manufactNameLG2 varchar(75),
    manufactNameLG3 varchar(75),
    manufactNameLG4 varchar(75),
    manufactNameLG5 varchar(75),
    manufactAddress varchar(100),
    manufactArea char(20),
    manufactCity varchar(50),
    manufactRegion varchar(50),
    manufactCountry char(20),
    manufactZipCode char(10),
    manufactPhone varchar(30),
    manufactEmail varchar(75),
    manufactLang char(2),
    constraint PK_manufact primary key (manufactId)
);

create table supplier
(
    supplierId char(25) not null,
    supLogCode char(25),
    afm char(15),
    companyName varchar(75),
    companyNameUp varchar(75),
    companyNameLG varchar(75),
    companyNameUpLG varchar(75),
    companyNameLG1 varchar(75),
    companyNameLG2 varchar(75),
    companyNameLG3 varchar(75),
    companyNameLG4 varchar(75),
    companyNameLG5 varchar(75),
    address varchar(100),
    area char(20),
    city varchar(50),
    region varchar(50),
    country char(20),
    zipCode char(10),
    phone varchar(30),
    email varchar(75),
    profession varchar(100),
    constraint PK_supplier primary key (supplierId)
);

create table shippingCat
(
	SCCode char(25) not null,
	SCName varchar(80),
	constraint PK_shippingCat primary key (SCCode)
);

create table prdCategory
(
    catId char(25) not null,
    catName varchar(160),
    catNameUp varchar(160),
    catNameLG varchar(160),
    catNameUpLG varchar(160),
    catNameLG1 varchar(160),
    catNameUpLG1 varchar(160),
    catNameLG2 varchar(160),
    catNameUpLG2 varchar(160),
    catNameLG3 varchar(160),
    catNameUpLG3 varchar(160),
    keywords varchar(160),
    keywordsUp varchar(160),
    keywordsLG varchar(160),
    keywordsUpLG varchar(160),
    keywordsLG1 varchar(160),
    keywordsUpLG1 varchar(160),
    keywordsLG2 varchar(160),
    keywordsUpLG2 varchar(160),
    keywordsLG3 varchar(160),
    keywordsUpLG3 varchar(160),
    catShowFlag char(1),
    catParentFlag char(1),
    catRank int,
    catDescr BLOB SUB_TYPE 1,
    catDescrLG BLOB SUB_TYPE 1,
    catDescrLG1 BLOB SUB_TYPE 1,
    catDescrLG2 BLOB SUB_TYPE 1,
    catDescrLG3 BLOB SUB_TYPE 1,
    catImgName1 varchar(80),
    catImgName2 varchar(80),
    catCustomerType char(1),
    constraint PK_prdCategory primary key (catId)
);
create index IX_prdCCatNameUp on prdCategory (catNameUp);
create index IX_prdCCatNameUpLG on prdCategory (catNameUpLG);
create index IX_prdCCatNameUpLG1 on prdCategory (catNameUpLG1);
create index IX_prdCCatNameUpLG2 on prdCategory (catNameUpLG2);
create index IX_prdCCatNameUpLG3 on prdCategory (catNameUpLG3);

create table product
(
    prdId char(25) not null,
    prdEntryDate timestamp,
    prdId2 char(25),
    name varchar(160),
    nameUp varchar(160),
    nameLG varchar(160),
    nameUpLG varchar(160),
    nameLG1 varchar(160),
    nameUpLG1 varchar(160),
    nameLG2 varchar(160),
    nameUpLG2 varchar(160),
    nameLG3 varchar(160),
    nameUpLG3 varchar(160),
    descr BLOB SUB_TYPE 1,
    descrLG BLOB SUB_TYPE 1,
    descrLG1 BLOB SUB_TYPE 1,
    descrLG2 BLOB SUB_TYPE 1,
    descrLG3 BLOB SUB_TYPE 1,
    supplierId char(25),
    vatPct numeric(5,3),
    mUnit char(40),
    mUnitUp char(40),
    mUnitLG char(40),
    mUnitUpLG char(40),
    mUnitLG1 char(40),
    mUnitUpLG1 char(40),
    mUnitLG2 char(40),
    mUnitUpLG2 char(40),
    mUnitLG3 char(40),
    mUnitUpLG3 char(40),
    wholesalePrc numeric(11,2),
    wholesalePrcEU numeric(13,4),
    wholesalePrcCUR1 numeric(13,4),
    wholesalePrcCUR2 numeric(13,4),
    retailPrc numeric(11,2),
    retailPrcEU numeric(13,4),
    retailPrcCUR1 numeric(13,4),
    retailPrcCUR2 numeric(13,4),
    slWholesalePrc numeric(11,2),
    slWholesalePrcEU numeric(13,4),
    slWholesalePrcCUR1 numeric(13,4),
    slWholesalePrcCUR2 numeric(13,4),
    slRetailPrc numeric(11,2),
    slRetailPrcEU numeric(13,4),
    slRetailPrcCUR1 numeric(13,4),
    slRetailPrcCUR2 numeric(13,4),
    hdWholesalePrc numeric(11,2),
    hdWholesalePrcEU numeric(13,4),
    hdWholesalePrcCUR1 numeric(13,4),
    hdWholesalePrcCUR2 numeric(13,4),
    hdRetailPrc numeric(11,2),
    hdRetailPrcEU numeric(13,4),
    hdRetailPrcCUR1 numeric(13,4),
    hdRetailPrcCUR2 numeric(13,4),
    giftPrc numeric(11,2),
    giftPrcEU numeric(13,4),
    giftPrcCUR1 numeric(13,4),
    giftPrcCUR2 numeric(13,4),
    weight numeric(12,3),
    cubemeter numeric(12,3),
    minOrderQua numeric(11,3),
    maxOrderQua numeric(11,3),
    stockQua numeric(11,3),
    safetyStockQua numeric(11,3),
    package varchar(40),
    packageLG varchar(40),
    packageLG1 varchar(40),
    packageLG2 varchar(40),
    packageLG3 varchar(40),
    img varchar(40),
    img2 varchar(40),
    img3 varchar(40),
    img4 varchar(40),
    barcode char(25),
    deliveryDays int,
    catId char(25),
    hdStockFlag char(1),
    hdStockFlagW char(1),
    hotdealFlag char(1),
    hotdealFlagW char(1),
    salesFlag char(1),
    salesFlagW char(1),
    hdBeginDate timestamp,
    hdEndDate timestamp,
    hdBeginDateW timestamp,
    hdEndDateW timestamp,
    shippingKindZone char(10),
    shippingValue numeric(13,2),
    shippingValueEU numeric(13,4),
    shippingValueCUR1 numeric(13,4),
    shippingValueCUR2 numeric(13,4),
    shippingVatPct numeric(3,2),
    inQua numeric(11,3),
    outQua numeric(11,3),
    inVal numeric(13,2),
    inValEU numeric(13,4),
    inValCUR1 numeric(13,4),
    inValCUR2 numeric(13,4),
    outVal numeric(13,2),
    outValEU numeric(13,4),
    outValCUR1 numeric(13,4),
    outValCUR2 numeric(13,4),
    prdLock char(1),
    prdManufactId char(25),
    prdHideFlag char(1),
    prdHideFlagW char(1),
    prdNewColl char(1),
    prdHomePageLink varchar(100),
    prdCompFlag char(1),
    prdHasAttributes char(1),
    prdStopSalesGlobal char(1),
    prdStartSales char(1),
    prd_SCCode char(25),
    prdImageCaption varchar(250),
    prdImageCaptionLG varchar(250),
    prdImageCaptionLG1 varchar(250),
    prdImageCaptionLG2 varchar(250),
    prdImageCaptionLG3 varchar(250),
    specs BLOB SUB_TYPE 1,
    specsLG BLOB SUB_TYPE 1,
    specsLG1 BLOB SUB_TYPE 1,
    specsLG2 BLOB SUB_TYPE 1,
    specsLG3 BLOB SUB_TYPE 1,
    prdAvailability char(1),
    text1Title varchar(250),
    text1 BLOB SUB_TYPE 1,
    text1TitleLG varchar(250),
    text1LG BLOB SUB_TYPE 1,
    text2Title varchar(250),
    text2 BLOB SUB_TYPE 1,
    text2TitleLG varchar(250),
    text2LG BLOB SUB_TYPE 1,
    text3Title varchar(250),
    text3 BLOB SUB_TYPE 1,
    text3TitleLG varchar(250),
    text3LG BLOB SUB_TYPE 1,
    text4Title varchar(250),
    text4 BLOB SUB_TYPE 1,
    text4TitleLG varchar(250),
    text4LG BLOB SUB_TYPE 1,
    text5Title varchar(250),
    text5 BLOB SUB_TYPE 1,
    text5TitleLG varchar(250),
    text5LG BLOB SUB_TYPE 1,
		PRD_VAT_ID char(25) not null,
		PRD_GiftWrapAvail char(1),
    constraint PK_product primary key (prdId)
);
alter table product add constraint FK_PRODUCT_MANUFACT foreign key (prdManufactId) references manufact (manufactId);
alter table product add constraint FK_PRODUCT_SUPPLIER foreign key (supplierId) references supplier (supplierId);
alter table product add constraint FK_PRODUCT_SHIPPINGCAT foreign key (prd_SCCode) references shippingCat (SCCode);
alter table product add constraint FK_PRODUCT_VAT foreign key (PRD_VAT_ID) references VAT (VAT_ID);
/**
alter table product add text1Title varchar(250);
alter table product add text1 BLOB SUB_TYPE 1;
alter table product add text1TitleLG varchar(250);
alter table product add text1LG BLOB SUB_TYPE 1;
alter table product add text2Title varchar(250);
alter table product add text2 BLOB SUB_TYPE 1;
alter table product add text2TitleLG varchar(250);
alter table product add text2LG BLOB SUB_TYPE 1;
alter table product add text3Title varchar(250);
alter table product add text3 BLOB SUB_TYPE 1;
alter table product add text3TitleLG varchar(250);
alter table product add text3LG BLOB SUB_TYPE 1;
alter table product add text4Title varchar(250);
alter table product add text4 BLOB SUB_TYPE 1;
alter table product add text4TitleLG varchar(250);
alter table product add text4LG BLOB SUB_TYPE 1;
alter table product add text5Title varchar(250);
alter table product add text5 BLOB SUB_TYPE 1;
alter table product add text5TitleLG varchar(250);
alter table product add text5LG BLOB SUB_TYPE 1;

alter table product add nameLG4 varchar(160);
alter table product add nameUpLG4 varchar(160);
alter table product add descrLG4 BLOB SUB_TYPE 1;
alter table product add mUnitLG4 char(40);
alter table product add mUnitUpLG4 char(40);
alter table product add packageLG4 varchar(40);
alter table product add specsLG4 BLOB SUB_TYPE 1;
alter table product add prdImageCaptionLG4 varchar(250);
alter table product add nameLG5 varchar(160);
alter table product add nameUpLG5 varchar(160);
alter table product add descrLG5 BLOB SUB_TYPE 1;
alter table product add mUnitLG5 char(40);
alter table product add mUnitUpLG5 char(40);
alter table product add packageLG5 varchar(40);
alter table product add specsLG5 BLOB SUB_TYPE 1;
alter table product add prdImageCaptionLG5 varchar(250);

alter table product add text1TitleLG1 varchar(250);
alter table product add text1LG1 BLOB SUB_TYPE 1;
alter table product add text2TitleLG1 varchar(250);
alter table product add text2LG1 BLOB SUB_TYPE 1;
alter table product add text3TitleLG1 varchar(250);
alter table product add text3LG1 BLOB SUB_TYPE 1;
alter table product add text4TitleLG1 varchar(250);
alter table product add text4LG1 BLOB SUB_TYPE 1;
alter table product add text5TitleLG1 varchar(250);
alter table product add text5LG1 BLOB SUB_TYPE 1;

alter table product add text1TitleLG2 varchar(250);
alter table product add text1LG2 blob sub_type 1;
alter table product add text2TitleLG2 varchar(250);
alter table product add text2LG2 blob sub_type 1;
alter table product add text3TitleLG2 varchar(250);
alter table product add text3LG2 blob sub_type 1;
alter table product add text4TitleLG2 varchar(250);
alter table product add text4LG2 blob sub_type 1;
alter table product add text5TitleLG2 varchar(250);
alter table product add text5LG2 blob sub_type 1;

alter table product add text1TitleLG3 varchar(250);
alter table product add text1LG3 blob sub_type 1;
alter table product add text2TitleLG3 varchar(250);
alter table product add text2LG3 blob sub_type 1;
alter table product add text3TitleLG3 varchar(250);
alter table product add text3LG3 blob sub_type 1;
alter table product add text4TitleLG3 varchar(250);
alter table product add text4LG3 blob sub_type 1;
alter table product add text5TitleLG3 varchar(250);
alter table product add text5LG3 blob sub_type 1;

alter table product add PRD_VAT_ID char(25) not null;
alter table product add PRD_GiftWrapAvail char(1);
**/
create index IX_prdNameUp on product (nameUp);
create index IX_prdNameUpLG on product (nameUpLG);
create index IX_prdNameUpLG1 on product (nameUpLG1);
create index IX_prdNameUpLG2 on product (nameUpLG2);
create index IX_prdNameUpLG3 on product (nameUpLG3);

create asc index IX_retailPrcEU_A on product (retailPrcEU); /** 22-06-2015 added **/
create desc index IX_retailPrcEU_D on product (retailPrcEU); /** 22-06-2015 added **/
create desc index IX_prdNewColl_D on product (prdNewColl); /** 22-06-2015 added **/
create asc index IX_prdHideFlag_A on product (prdHideFlag); /** 22-06-2015 added **/
create asc index IX_prdHideFlagW_A on product (prdHideFlagW); /** 22-06-2015 added **/
create desc index IX_prdCompFlag_D on product (prdCompFlag); /** 23-06-2015 added **/

create table prdInCatTab
(
    PINCCode char(25) not null,
    PINCPrdId char(25) not null,
    PINCCatId char(25) not null,
    PINCPrimary char(1),
    PINCRank int,
    constraint PK_prdInCatTab primary key (PINCCode)
);
alter table prdInCatTab add constraint FK_PINC_PRODUCT foreign key (PINCPrdId) references product (prdId);
alter table prdInCatTab add constraint FK_PINC_PRDCAT foreign key (PINCCatId) references prdCategory (catId);

create table prdMonthly
(
    prdMId char(25) not null,
    prdMYear int not null,
    prdMMonth int not null,
    prdMInQua numeric(11,3),
    prdMOutQua numeric(11,3),
    prdMInVal numeric(13,2),
    prdMInValEU numeric(13,4),
    prdMInValCUR1 numeric(13,4),
    prdMInValCUR2 numeric(13,4),
    prdMOutVal numeric(13,2),
    prdMOutValEU numeric(13,4),
    prdMOutValCUR1 numeric(13,4),
    prdMOutValCUR2 numeric(13,4),
    prdMLock char(1),
    constraint PK_prdMonthly primary key (prdMId, prdMYear, prdMMonth)
);
alter table prdMonthly add constraint FK_PRDMONTHL_PRODUCT foreign key (prdMId) references product (prdId);

create table customer
(
    customerId char(25) not null,
    custLogCode char(25) not null,
    dateCreated               timestamp,
    dateLastUsed              timestamp,
    firstname                 varchar(30),
    firstnameUp               varchar(30),
    lastname                  varchar(30),
    lastnameUp                varchar(30),
    occupation                varchar(100),
    email                     varchar(75),
    phone                     varchar(30),
    fax                       varchar(30),
    title                     varchar(100),
    sex                       char(1),
    discountPct               numeric(3,2),
    customerType              int,
    contactUsId               int,
    contactUsDescr            varchar(150),
    birthDate                 timestamp,
    purchaseVal               numeric(13,2),
    purchaseValEU             numeric(13,4),
    purchaseValCUR1           numeric(13,4),
    purchaseValCUR2           numeric(13,4),
    hotdealBuysCnt            int,
    buysCnt                   int,
    custLock                  char(1),
    custLang                  char(25),
    receiveEmail              char(1),
    lockedAccnt               char(1),
    receiveSMS                char(1),
    quest1                    varchar(250),
    answer1                   varchar(250),
    quest2                    varchar(250),
    answer2                   varchar(250),
    constraint PK_customer primary key (customerId)
);
alter table customer add constraint FK_CUSTOMER__LOGIN foreign key  (custLogCode) references users (logCode);
create index IX_custName on customer (lastname, firstname);
create index IX_custNameUp on customer (lastnameUp, firstnameUp);
create unique index IX_custEmail on customer (email);

create table orders
(
    orderId                   char(25) not null,
    orderDate                 timestamp not null,
    customerId                char(25),
    documentType              int not null,
    quantity                  numeric(12,3),
    valueDR                   numeric(13,2),
    valueEU                   numeric(13,4),
    valueCUR1                 numeric(13,4),
    valueCUR2                 numeric(13,4),
    vatVal                    numeric(13,2),
    vatValEU                  numeric(13,4),
    vatValCUR1                numeric(13,4),
    vatValCUR2                numeric(13,4),
    shippingValue             numeric(13,2),
    shippingValueEU           numeric(13,4),
    shippingValueCUR1         numeric(13,4),
    shippingValueCUR2         numeric(13,4),
    shippingVatVal            numeric(13,2),
    shippingVatValEU          numeric(13,4),
    shippingVatValCUR1        numeric(13,4),
    shippingVatValCUR2        numeric(13,4),
    shippingWayZone           char(25),
    status                    char(1),
    deliveryDate              timestamp,
    memberFlag                char(1),
    giftFlag                  char(1),
    afm                       char(15),
    doy                       varchar(40),
    firstname                 varchar(30),
    lastname                  varchar(30),
    occupation                varchar(100),
    companyName               varchar(75),
    shippingName              varchar(75),
    shippingAddress           varchar(100),
    billingAddress            varchar(100),
    shippingArea              varchar(50),
    billingArea               varchar(50),
    shippingCity              varchar(80),
    billingCity               varchar(50),
    shippingRegion            varchar(80),
    billingRegion             varchar(50),
    shippingCountry           varchar(50),
    billingCountry            varchar(50),
    shippingZipCode           char(10),
    billingZipCode            char(10),
    shippingPhone             varchar(30),
    billingPhone              varchar(30),
    email                     varchar(75),
    profession                varchar(100),
    title                     varchar(50),
    sex                       char(1),
    orderLock                 char(1),
    ordCreditType             char(20),
    ordCreditExpDay           timestamp,
    ordCreditNum              char(20),
    ordCreditOwner            varchar(50),
    ordPayWay                 char(20),
    ordPayCash                char(10),
    ordPTCode                 char(25),
    ordPTDuration             int,
    ordPTHappyTime            int,
    ordPTPrePayVal            numeric(13,2),
    ordPTPrePayValEU          numeric(13,4),
    ordPTPrePayValCUR1        numeric(13,4),
    ordPTPrePayValCUR2        numeric(13,4),
    ordPTTotalVal             numeric(13,2),
    ordPTTotalValEU           numeric(13,4),
    ordPTTotalValCUR1         numeric(13,4),
    ordPTTotalValCUR2         numeric(13,4),
    ordPTMonthRate            numeric(4,3),
    ordPTTotalRate            numeric(4,3),
    ordBankTran               char(30),
    ordLang                   char(25),
    ordPrefNotes              BLOB SUB_TYPE 1,
    ordHistDetails            BLOB SUB_TYPE 1,
    ordGiftCardMsg            varchar(250),
    ordYear                   int,
    ordAA                     int,
    shippingDistrict          varchar(80),
    shippingLocation          varchar(80),
    constraint PK_orders primary key (orderId)
);

create table prdImports
(
    transId                   char(25) not null,
    orderId                   char(25),
    prdId                     char(25) not null,
    quantity                  numeric(12,3),
    unitPrc                   numeric(11,2),
    unitPrcEU                 numeric(13,4),
    unitPrcCUR1               numeric(13,4),
    unitPrcCUR2               numeric(13,4),
    valueDR                   numeric(13,2),
    valueEU                   numeric(13,4),
    valueCUR1                 numeric(13,4),
    valueCUR2                 numeric(13,4),
    vatVal                    numeric(13,2),
    vatValEU                  numeric(13,4),
    vatValCUR1                numeric(13,4),
    vatValCUR2                numeric(13,4),
    importDate                timestamp not null,
    status                    char(1),
    inOutFlag                 char(1),
    prdIPrdKind               char(1),
    importLock                char(1),
    constraint PK_prdImports primary key (transId)
);
alter table prdImports add constraint FK_PRDIMPORT_PRODUCT foreign key  (prdId) references product (prdId);
create index IX_importDate on prdImports (importDate);

create table transactions
(
    transId int not null,
    orderId char(25) not null,
    prdId char(25) not null,
    quantity numeric(12,3),
    unitPrc numeric(11,2),
    unitPrcEU numeric(13,4),
    unitPrcCUR1 numeric(13,4),
    unitPrcCUR2 numeric(13,4),
    valueDR numeric(13,2),
    valueEU numeric(13,4),
    valueCUR1 numeric(13,4),
    valueCUR2 numeric(13,4),
    vatVal numeric(13,2),
    vatValEU numeric(13,4),
    vatValCUR1 numeric(13,4),
    vatValCUR2 numeric(13,4),
    orderDate timestamp not null,
    deliveryDate timestamp,
    status char(1),
    inOutFlag char(1),
    hotdealFlag char(1),
    transLock char(1),
    transCompPart int,
    transSPOfferPart int,
    transCompId char(25),
    transCompName varchar(75),
    transSPOfferId char(25),
    transSPOfferName varchar(75),
    transPrdAttCode char(25),
    transPrdAttAtt1 varchar(50),
    transPrdAttAtt2 varchar(50),
    transPrdAttAtt3 varchar(50),
    transStartUse timestamp,
    transEndUse timestamp,
    transLang char(25),
    transPrdAId char(25),
    transPrdKind char(1),
    transDocumentType int,
    constraint PK_transactions primary key (transId, orderId)
);
alter table transactions add constraint FK_TRANSACTI_PRODUCT foreign key  (prdId) references product (prdId);
alter table transactions add constraint FK_TRANSACT_ORDERS foreign key  (orderId) references orders (orderId);
create index IX_orderDate on transactions (orderDate);

create table shipBillInfo
(
    SBCode char(25) not null,
    SBCustomerId char(25),
    SBSorB char(1),
    SBName varchar(75),
    SBProfession varchar(100),
    SBAddress varchar(100),
    SBAreaCode char(20),
    SBCity varchar(50),
    SBRegion varchar(50),
    SBCountryCode char(25),
    SBZipCode varchar(50),
    SBPhone varchar(30),
    SBFax varchar(30),
    SBEmail varchar(75),
    SBAfm char(15),
    SBDoy varchar(40),
    SBCreditType char(20),
    SBCreditExpDay timestamp,
    SBCreditNum char(20),
    SBCreditOwner varchar(50),
    SBLang char(25),
    SBCellPhone varchar(30),
    constraint PK_shipBillInfo primary key (SBCode)
);
alter table shipBillInfo add constraint FK_SHIPBILL_CUSTOMER foreign key  (SBCustomerId) references customer (customerId);
alter table shipBillInfo add constraint FK_shipBillInfo_country foreign key (SBCountryCode) references country (countryCode);

create table lTab
(
    lTabCode                  char(1)                not null,
    lTabFld                   char(1)                not null,
    constraint PK_LTAB primary key (lTabCode)
);

create table attribute
(
    atrCode char(25) not null,
    atrName varchar(100),
    atrNameLG varchar(100),
    atrNameLG1 varchar(100),
    atrNameLG2 varchar(100),
    atrNameLG3 varchar(100),
    atrNameLG4 varchar(100),
    atrNameLG5 varchar(100),
    atrNameUp varchar(100),
    atrNameUpLG varchar(100),
    constraint PK_ATTRIBUTE primary key (atrCode)
);
create table slaveAttribute
(
    SLATCode char(25) not null,
    SLAT_master_atrCode char(25) not null,
    SLAT_slave_atrCode char(25) not null,
    constraint PK_SLAVEATTRIBUTE primary key (SLATCode)
);
create table attributeValue
(
    ATVACode char(25) not null,
    ATVA_atrCode char(25) not null,
    ATVAValue varchar(250),
    ATVAValueLG varchar(250),
    ATVAValueLG1 varchar(250),
    ATVAValueLG2 varchar(250),
    ATVAValueLG3 varchar(250),
    ATVAValueLG4 varchar(250),
    ATVAValueLG5 varchar(250),
    constraint PK_ATTRIBUTEVALUE primary key (ATVACode)
);

create table productMasterAttribute
(
    PMACode char(25) not null,
    PMA_prdId char(25) not null,
    PMA_atrCode char(25) not null,
    PMAPositionKey char(5),
    constraint PK_PMA primary key (PMACode)
);
create table productMasterAttributeValue
(
    PMAVCode char(25) not null,
    PMAV_prdId char(25) not null,
    PMAV_ATVACode char(25) not null,
    PMAVStock numeric(12,4),
    PMAVPrice numeric(12,4),
    PMAVImageName_s varchar(250),
    PMAVImageName_b varchar(250),
    PMAV_PMACode char(25),
    PMAVRank int,
    PMAVLock char(1),
    constraint PK_PMAV primary key (PMAVCode)
);
create table PMASV
(
    PMASVCode char(25) not null,
    PMASV_PMAVCode char(25) not null,
    PMASV_ATVACode char(25) not null,
    PMASVStock numeric(12,4),
    PMASVPrice numeric(12,4),
    constraint PK_PMASV primary key (PMASVCode)
);
create table transAttribute
(
    TAVCode char(25) not null,
    TAV_transId int not null,
    TAV_orderId char(25) not null,
    TAVHasPrice int,
    TAVKeepStock int,
    TAVAtrName varchar(100),
    TAV_PMAVCode char(25),
    TAVValue char(25),
    TAVSlaveFlag int,
    TAVStock numeric(13,4),
    TAVPrice numeric(13,4),
    constraint PK_TRANSATTRIBUTE primary key (TAVCode)
);
alter table PMASV add foreign key (PMASV_PMAVCode) references productMasterAttributeValue (PMAVCode) on update cascade on delete cascade;
alter table PMASV add foreign key (PMASV_ATVACode) references attributeValue (ATVACode);
alter table productMasterAttributeValue add foreign key (PMAV_ATVACode) references attributeValue (ATVACode);
alter table productMasterAttributeValue add foreign key (PMAV_PMACode) references productMasterAttribute (PMACode) on update cascade on delete cascade;
alter table productMasterAttribute add foreign key (PMA_prdId) references product (prdId) on update cascade on delete cascade;
alter table productMasterAttribute add foreign key (PMA_atrCode) references attribute (atrCode);
alter table attributeValue add foreign key (ATVA_atrCode) references attribute (atrCode) on update cascade on delete cascade;
alter table slaveAttribute add foreign key (SLAT_master_atrCode) references attribute (atrCode) on update cascade on delete cascade;
alter table transAttribute add foreign key (TAV_transId,TAV_orderId) references transactions (transId,orderId) on update cascade on delete cascade;


CREATE TABLE ShipCostRange
(
    SHCRCode char(25) NOT NULL,
    SHCRTitle varchar(80),
    SHCRStart numeric(13,4),
    SHCREnd numeric(13,4),
    SHCRFlag char (1),
    CONSTRAINT PK_ShipCostRange PRIMARY KEY (SHCRCode)
);

CREATE TABLE ShipCostMethod
(
    SHCMCode char(25) NOT NULL,
    SHCMTitle varchar(160),
    SHCMTitleLG varchar(160),
    SHCMTitleLG1 varchar(160),
    SHCMTitleLG2 varchar(160),
    SHCMText BLOB SUB_TYPE 1,
    SHCMTextLG BLOB SUB_TYPE 1,
    SHCMTextLG1 BLOB SUB_TYPE 1,
    SHCMTextLG2 BLOB SUB_TYPE 1,
    SHCMFlag char (1),
    CONSTRAINT PK_ShipCostMethod PRIMARY KEY (SHCMCode)
);

CREATE TABLE ShipCostEntry
(
    SHCECode char(25) NOT NULL,
    SHCE_SHCRCode char(25),
    SHCE_countryCode char(25),
    SHCE_SHCMCode char(25),
    SHCETitle varchar(80),
    SHCEPrice numeric(13,4),
    SHCEVATPct numeric(6,3),
    SHCEText BLOB SUB_TYPE 1,
    SHCETextLG BLOB SUB_TYPE 1,
    SHCETextLG1 BLOB SUB_TYPE 1,
    SHCETextLG2 BLOB SUB_TYPE 1,
    CONSTRAINT PK_ShipCostEntry PRIMARY KEY (SHCECode)
);
ALTER TABLE ShipCostEntry ADD CONSTRAINT FK_SHCE_SHCRCode FOREIGN KEY (SHCE_SHCRCode) REFERENCES ShipCostRange (SHCRCode) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ShipCostEntry ADD CONSTRAINT FK_SHCE_countryCode FOREIGN KEY (SHCE_countryCode) REFERENCES country (countryCode) ON DELETE CASCADE ON UPDATE CASCADE;

create table CustomerInformation
(
    CSICode char(25) not null,
    CSI_customerId char(25) not null,
    CSIText BLOB SUB_TYPE 1 CHARACTER SET UNICODE_FSS,
    
    constraint PK_CustomerInformation primary key (CSICode)
);
alter table CustomerInformation add foreign key (CSI_customerId) references customer (customerId) on update cascade on delete cascade;

create table Member (
    memberCode char(25) not null,
    memberRegistrationDate timestamp,
    memberLogCode char(25) not null,
    memberID char(25),
    memberEmail varchar(80),
    memberFirstname varchar(50),
    memberLastname varchar(50),
    memberLastnameUp varchar(50),
    memberFathername varchar(50),
    memberBirthDate timestamp,
    memberAddress varchar(100),
    memberPostalCode varchar(10),
    memberCity varchar(50),
    memberCountryCode char(25),
    memberPhone1 varchar(32),
    memberPhone2 varchar(32),
    memberFax varchar(32),
    memberCompany varchar(80),
    memberCompanyUp varchar(80),
    memberProfession varchar(100),
    memberVATNumber varchar(20),
    memberIRS varchar(40),
    memberText BLOB SUB_TYPE 1,
    memberTextLG BLOB SUB_TYPE 1,
    memberLang char(3),
    memberLogons int,
    memberLockedAccount char(1),
    memberTmp char(1),
    constraint PK_memberCode primary key (memberCode)
);
alter table Member add constraint FK_memberLogCode foreign key (memberLogCode) references users (logCode);
create asc index IX_memberLastnameUp on Member (memberLastnameUp);
create asc index IX_memberCompanyUp on Member (memberCompanyUp);
create unique asc index IX_memberEmail on Member (memberEmail);

insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('GR','ΕΛΛΑΔΑ','GREECE','GREECE','GREECE');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0002','ΑΓΚΟΛΑ','ANGOLA ','ANGOLA ','ANGOLA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0003','ΑΖΕΡΜΠΑΪΤΖΑΝ','AZERBAIJAN ','AZERBAIJAN ','AZERBAIJAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0004','ΑΖΟΡΕΣ','AZORES (PORTUGAL)','AZORES (PORTUGAL)','AZORES (PORTUGAL)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0005','ΑΙΓΥΠΤΟΣ','EGYPT ','EGYPT ','EGYPT ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0007','ΑΪΤΗ','HAITI ','HAITI ','HAITI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0008','ΑΚΤΗ ΕΛΕΦΑΝΤΟΣΤΟΥ','COTE D^27IVOIRE ','COTE D^27IVOIRE ','COTE D^27IVOIRE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0009','ΑΛΒΑΝΙΑ','ALBANIA ','ALBANIA ','ALBANIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0010','ΑΛΓΕΡΙΑ','ALGERIA ','ALGERIA ','ALGERIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0011','ΑΜΕΡΙΚΑΝΙΚΗ ΣΑΜΟΑ','AMERICAN SAMOA','AMERICAN SAMOA','AMERICAN SAMOA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0012','ΑΝΓΚΟΥΙΛΛΑ','ANGUILLA ','ANGUILLA ','ANGUILLA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0013','ΑΝΔΟΡΡΑ','ANDORRA ','ANDORRA ','ANDORRA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0014','ΑΝΤΙΓΚΟΥΑ ΚΑΙ ΜΠΑΡΜΠΟΥΝΤΑ','ANTIGUA AND BARBUDA ','ANTIGUA AND BARBUDA ','ANTIGUA AND BARBUDA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0015','ΑΡΓΕΝΤΙΝΗ','ARGENTINA ','ARGENTINA ','ARGENTINA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0016','ΑΡΜΕΝΙΑ','ARMENIA ','ARMENIA ','ARMENIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0017','ΑΡΟΥΜΠΑ','ARUBA ','ARUBA ','ARUBA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0018','ΑΥΣΤΡΑΛΙΑ','AUSTRALIA','AUSTRALIA','AUSTRALIA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0019','ΑΥΣΤΡΙΑ ΕΕ','AUSTRIA ','AUSTRIA ','AUSTRIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0020','ΒΑΝΟΥΑΤΟΥ','VANUATU','VANUATU','VANUATU');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0021','ΒΕΛΓΙΟ ΕΕ','BELGIUM ','BELGIUM ','BELGIUM ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0022','ΒΕΝΕΖΟΥΕΛΑ','VENEZUELA ','VENEZUELA ','VENEZUELA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0023','ΒΕΡΜΟΥΔΕΣ','BERMUDA ','BERMUDA ','BERMUDA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0024','ΒΙΕΤΝΑΜ','VIET NAM ','VIET NAM ','VIET NAM ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0025','ΒΙΡΤΖΙΝ ΓΚΟΡΝΤΑ','VIRGIN GORDA (BRITISH VIRGIN ISLANDS)','VIRGIN GORDA (BRITISH VIRGIN ISLANDS)','VIRGIN GORDA (BRITISH VIRGIN ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0026','ΒΟΛΙΒΙΑ','BOLIVIA ','BOLIVIA ','BOLIVIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0027','ΒΟΣΝΙΑ & ΕΡΖΕΓΟΒΙΝΗ','BOSNIA AND HERZEGOWINA ','BOSNIA AND HERZEGOWINA ','BOSNIA AND HERZEGOWINA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0028','ΒΟΥΛΓΑΡΙΑ','BULGARIA ','BULGARIA ','BULGARIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0029','ΒΡΑΖΙΛΙΑ','BRAZIL ','BRAZIL ','BRAZIL ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0030','ΒΡΕΤΑΝΙΚΟΙ ΝΗΣΟΙ ΠΑΡΘΕΝΟΥ','BRITISH INDIAN OCEAN TERRITORY ','BRITISH INDIAN OCEAN TERRITORY ','BRITISH INDIAN OCEAN TERRITORY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0031','ΓΑΛΛΙΑ ΕΕ','FRANCE ','FRANCE ','FRANCE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0032','ΓΑΛΛΙΚΗ ΓΟΥΙΑΝΑ','FRENCH GUIANA ','FRENCH GUIANA ','FRENCH GUIANA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0033','ΓΑΛΛΙΚΗ ΠΟΛΥΝΗΣΙΑ','FRENCH POLYNESIA ','FRENCH POLYNESIA ','FRENCH POLYNESIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0034','ΓΑΖΑ (ΔΥΤΙΚΗ ΟΧΘΗ)','GAZA (WEST BANK)','GAZA (WEST BANK)','GAZA (WEST BANK)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0035','ΓΕΡΜΑΝΙΑ ΕΕ','GERMANY ','GERMANY ','GERMANY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0036','ΓΕΩΡΓΙΑ','GEORGIA ','GEORGIA ','GEORGIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0037','ΓΙΑΠ (ΜΙΚΡΟΝΗΣΙΑ,ΟΜΟΣΠ. ΚΡΑΤ.)','YAP (FEDERATED STATES OF MICRONESIA)','YAP (FEDERATED STATES OF MICRONESIA)','YAP (FEDERATED STATES OF MICRONESIA)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0038','ΓΙΒΡΑΛΤΑΡ','GIBRALTAR ','GIBRALTAR ','GIBRALTAR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0039','ΓΚΑΜΠΙΑ','GAMBIA ','GAMBIA ','GAMBIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0040','ΓΚΑΜΠΟΝ','GABON ','GABON ','GABON ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0041','ΓΚΑΝΑ','GHANA ','GHANA ','GHANA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0042','ΓΚΟΥΑΜ','GUAM ','GUAM ','GUAM ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0043','ΓΟΥΑΔΕΛΟΥΠΗ','GUADELOUPE ','GUADELOUPE ','GUADELOUPE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0044','ΓΟΥΑΛΛΙΣ ΚΑΙ ΦΟΥΤΟΥΝΑ, ΝΗΣΟΙ','WALLIS AND FUTUNA ISLANDS','WALLIS AND FUTUNA ISLANDS','WALLIS AND FUTUNA ISLANDS');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0045','ΓΟΥΑΤΕΜΑΛΑ','GUATEMALA ','GUATEMALA ','GUATEMALA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0046','ΓΟΥΪΑΝΑ','GUYANA ','GUYANA ','GUYANA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0047','ΓΟΥΙΝΕΑ','GUINEA ','GUINEA ','GUINEA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0050','ΓΡΑΝΑΔΑ','GRENADA ','GRENADA ','GRENADA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0051','ΓΡΟΙΛΑΝΔΙΑ','GREENLAND ','GREENLAND ','GREENLAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0052','ΔΑΝΙΑ ΕΕ','DENMARK ','DENMARK ','DENMARK ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0053','ΔΟΜΙΝΙΚΑ','DOMINICA ','DOMINICA ','DOMINICA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0054','ΔΟΜΙΝΙΚΑΝΗ ΔΗΜΟΚΡΑΤΙΑ','DOMINICAN REPUBLIC ','DOMINICAN REPUBLIC ','DOMINICAN REPUBLIC ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0056','ΔΥΤΙΚΗ ΣΑΜΟΑ','SAMOA (WESTERN)','SAMOA (WESTERN)','SAMOA (WESTERN)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0057','ΕΛ ΣΑΛΒΑΔΟΡ','EL SALVADOR ','EL SALVADOR ','EL SALVADOR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0058','ΕΛΒΕΤΙΑ','SWITZERLAND ','SWITZERLAND ','SWITZERLAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0059','ΕΡΥΘΡΑΙΑ','ERITREA ','ERITREA ','ERITREA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0060','ΕΣΘΟΝΙΑ','ESTONIA ','ESTONIA ','ESTONIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0061','ΖΑΜΠΙΑ','ZAMBIA ','ZAMBIA ','ZAMBIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0062','ΖΙΜΠΑΜΠΟΥΕ','ZIMBABWE ','ZIMBABWE ','ZIMBABWE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0063','ΗΝΩΜΕΝΑ ΑΡΑΒΙΚΑ ΕΜΙΡΑΤΑ','UNITED ARAB EMIRATES ','UNITED ARAB EMIRATES ','UNITED ARAB EMIRATES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0064','ΗΝΩΜΕΝΕΣ ΠΟΛΙΤΕΙΕΣ ΑΜΕΡΙΚΗΣ','UNITED STATES OF AMERICA','UNITED STATES OF AMERICA','UNITED STATES OF AMERICA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0065','ΗΝΩΜΕΝΗ ΝΗΣΟΣ (ΣΑΙΝ ΒΙΝΣ. & ΓΡΕΝΑΔΙΝΕΣ)','ST. VINCENT AND THE GRENADINES','ST. VINCENT AND THE GRENADINES','ST. VINCENT AND THE GRENADINES');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0066','ΗΝΩΜΕΝΟ ΒΑΣΙΛΕΙΟ ΕΕ ','UNITED KINGDOM','UNITED KINGDOM','UNITED KINGDOM');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0067','ΙΑΠΩΝΙΑ','JAPAN ','JAPAN ','JAPAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0068','ΙΝΔΙΑ','INDIA ','INDIA ','INDIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0069','ΙΝΔΟΝΗΣΙΑ','INDONESIA ','INDONESIA ','INDONESIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0070','ΙΟΡΔΑΝΙΑ','JORDAN ','JORDAN ','JORDAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0071','ΙΡΑΚ','IRAQ ','IRAQ ','IRAQ ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0072','ΙΡΛΑΝΔΙΑ,ΔΗΜΟΚΡΑΤΙΑ ΤΗΣ ΕΕ','IRELAND ','IRELAND ','IRELAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0073','ΙΣΗΜΕΡΙΝΟΣ','ECUADOR ','ECUADOR ','ECUADOR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0074','ΙΣΛΑΝΔΙΑ','ICELAND ','ICELAND ','ICELAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0075','ΙΣΠΑΝΙΑ  ΕΕ','SPAIN ','SPAIN ','SPAIN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0076','ΙΣΡΑΗΛ','ISRAEL ','ISRAEL ','ISRAEL ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0077','ΙΤΑΛΙΑ','ITALY ','ITALY ','ITALY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0078','ΚΑΖΑΚΣΤΑΝ','KAZAKHSTAN ','KAZAKHSTAN ','KAZAKHSTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0079','ΚΑΙΜΑΝ ΝΗΣΟΙ','CAYMAN ISLANDS ','CAYMAN ISLANDS ','CAYMAN ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0080','ΚΑΜΕΡΟΥΝ','CAMEROON ','CAMEROON ','CAMEROON ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0081','ΚΑΜΠΟΤΖΗ','CAMBODIA ','CAMBODIA ','CAMBODIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0082','ΚΑΝΑΔΑΣ','CANADA ','CANADA ','CANADA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0083','ΚΑΝΑΡΙΟΙ ΝΗΣΟΙ','CANARY ISLANDS','CANARY ISLANDS','CANARY ISLANDS');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0084','ΚΑΤΑΡ','QATAR ','QATAR ','QATAR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0085','ΚΕΝΤΡΟΑΦΡΙΚΑΝΙΚΗ ΔΗΜΟΚΡΑΤΙΑ','CENTRAL AFRICAN REPUBLIC ','CENTRAL AFRICAN REPUBLIC ','CENTRAL AFRICAN REPUBLIC ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0086','ΚΕΝΥΑ','KENYA ','KENYA ','KENYA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0087','ΚΙΝΑ, ΛΑΪΚΗ ΔΗΜΟΚΡΑΤΙΑ ΤΗΣ','CHINA ','CHINA ','CHINA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0088','ΚΙΡΓΚΙΣΤΑΝ','KYRGYZSTAN ','KYRGYZSTAN ','KYRGYZSTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0089','ΚΙΡΙΜΠΑΤΙ','KIRIBATI ','KIRIBATI ','KIRIBATI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0090','ΚΟΛΟΜΒΙΑ','COLOMBIA ','COLOMBIA ','COLOMBIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0091','ΚΟΝΓΚΟ','CONGO ','CONGO ','CONGO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0092','ΚΟΣΡΑΪ','KOSRAE (FEDERATED STATES OF MICRONESIA)','KOSRAE (FEDERATED STATES OF MICRONESIA)','KOSRAE (FEDERATED STATES OF MICRONESIA)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0093','ΚΟΣΤΑ ΡΙΚΑ','COSTA RICA ','COSTA RICA ','COSTA RICA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0094','ΚΟΥΒΕΙΤ','KUWAIT ','KUWAIT ','KUWAIT ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0095','ΚΟΥΚ ΝΗΣΟΙ','COOK ISLANDS ','COOK ISLANDS ','COOK ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0096','ΚΟΥΡΑΚΑΟ (ΟΛΛΑΝΔΙΚΕΣ ΑΝΤΙΛΛΕΣ)','CURACAO (NETHERLANDS ANTILLES)','CURACAO (NETHERLANDS ANTILLES)','CURACAO (NETHERLANDS ANTILLES)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0097','ΚΡΟΑΤΙΑ ','CROATIA ','CROATIA ','CROATIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0098','ΚΥΠΡΟΣ','CYPRUS ','CYPRUS ','CYPRUS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0099','ΛΑΟΣ','LAO PEOPLE^27S DEMOCRATIC REPUBLIC ','LAO PEOPLE^27S DEMOCRATIC REPUBLIC ','LAO PEOPLE^27S DEMOCRATIC REPUBLIC ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0100','ΛΕΣΟΤΟ','LESOTHO ','LESOTHO ','LESOTHO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0101','ΛΕΤΟΝΙΑ','LATVIA ','LATVIA ','LATVIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0102','ΛΕΥΚΟΡΩΣΙΑ','BELARUS ','BELARUS ','BELARUS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0103','ΛΙΒΑΝΟΣ','LEBANON ','LEBANON ','LEBANON ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0104','ΛΙΒΕΡΙΑ','LIBERIA ','LIBERIA ','LIBERIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0105','ΛΙΘΟΥΑΝΙΑ','LITHUANIA ','LITHUANIA ','LITHUANIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0106','ΛΙΧΤΕΝΣΤΑΪΝ','LIECHTENSTEIN ','LIECHTENSTEIN ','LIECHTENSTEIN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0107','ΛΟΥΞΕΜΒΟΥΡΓΟ ΕΕ','LUXEMBOURG ','LUXEMBOURG ','LUXEMBOURG ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0109','ΜΑΔΑΓΑΣΚΑΡΗ','MADAGASCAR ','MADAGASCAR ','MADAGASCAR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0110','ΜΑΔΕΪΡΑ','MADERIA (PORTUGAL)','MADERIA (PORTUGAL)','MADERIA (PORTUGAL)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0111','ΜΑΚΑΟ','MACAU ','MACAU ','MACAU ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0112','ΜΑΛΑΙΣΙΑ','MALAYSIA ','MALAYSIA ','MALAYSIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0113','ΜΑΛΑΟΥΙ','MALAWI ','MALAWI ','MALAWI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0114','ΜΑΛΔΙΒΕΣ','MALDIVES ','MALDIVES ','MALDIVES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0115','ΜΑΛΙ','MALI ','MALI ','MALI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0116','ΜΑΛΤΑ','MALTA ','MALTA ','MALTA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0117','ΜΑΟΥΡΙΣΙΟΥΣ','MAURITIUS ','MAURITIUS ','MAURITIUS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0119','ΜΑΡΟΚΟ','MOROCCO ','MOROCCO ','MOROCCO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0120','ΜΑΡΣΑΛ, ΝΗΣΟΙ','MARSHALL ISLANDS ','MARSHALL ISLANDS ','MARSHALL ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0121','ΜΑΡΤΙΝΙΚΑ','MARTINIQUE ','MARTINIQUE ','MARTINIQUE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0122','ΜΑΥΡΙΤΑΝΙΑ','MAURITANIA ','MAURITANIA ','MAURITANIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0124','ΜΕΞΙΚΟ','MEXICO ','MEXICO ','MEXICO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0125','ΜΙΑΝΜΑΡ','MYANMAR ','MYANMAR ','MYANMAR ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0126','ΜΙΚΡΟΝΗΣΙΑ (ΟΜΟΣΠΟΝΔΙΑΚΑ ΚΡΑΤΗ)','MICRONESIA, FEDERATED STATES OF ','MICRONESIA, FEDERATED STATES OF ','MICRONESIA, FEDERATED STATES OF ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0127','ΜΟΓΓΟΛΙΑ','MONGOLIA ','MONGOLIA ','MONGOLIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0128','ΜΟΖΑΜΒΙΚΗ','MOZAMBIQUE ','MOZAMBIQUE ','MOZAMBIQUE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0129','ΜΟΛΔΑΒΙΑ','MOLDOVA, REPUBLIC OF ','MOLDOVA, REPUBLIC OF ','MOLDOVA, REPUBLIC OF ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0130','ΜΟΝΑΚΟ','MONACO ','MONACO ','MONACO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0131','ΜΟΝΤΣΕΡΑΤ','MONTSERRAT ','MONTSERRAT ','MONTSERRAT ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0132','ΜΠΑΝΓΚΛΑΝΤΕΣ','BANGLADESH ','BANGLADESH ','BANGLADESH ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0133','ΜΠΑΡΜΠΑΝΤΟΣ','BARBADOS ','BARBADOS ','BARBADOS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0134','ΜΠΑΡΜΠΟΥΝΤΑ (ΑΝΤΙΓΚΟΥΑ)','BARBUDA (ANTIGUA)','BARBUDA (ANTIGUA)','BARBUDA (ANTIGUA)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0135','ΜΠΑΧΑΜΕΣ','BAHAMAS ','BAHAMAS ','BAHAMAS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0136','ΜΠΑΧΡΕΙΝ','BAHRAIN ','BAHRAIN ','BAHRAIN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0137','ΜΠΕΛΙΖ','BELIZE ','BELIZE ','BELIZE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0138','ΜΠΕΝΙΝ','BENIN ','BENIN ','BENIN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0139','ΜΠΟΝΑΙΡ (ΟΛΛΑΝΔΙΚΕΣ ΑΝΤΙΛΛΕΣ)','BONAIRE (NETHERLANDS ANTILLES)','BONAIRE (NETHERLANDS ANTILLES)','BONAIRE (NETHERLANDS ANTILLES)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0140','ΜΠΟΤΣΟΥΑΝΑ','BOTSWANA ','BOTSWANA ','BOTSWANA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0141','ΜΠΟΥΡΚΙΝΑ ΦΑΣΟ','BURKINA FASO ','BURKINA FASO ','BURKINA FASO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0142','ΜΠΟΥΡΟΥΝΤΙ','BURUNDI ','BURUNDI ','BURUNDI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0143','ΜΠΡΟΥΝΕΙ','BRUNEI DARUSSALAM ','BRUNEI DARUSSALAM ','BRUNEI DARUSSALAM ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0144','ΝΑΜΙΜΠΙΑ','NAMIBIA ','NAMIBIA ','NAMIBIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0145','ΝΕΑ ΖΗΛΑΝΔΙΑ','NEW ZEALAND ','NEW ZEALAND ','NEW ZEALAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0146','ΝΕΑ ΚΑΛΗΔΟΝΙΑ','NEW CALEDONIA ','NEW CALEDONIA ','NEW CALEDONIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0147','ΝΕΒΙΣ (ΣΑΙΝ ΚΙΤΤΣ)','NEVIS (St. KITTS)','NEVIS (St. KITTS)','NEVIS (St. KITTS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0148','ΝΕΠΑΛ','NEPAL ','NEPAL ','NEPAL ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0149','ΝΙΓΗΡ','NIGER ','NIGER ','NIGER ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0150','ΝΙΓΗΡΙΑ','NIGERIA ','NIGERIA ','NIGERIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0151','ΝΙΚΑΡΑΓΟΥΑ','NICARAGUA ','NICARAGUA ','NICARAGUA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0152','ΝΟΡΒΗΓΙΑ','NORWAY ','NORWAY ','NORWAY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0153','ΝΟΤΙΟΣ ΑΦΡΙΚΗ','SOUTH AFRICA ','SOUTH AFRICA ','SOUTH AFRICA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0154','ΝΟΤΙΟΣ ΚΟΡΕΑ','SOUTH KOREA','SOUTH KOREA','SOUTH KOREA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0155','ΟΛΛΑΝΔΙΑ','NETHERLANDS ','NETHERLANDS ','NETHERLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0156','ΟΛΛΑΝΔΙΚΕΣ ΑΝΤΙΛΛΕΣ','NETHERLANDS ANTILLES ','NETHERLANDS ANTILLES ','NETHERLANDS ANTILLES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0157','ΟΜΑΝ','OMAN ','OMAN ','OMAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0158','ΟΝΔΟΥΡΑ','HONDURAS ','HONDURAS ','HONDURAS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0159','ΟΥΓΓΑΡΙΑ','HUNGARY ','HUNGARY ','HUNGARY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0160','ΟΥΓΚΑΝΤΑ','UGANDA ','UGANDA ','UGANDA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0161','ΟΥΖΜΠΕΚΙΣΤΑΝ','UZBEKISTAN ','UZBEKISTAN ','UZBEKISTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0162','ΟΥΚΡΑΝΙΑ','UKRAINE ','UKRAINE ','UKRAINE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0163','ΟΥΡΟΥΓΟΥΑΗ','URUGUAY ','URUGUAY ','URUGUAY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0164','ΠΑΚΙΣΤΑΝ','PAKISTAN ','PAKISTAN ','PAKISTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0165','ΠΑΛΑΟΥ','PALAU ','PALAU ','PALAU ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0166','ΠΑΝΑΜΑΣ','PANAMA ','PANAMA ','PANAMA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0167','ΠΑΠΟΥΑ ΝΕΑ ΓΟΥΙΝΕΑ','PAPUA NEW GUINEA ','PAPUA NEW GUINEA ','PAPUA NEW GUINEA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0168','ΠΑΡΑΓΟΥΑΗ','PARAGUAY ','PARAGUAY ','PARAGUAY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0169','ΠΑΡΘΕΝΟΙ ΝΗΣΟΙ ΗΠΑ','VIRGIN ISLANDS (U.S.) ','VIRGIN ISLANDS (U.S.) ','VIRGIN ISLANDS (U.S.) ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0170','ΠΕΡΟΥ','PERU ','PERU ','PERU ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0171','ΠΟΛΩΝΙΑ','POLAND ','POLAND ','POLAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0173','ΠΟΡΤΟΓΑΛΙΑ ΕΕ','PORTUGAL ','PORTUGAL ','PORTUGAL ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0174','ΠΟΥΕΡΤΟ ΡΙΚΟ','PUERTO RICO ','PUERTO RICO ','PUERTO RICO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0175','ΠΡΑΣΙΝΟ ΑΚΡΩΤΗΡΙΟ','CAPE VERDE ','CAPE VERDE ','CAPE VERDE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0176','ΠΡΩΗΝ ΓΙΟΥΓΚ. ΔΗΜ. FYROM','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF ','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF ','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0177','ΡΙΓΙΟΥΝΙΟΝ','REUNION ','REUNION ','REUNION ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0178','ΡΟΤΑ','ROTA (NOTHERN MARIANA ISLANDS)','ROTA (NOTHERN MARIANA ISLANDS)','ROTA (NOTHERN MARIANA ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0179','ΡΟΥΑΝΤΑ','RWANDA ','RWANDA ','RWANDA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0180','ΡΟΥΜΑΝΙΑ','ROMANIA ','ROMANIA ','ROMANIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0181','ΡΩΣΙΑ (ΜΟΣΧΑ, ΑΓΙΑ ΠΕΤΡΟΥΠΟΛΗ)','RUSSIA (ΜΟSCOW, ST. PETESBURG)','RUSSIA (ΜΟSCOW, ST. PETESBURG)','RUSSIA (ΜΟSCOW, ST. PETESBURG)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0182','ΡΩΣΙΑ (ΟΛΕΣ ΟΙ ΥΠΟΛΟΙΠΕΣ ΠΟΛΕΙΣ)','RUSSIA (REST OF)','RUSSIA (REST OF)','RUSSIA (REST OF)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0183','ΣΑΙΝ ΒΙΝΣΕΝΤ ΚΑΙ ΟΙ ΓΡΕΝΑΔΙΝΕΣ','SAINT VINCENT AND THE GRENADINES ','SAINT VINCENT AND THE GRENADINES ','SAINT VINCENT AND THE GRENADINES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0184','ΣΑΙΝ ΕΥΣΤΑΤΙΟΥΣ (ΟΛΛΑΝΔ. ΑΝΤΙΛΛΕΣ)','St. EUSTATIUS (NETHERLANDS ANTILLES)','St. EUSTATIUS (NETHERLANDS ANTILLES)','St. EUSTATIUS (NETHERLANDS ANTILLES)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0185','ΣΑΙΝ ΚΙΤΤΣ','SAINT KITTS AND NEVIS ','SAINT KITTS AND NEVIS ','SAINT KITTS AND NEVIS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0186','ΣΑΙΝ ΚΡΙΣΤΟΦΕΡ','St. CHRISTOPHER (St. KITTS AND NEVIS)','St. CHRISTOPHER (St. KITTS AND NEVIS)','St. CHRISTOPHER (St. KITTS AND NEVIS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0187','ΣΑΙΝ ΚΡΟΥΑ','St. CROIX (U.S. VIRGIN ISLANDS)','St. CROIX (U.S. VIRGIN ISLANDS)','St. CROIX (U.S. VIRGIN ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0188','ΣΑΙΝ ΜΑΑΡΤΕΝ','St. MAARTEN (NETHERLANDS ANTILLES)','St. MAARTEN (NETHERLANDS ANTILLES)','St. MAARTEN (NETHERLANDS ANTILLES)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0189','ΣΑΙΝ ΜΑΡΤΙΝ','St. MARTIN (GUADELOUPE)','St. MARTIN (GUADELOUPE)','St. MARTIN (GUADELOUPE)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0190','ΣΑΙΝ ΜΠΑΡΤΕΛΕΜΙ','St. BARTHELEMY (GUADELOUPE)','St. BARTHELEMY (GUADELOUPE)','St. BARTHELEMY (GUADELOUPE)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0191','ΣΑΙΝ ΤΖΟΝ','St. JOHN (U.S. VIRGIN ISLANDS)','St. JOHN (U.S. VIRGIN ISLANDS)','St. JOHN (U.S. VIRGIN ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0192','ΣΑΙΝ ΤΟΜΑΣ','St. THOMAS (U.S. VIRGIN ISLANDS)','St. THOMAS (U.S. VIRGIN ISLANDS)','St. THOMAS (U.S. VIRGIN ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0193','ΣΑΪΠΑΝ','SAIPAN (NORTHERN MARIANA ISLANDS)','SAIPAN (NORTHERN MARIANA ISLANDS)','SAIPAN (NORTHERN MARIANA ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0194','ΣΑΜΠΑ','SABA (NETHERLANDS ANTILLES)','SABA (NETHERLANDS ANTILLES)','SABA (NETHERLANDS ANTILLES)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0195','ΣΑΝ ΜΑΡΙΝΟ','SAN MARINO ','SAN MARINO ','SAN MARINO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0196','ΣΑΝΤΑ ΛΟΥΤΣΙΑ','St. LUCIA','St. LUCIA','St. LUCIA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0197','ΣΑΟΥΔΙΚΗ ΑΡΑΒΙΑ','SAUDI ARABIA ','SAUDI ARABIA ','SAUDI ARABIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0198','ΣΕΝΕΓΑΛΗ','SENEGAL ','SENEGAL ','SENEGAL ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0201','ΣΕΫΧΕΛΛΕΣ','SEYCHELLES ','SEYCHELLES ','SEYCHELLES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0202','ΣΙΓΚΑΠΟΥΡΗ','SINGAPORE ','SINGAPORE ','SINGAPORE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0203','ΣΙΕΡΡΑ ΛΕΟΝΕ','SIERRA LEONE ','SIERRA LEONE ','SIERRA LEONE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0204','ΣΛΟΒΑΚΙΑ, ΔΗΜΟΚΡΑΤΙΑ','SLOVAKIA (Slovak Republic) ','SLOVAKIA (Slovak Republic) ','SLOVAKIA (Slovak Republic) ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0205','ΣΛΟΒΕΝΙΑ','SLOVENIA ','SLOVENIA ','SLOVENIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0206','ΣΟΛΟΜΩΝΤΑ, ΝΗΣΟΙ','SOLOMON ISLANDS ','SOLOMON ISLANDS ','SOLOMON ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0207','ΣΟΥΑΖΙΛΑΝΔΗ','SWAZILAND','SWAZILAND','SWAZILAND');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0208','ΣΟΥΗΔΙΑ ΕΕ','SWEDEN ','SWEDEN ','SWEDEN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0209','ΣΟΥΡΙΝΑΜ','SURINAME ','SURINAME ','SURINAME ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0210','ΣΡΙ ΛΑΝΚΑ','SRI LANKA ','SRI LANKA ','SRI LANKA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0211','ΣΥΡΙΑ','SYRIAN ARAB REPUBLIC ','SYRIAN ARAB REPUBLIC ','SYRIAN ARAB REPUBLIC ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0212','ΤΑΪΒΑΝ','TAIWAN, PROVINCE OF CHINA ','TAIWAN, PROVINCE OF CHINA ','TAIWAN, PROVINCE OF CHINA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0213','ΤΑΪΛΑΝΔΗ','THAILAND ','THAILAND ','THAILAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0214','ΤΑΪΤΗ','TAHITI (FRENCH POLYNESIA)','TAHITI (FRENCH POLYNESIA)','TAHITI (FRENCH POLYNESIA)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0215','ΤΑΝΖΑΝΙΑ','TANZANIA, UNITED REPUBLIC OF ','TANZANIA, UNITED REPUBLIC OF ','TANZANIA, UNITED REPUBLIC OF ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0216','ΤΑΤΖΙΚΙΣΤΑΝ','TAJIKISTAN ','TAJIKISTAN ','TAJIKISTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0217','ΤΕΡΚΣ & ΚΑΥΚΟΣ, ΝΗΣΟΙ','TURKS AND CAICOS ISLANDS ','TURKS AND CAICOS ISLANDS ','TURKS AND CAICOS ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0218','ΤΖΑΜΑΪΚΑ','JAMAICA ','JAMAICA ','JAMAICA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0219','ΤΖΙΜΠΟΥΤΙ','DJIBOUTI ','DJIBOUTI ','DJIBOUTI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0220','ΤΙΝΙΑΝ','TINIAN (NORTHERN MARIANA ISLANDS)','TINIAN (NORTHERN MARIANA ISLANDS)','TINIAN (NORTHERN MARIANA ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0221','ΤΟΓΚΑ','TONGA ','TONGA ','TONGA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0222','ΤΟΓΚΟ','TOGO ','TOGO ','TOGO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0223','ΤΟΡΤΟΛΑ','TORTOLA (BRITISH VIRGIN ISLANDS)','TORTOLA (BRITISH VIRGIN ISLANDS)','TORTOLA (BRITISH VIRGIN ISLANDS)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0224','ΤΟΥΒΑΛΟΥ','TUVALU ','TUVALU ','TUVALU ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0225','ΤΟΥΡΚΙΑ','TURKEY ','TURKEY ','TURKEY ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0226','ΤΟΥΡΚΜΕΝΙΣΤΑΝ','TURKMENISTAN ','TURKMENISTAN ','TURKMENISTAN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0227','ΤΡΙΝΙΝΤΑΤ & ΤΟΜΠΑΓΚΟ','TRINIDAD AND TOBAGO ','TRINIDAD AND TOBAGO ','TRINIDAD AND TOBAGO ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0228','ΤΡΟΥΚ','TRUK (FEDERATED STATES OF MICRONESIA)','TRUK (FEDERATED STATES OF MICRONESIA)','TRUK (FEDERATED STATES OF MICRONESIA)');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0229','ΤΣΑΝΤ','CHAD ','CHAD ','CHAD ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0230','ΤΣΕΧΙΑΣ, ΔΗΜΟΚΡΑΤΙΑΣ ΤΗΣ','CZECH REPUBLIC ','CZECH REPUBLIC ','CZECH REPUBLIC ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0231','ΤΥΝΗΣΙΑ','TUNISIA ','TUNISIA ','TUNISIA ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0232','ΥΕΜΕΝΗ,ΔΗΜΟΚΡΑΤΙΑ ΤΗΣ','YEMEN ','YEMEN ','YEMEN ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0233','ΦΑΕΡΟΝΕ, ΝΗΣΟΙ','FAROE ISLANDS ','FAROE ISLANDS ','FAROE ISLANDS ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0234','ΦΙΛΙΠΠΙΝΕΣ','PHILIPPINES ','PHILIPPINES ','PHILIPPINES ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0235','ΦΙΝΛΑΝΔΙΑ ΕΕ','FINLAND ','FINLAND ','FINLAND ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0236','ΦΙΤΖΙ','FIJI ','FIJI ','FIJI ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0237','ΧΙΛΗ','CHILE ','CHILE ','CHILE ');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0238','ΧΟΝΓΚ ΚΟΝΓΚ','HONG KONG','HONG KONG','HONG KONG');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0400','ΣΕΡΒΙΑ','SERBIA','SERBIA','SERBIA');
insert into country (countryCode,countryName,countryNameLG,countryNameLG1,countryNameLG2) VALUES ('0401','ΜΟΝΤΕΝΕΓΚΡΟ','MONTENEGRO','MONTENEGRO','MONTENEGRO');

insert into Configuration (CO_Code, CO_GroupID, CO_Title, CO_Key, CO_Value, CO_SortOrder, CO_Visible, CO_Editable) VALUES ('001',0,'Διακομιστής εξερχόμενης αλληλογραφίας (smtp server)','smtpServer','smtp.softways.gr',1,1,1);
insert into Configuration (CO_Code, CO_GroupID, CO_Title, CO_Key, CO_Value, CO_SortOrder, CO_Visible, CO_Editable) VALUES ('005',0,'Email παραλήπτη επικοινωνίας','contactEmailTo','antigoni@softways.gr',5,1,1);
insert into Configuration (CO_Code, CO_GroupID, CO_Title, CO_Key, CO_Value, CO_SortOrder, CO_Visible, CO_Editable) VALUES ('015',0,'Web site config','website_config','',0,0,0);

insert into VAT values ('001','Κανονικός',0.24);
insert into VAT values ('002','Μειωμένος',0.13);
insert into VAT values ('003','Υπερμειωμένος',0.065);
insert into VAT values ('004','Μηδενικός',0.00);

insert into securityObjects values (1,'securityObjects','Security Objects (tables,views, etc.)',0);
insert into securityObjects values (2,'securityPolicy','Security Policy for security objects',0);
insert into securityObjects values (3,'userGroups','User Groups',0);
insert into securityObjects values (4,'adminUsers','Users responsible for store administration',0);
insert into securityObjects values (5,'poolManagerACL','Application ACL Restart',0);
insert into securityObjects values (6,'poolManagerConn','Application Connections Restart',0);
insert into securityObjects values (7,'fileTemplate','',0);
insert into securityObjects values (8,'fileTemplateFormat','',0);
insert into securityObjects values (9,'users','',0);
insert into securityObjects values (10,'uploadFiles','',0);
insert into securityObjects values (250,'prdCategory','',0);
insert into securityObjects values (251,'product','',0);
insert into securityObjects values (252,'prdInCatTab','',0);
insert into securityObjects values (253,'manufact','',0);
insert into securityObjects values (254,'supplier','',0);
insert into securityObjects values (255,'shippingCat','',0);
insert into securityObjects values (256,'prdMonthly','',0);
insert into securityObjects values (257,'customer','',0);
insert into securityObjects values (258,'orders','',0);
insert into securityObjects values (259,'prdImports','',0);
insert into securityObjects values (260,'shipBillInfo','',0);
insert into securityObjects values (261,'transactions','',0);
insert into securityObjects values (262,'attribute','',0);
insert into securityObjects values (263,'slaveAttribute','',0);
insert into securityObjects values (264,'attributeValue','',0);
insert into securityObjects values (265,'productMasterAttribute','',0);
insert into securityObjects values (266,'productMasterAttributeValue','',0);
insert into securityObjects values (267,'PMASV','',0);
insert into securityObjects values (268,'transAttribute','',0);
insert into securityObjects values (320,'CMCategory', 'CMCategory', 0);
insert into securityObjects values (321,'CMRow', 'CMRow', 0);
insert into securityObjects values (322,'CMCRelCMR', 'CMCRelCMR', 0);
insert into securityObjects values (323,'CMRRelCMR', 'CMRRelCMR', 0);
insert into securityObjects values (450,'ShipCostRange','',0);
insert into securityObjects values (451,'ShipCostMethod','',0);
insert into securityObjects values (452,'ShipCostEntry','',0);
insert into securityObjects values (710,'Member','',0);
insert into securityObjects values (780,'CustomerInformation','',0);
insert into securityObjects values (920,'emailListTab','',0);
insert into securityObjects values (921,'emailListMember','',0);
insert into securityObjects values (922,'emailListReg','',0);
insert into securityObjects values (923,'emailListSendEmail','',0);
insert into securityObjects values (926,'Configuration','',0);
insert into securityObjects values (940,'Newsletter','',0);
insert into securityObjects values (931,'VAT','',0);
insert into securityObjects values (1200,'country','',0);

insert into userGroups values (1,'Administrators','Policy administration','','','','','','','0','1');
insert into userGroups values (2,'GUESTS','GUESTS','','','','','','','0','0');
insert into userGroups values (3,'MEMBERS','MEMBERS','','','','','','','1','0');

insert into securityPolicy values (1,'securityObjects',15);
insert into securityPolicy values (1,'securityPolicy',15);
insert into securityPolicy values (1,'userGroups',15);
insert into securityPolicy values (1,'adminUsers',15);
insert into securityPolicy values (1,'poolManagerACL',15);
insert into securityPolicy values (1,'poolManagerConn',15);
insert into securityPolicy values (1,'fileTemplate',15);
insert into securityPolicy values (1,'fileTemplateFormat',15);
insert into securityPolicy values (1,'users',15);
insert into securityPolicy values (1,'uploadFiles',15);
insert into securityPolicy values (1,'prdCategory',15);
insert into securityPolicy values (1,'product',15);
insert into securityPolicy values (1,'prdInCatTab',15);
insert into securityPolicy values (1,'manufact',15);
insert into securityPolicy values (1,'supplier',15);
insert into securityPolicy values (1,'shippingCat',15);
insert into securityPolicy values (1,'prdMonthly',15);
insert into securityPolicy values (1,'transactions',15);
insert into securityPolicy values (1,'customer',15);
insert into securityPolicy values (1,'orders',15);
insert into securityPolicy values (1,'shipBillInfo',15);
insert into securityPolicy values (1,'prdImports',15);
insert into securityPolicy values (1,'attribute',15);
insert into securityPolicy values (1,'slaveAttribute',15);
insert into securityPolicy values (1,'attributeValue',15);
insert into securityPolicy values (1,'productMasterAttribute',15);
insert into securityPolicy values (1,'productMasterAttributeValue',15);
insert into securityPolicy values (1,'PMASV',15);
insert into securityPolicy values (1,'transAttribute',15);
insert into securityPolicy values (1,'ShipCostRange',15);
insert into securityPolicy values (1,'ShipCostMethod',15);
insert into securityPolicy values (1,'ShipCostEntry',15);
insert into securityPolicy values (1,'country',15);
insert into securityPolicy values (1,'CustomerInformation',15);
insert into securityPolicy values (1,'emailListTab',15);
insert into securityPolicy values (1,'emailListMember',15);
insert into securityPolicy values (1,'emailListReg',15);
insert into securityPolicy values (1,'emailListSendEmail',15);
insert into securityPolicy values (1,'VAT',15);
insert into securityPolicy values (1,'Newsletter',15);
insert into securityPolicy values (1,'CMCategory', 15);
insert into securityPolicy values (1,'CMRow', 15);
insert into securityPolicy values (1,'CMCRelCMR', 15);
insert into securityPolicy values (1,'CMRRelCMR', 15);
insert into securityPolicy values (1,'Configuration',15);
insert into securityPolicy values (1,'Member',15);
insert into securityPolicy values (2,'prdCategory',1);
insert into securityPolicy values (2,'product',1);
insert into securityPolicy values (2,'prdInCatTab',1);
insert into securityPolicy values (2,'manufact',1);
insert into securityPolicy values (2,'supplier',1);
insert into securityPolicy values (2,'shippingCat',1);
insert into securityPolicy values (2,'prdMonthly',1);
insert into securityPolicy values (2,'transactions',15);
insert into securityPolicy values (2,'customer',7);
insert into securityPolicy values (2,'orders',1);
insert into securityPolicy values (2,'shipBillInfo',1);
insert into securityPolicy values (2,'attribute',1);
insert into securityPolicy values (2,'slaveAttribute',1);
insert into securityPolicy values (2,'attributeValue',1);
insert into securityPolicy values (2,'productMasterAttribute',1);
insert into securityPolicy values (2,'productMasterAttributeValue',1);
insert into securityPolicy values (2,'PMASV',1);
insert into securityPolicy values (2,'transAttribute',1);
insert into securityPolicy values (2,'ShipCostRange',1);
insert into securityPolicy values (2,'ShipCostMethod',1);
insert into securityPolicy values (2,'ShipCostEntry',1);
insert into securityPolicy values (2,'country',1);
insert into securityPolicy values (2,'CustomerInformation',1);
insert into securityPolicy values (2,'emailListTab',1);
insert into securityPolicy values (2,'emailListMember',1);
insert into securityPolicy values (2,'emailListReg',1);
insert into securityPolicy values (2,'CMCategory', 1);
insert into securityPolicy values (2,'CMRow', 1);
insert into securityPolicy values (2,'CMCRelCMR', 1);
insert into securityPolicy values (2,'CMRRelCMR', 1);
insert into securityPolicy values (2,'Newsletter',1);
insert into securityPolicy values (2,'VAT',1);
insert into securityPolicy values (2,'Configuration',1);
insert into securityPolicy values (2,'Member',1);
insert into securityPolicy values (3,'prdCategory',1);
insert into securityPolicy values (3,'product',1);
insert into securityPolicy values (3,'prdInCatTab',1);
insert into securityPolicy values (3,'manufact',1);
insert into securityPolicy values (3,'supplier',1);
insert into securityPolicy values (3,'shippingCat',1);
insert into securityPolicy values (3,'prdMonthly',1);
insert into securityPolicy values (3,'transactions',15);
insert into securityPolicy values (3,'customer',7);
insert into securityPolicy values (3,'orders',1);
insert into securityPolicy values (3,'shipBillInfo',1);
insert into securityPolicy values (3,'attribute',1);
insert into securityPolicy values (3,'slaveAttribute',1);
insert into securityPolicy values (3,'attributeValue',1);
insert into securityPolicy values (3,'productMasterAttribute',1);
insert into securityPolicy values (3,'productMasterAttributeValue',1);
insert into securityPolicy values (3,'PMASV',1);
insert into securityPolicy values (3,'transAttribute',1);
insert into securityPolicy values (3,'ShipCostRange',1);
insert into securityPolicy values (3,'ShipCostMethod',1);
insert into securityPolicy values (3,'ShipCostEntry',1);
insert into securityPolicy values (3,'country',1);
insert into securityPolicy values (3,'CustomerInformation',1);
insert into securityPolicy values (3,'CMCategory', 1);
insert into securityPolicy values (3,'CMRow', 1);
insert into securityPolicy values (3,'CMCRelCMR', 1);
insert into securityPolicy values (3,'CMRRelCMR', 1);
insert into securityPolicy values (3,'Configuration',1);
insert into securityPolicy values (3,'Member',1);
insert into securityPolicy values (3,'Newsletter',1);
insert into securityPolicy values (3,'VAT',1);

insert into users values ('0001','admin','admin',1,'0.0.0.0',null);
insert into adminUsers values ('0001','Administrator','ADMINISTRATOR','Administrator','ADMINISTRATOR','0001');

insert into users (logCode,usrName,usrPasswd,usrAccessLevel,lastIpUsed,dateLastUsed) values ('0002','anonymous','softways',2,'0.0.0.0',null);
insert into adminUsers (ausrCode,ausrFirstname,ausrFirstnameUp,ausrLastname,ausrLastnameUp,ausrLogCode) values ('0002','Anonymous','ANONYMOUS','Anonymous','ANONYMOUS','0002');

/** new Authors user group **/
insert into userGroups values (8,'Authors','Support group','','','','','','','0','1');

insert into securityPolicy values (8,'poolManagerACL',15);
insert into securityPolicy values (8,'poolManagerConn',15);
insert into securityPolicy values (8,'fileTemplate',15);
insert into securityPolicy values (8,'fileTemplateFormat',15);
insert into securityPolicy values (8,'uploadFiles',15);
insert into securityPolicy values (8,'prdCategory',15);
insert into securityPolicy values (8,'product',15);
insert into securityPolicy values (8,'prdInCatTab',15);
insert into securityPolicy values (8,'manufact',15);
insert into securityPolicy values (8,'supplier',15);
insert into securityPolicy values (8,'shippingCat',15);
insert into securityPolicy values (8,'prdMonthly',15);
insert into securityPolicy values (8,'transactions',15);
insert into securityPolicy values (8,'customer',15);
insert into securityPolicy values (8,'orders',15);
insert into securityPolicy values (8,'shipBillInfo',15);
insert into securityPolicy values (8,'prdImports',15);
insert into securityPolicy values (8,'attribute',15);
insert into securityPolicy values (8,'slaveAttribute',15);
insert into securityPolicy values (8,'attributeValue',15);
insert into securityPolicy values (8,'productMasterAttribute',15);
insert into securityPolicy values (8,'productMasterAttributeValue',15);
insert into securityPolicy values (8,'PMASV',15);
insert into securityPolicy values (8,'transAttribute',15);
insert into securityPolicy values (8,'ShipCostRange',15);
insert into securityPolicy values (8,'ShipCostMethod',15);
insert into securityPolicy values (8,'ShipCostEntry',15);
insert into securityPolicy values (8,'country',15);
insert into securityPolicy values (8,'CustomerInformation',15);
insert into securityPolicy values (8,'emailListTab',15);
insert into securityPolicy values (8,'emailListMember',15);
insert into securityPolicy values (8,'emailListReg',15);
insert into securityPolicy values (8,'emailListSendEmail',15);
insert into securityPolicy values (8,'VAT',15);
insert into securityPolicy values (8,'Newsletter',15);
insert into securityPolicy values (8,'CMCategory', 15);
insert into securityPolicy values (8,'CMRow', 15);
insert into securityPolicy values (8,'CMCRelCMR', 15);
insert into securityPolicy values (8,'CMRRelCMR', 15);
insert into securityPolicy values (8,'Configuration',15);
insert into securityPolicy values (8,'Member',15);

insert into users values ('0044','support','4097$i',8,'0.0.0.0','2013-01-01 00:00:00');
insert into adminUsers values ('0044','Support','SUPPORT','Support','SUPPORT','0044');
/** /new Authors user group **/

insert into securityObjects values (929,'EPayment','',0);
insert into securityPolicy values (1,'EPayment',15);
insert into securityPolicy values (2,'EPayment',1);
insert into securityPolicy values (3,'EPayment',1);
insert into securityPolicy values (8,'EPayment',15);

exit;

/**
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1001',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1002',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1003',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1004',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1005',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1006',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1007',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1008',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1009',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1010',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1011',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1012',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1013',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1014',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1015',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1016',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRODUCT (PRDID,PRDENTRYDATE,PRDID2,NAME,NAMEUP,NAMELG,NAMEUPLG,NAMELG1,NAMEUPLG1,NAMELG2,NAMEUPLG2,NAMELG3,NAMEUPLG3,DESCR,DESCRLG,DESCRLG1,DESCRLG2,DESCRLG3,SUPPLIERID,VATPCT,MUNIT,MUNITUP,MUNITLG,MUNITUPLG,MUNITLG1,MUNITUPLG1,MUNITLG2,MUNITUPLG2,MUNITLG3,MUNITUPLG3,WHOLESALEPRC,WHOLESALEPRCEU,WHOLESALEPRCCUR1,WHOLESALEPRCCUR2,RETAILPRC,RETAILPRCEU,RETAILPRCCUR1,RETAILPRCCUR2,SLWHOLESALEPRC,SLWHOLESALEPRCEU,SLWHOLESALEPRCCUR1,SLWHOLESALEPRCCUR2,SLRETAILPRC,SLRETAILPRCEU,SLRETAILPRCCUR1,SLRETAILPRCCUR2,HDWHOLESALEPRC,HDWHOLESALEPRCEU,HDWHOLESALEPRCCUR1,HDWHOLESALEPRCCUR2,HDRETAILPRC,HDRETAILPRCEU,HDRETAILPRCCUR1,HDRETAILPRCCUR2,GIFTPRC,GIFTPRCEU,GIFTPRCCUR1,GIFTPRCCUR2,WEIGHT,CUBEMETER,MINORDERQUA,MAXORDERQUA,STOCKQUA,SAFETYSTOCKQUA,PACKAGE,PACKAGELG,PACKAGELG1,PACKAGELG2,PACKAGELG3,IMG,IMG2,IMG3,IMG4,BARCODE,DELIVERYDAYS,CATID,HDSTOCKFLAG,HDSTOCKFLAGW,HOTDEALFLAG,HOTDEALFLAGW,SALESFLAG,SALESFLAGW,HDBEGINDATE,HDENDDATE,HDBEGINDATEW,HDENDDATEW,SHIPPINGKINDZONE,SHIPPINGVALUE,SHIPPINGVALUEEU,SHIPPINGVALUECUR1,SHIPPINGVALUECUR2,SHIPPINGVATPCT,INQUA,OUTQUA,INVAL,INVALEU,INVALCUR1,INVALCUR2,OUTVAL,OUTVALEU,OUTVALCUR1,OUTVALCUR2,PRDLOCK,PRDMANUFACTID,PRDHIDEFLAG,PRDHIDEFLAGW,PRDNEWCOLL,PRDHOMEPAGELINK,PRDCOMPFLAG,PRDHASATTRIBUTES,PRDSTOPSALESGLOBAL,PRDSTARTSALES,PRD_SCCODE,PRDIMAGECAPTION,PRDIMAGECAPTIONLG,PRDIMAGECAPTIONLG1,PRDIMAGECAPTIONLG2,PRDIMAGECAPTIONLG3,SPECS,SPECSLG,SPECSLG1,SPECSLG2,SPECSLG3,PRDAVAILABILITY,TEXT1TITLE,TEXT1,TEXT1TITLELG,TEXT1LG,TEXT2TITLE,TEXT2,TEXT2TITLELG,TEXT2LG,TEXT3TITLE,TEXT3,TEXT3TITLELG,TEXT3LG,TEXT4TITLE,TEXT4,TEXT4TITLELG,TEXT4LG,TEXT5TITLE,TEXT5,TEXT5TITLELG,TEXT5LG,PRD_VAT_ID,PRD_GIFTWRAPAVAIL) VALUES ('1017',null,'                         ','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','Helly Hansen Cozy up with this classic fleece pullover and stay','HELLY HANSEN COZY UP WITH THIS CLASSIC FLEECE PULLOVER AND STAY','','','','','','','<p>40 λεπτα απόλυτης χαλάρωσης με τους εξειδικευμένους  "μασέρ", που απορροφούν τις μυϊκές εντάσεις και βελτιώνουν το   μικροκυκλοφορικό σύστημα , ενώ βοηθούν στην αποβολή του άγχους και του στρες, και σας κάνει  να νιώθετε υπέροχα, ενώ απολαμβάνετε συγχρόνως την παρέα του συντρόφου σας. Συνεχίστε τις στιγμές χαλάρωσης, κολυμπώντας στα ζεστά νερά της πισίνας.Αφεθείτε στην ζεστασιά της θερμαινόμενης sais long και αποτοξινώστε τον οργανισμό σας στο χαμάμ και την σάουνα.</p>\n<p><b>επιλογές</b></p>\n<ul>\n<li>πρώτη επιλογή</li>\n<li>δεύερη επιλογή</li>\n<li>τρίτη επιλογή</li>\n<li>τέταρτη επιλογή</li>\n<li>#5</li>\n</ul>','','','','',null,0.000,'                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ','                                        ',0.00,0.0000,0.0000,0.0000,0.00,1.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.00,2.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,0.000,0.000,0.000,0.000,0.000,0.000,'','','','','','','','','','                         ',0,'                         ','0','0','0','0','0','0',null,{ts '2003-02-02 00:00:00.'},null,null,'          ',0.00,0.0000,0.0000,0.0000,0.00,0.000,0.000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.0000,0.0000,'0',null,'0','0','0','','0','0','0','0',null,'','','','','','','','','','',' ','Χαρακτηριστικά','<table border="0" cellpadding="4">\n<tbody>\n<tr>\n<td><b>Διάρκεια εμπειρίας</b></td>\n<td>Η εμπειρία διαρκεί 40 λεπτά για το μασάζ, τα οποία είναι αρκετά για να σας ανακουφίσουν  και να σας χαλαρώσουν και τρεις ώρες χρήση των χώρων του spa.</td>\n</tr>\n<tr>\n<td><b>Όριο ηλικίας</b></td>\n<td>Οι υπηρεσίες των Spa απεύθυνονται σε άτομα άνω των 18 ετών.</td>\n</tr>\n<tr>\n<td><b>Αριθμός ατόμων</b></td>\n<td>2</td>\n</tr>\n<tr>\n<td><b>Τοποθεσία</b></td>\n<td>Ειδικά διαμορφωμένος χώρος spa, σε ξενοδοχείο, στο κέντρο της Θεσσαλονίκης λίγα βήματα από την πλατεία Αριστοτέλους.</td>\n</tr>\n<tr>\n<td><b>Διαθεσιμότητα</b></td>\n<td>Το spa λειτουργεί καθημερινά και σε αργίες και σε γιορτές, από τις 12:00μμ έως τις 22:00μμ.</td>\n</tr>\n<tr>\n<td><b>Τι διατίθεται</b></td>\n<td>Όποια από τις υπηρεσίες και αν επιλέξετε, σας παρέχουν τα spa, ρόμπες, πετσέτες και παντόφλες.</td>\n</tr>\n<tr>\n<td style="width: 130px;" valign="top"><b>Συνοδοί</b></td>\n<td>Στην περίπτωση που κάποιος σας συνοδεύσει στην εμπειρία σας, θα μπορέσει ν΄απολαύσει έναν καφέ στο bar του ξενοδοχείου.</td>\n</tr>\n</tbody>\n</table>','','','Διαδικασία','<p>Επιλέξτε την ημέρα που προτιμάτε, να ζήσετε την εμπειρία σας, και επικοινωνήστε με το spa  τρεις (3) μέρες νωρίτερα. Προσέλθετε ένα τέταρτο (15^27) πιο νωρίς από το ραντεβού σας για την υποδοχή και το ντουζ πριν την έναρξη της εμπειρίας σας.</p>\n<p>λεπτομέρειες:</p>\n<ul>\n<li>λεπτομέρεια #1</li>\n<li>λεπτομέρεια #2</li>\n<li>#3</li>\n</ul>\n<p> </p>\n<p> </p>','','','Επικοινωνία','<p>Μπορείτε να επικοινωνήσετε μαζί μας:</p>\n<p><br />1) Οποιαδήποτε ώρα και μέρα της εβδομάδας μέσω του e-mail <a href="mailto:info@thessdoro.gr">info@thessdoro.gr</a></p>\n<p><br />2) Τηλεφωνικά στο 2310-233413, Δευτέρα με Παρασκευή 10:00 με 16:00</p>\n<p><br />Μπορείτε ακόμη να μας βρείτε στα γραφεία μας  στη διεύθυνση:<br />Thessδώρο<br />Μητροπόλεως 46-48<br />ΤΚ 54623, Θεσσαλονίκη</p>','','<p>yyyy</p>','VIDEO','<p>3 μήνες από την αγορά του</p>\n<p><iframe width="425" height="350" src="http://www.youtube.com/embed/Gng3sPiJdzA" frameborder="0"></iframe></p>','','','','','','','001                      ',' ');
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('1','1001','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('2','1002','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('3','1003','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('4','1004','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('5','1005','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('6','1006','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('7','1007','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('8','1008','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('9','1009','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('10','1010','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('11','1011','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('12','1012','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('13','1013','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('14','1014','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('15','1015','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('16','1016','01','1',null);
INSERT INTO PRDINCATTAB (PINCCODE,PINCPRDID,PINCCATID,PINCPRIMARY,PINCRANK) VALUES ('17','1017','01','1',null);
**/
