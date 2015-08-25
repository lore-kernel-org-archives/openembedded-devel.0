Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id C785876CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:47 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:46 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:49 +0300
Message-ID: <134584b24a8f2e9f8f734a2e2dbed70b73457563.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:1Md8Rj9OIixdcBhLsCHFqn72V8g0IMKhZobKz+XcJB6tdpi4DcBHwoyJHpoNg9Coh0A67OLYEQgp2q7ZKT+KEnL19SKW+aC4/M4vVmftX6CcTQydHQ18W1iqha5M9ME2coTrACPn+9o7glKdfEb42GVO9UOUBHlFmBdtuGNN58s=;
	3:o9YGv2vE58J+PSCZKlo/3gpKmWDvKhSZuUMqpbj4xRxXnIhe22xPu6SNybCta9gLGk+wzNoPImGk7X0joAYzya8g51WTIry3oVuOF8ERMmbm6UFHml/jlngFfd4mCMbK4c2ezBl8x8jJgBygTeUvrg==;
	25:etzpasuSVZhlPExy//aY6VS58lVSl9r4o8qWEj1yoz8WpbbYvFIjUl6o3/FktkrYNPURuqqROHeAaZtAnpln5y1rDCbtPMWy+6bbrdBmTWahccu6jQ/fI8A6i9PIBWSFaEoryBVIMMmQYAFWiinWW7DPf0XFJmpSZvuNSUocpFis8lY/4x7D8H8Sf/QRNJsnTlseQu/qxmhl/9v2fV8UJQUJEciB/CLmerPP2dEvERxyVZQ7Kc5z+oW1fszKGeUJE+T4SCwEvU0e+ZMxy99sGg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:X7Xc6yn+pIK6n0IlfNS3cJRqHCLErujUIl2jC2dvQK160Dk9bJ4UuZD0TSCyNDwQo8buittoamGYeoy6WxU+soqbHNQTuCn0tt6ZwiXFJsHc3THn7pP4H1gZ68jLXOfZZ6CwiGd3IPeA9jTFjeXoLdRdNrWXOXssPGRzPUO/uVequous7SgieVqyuv/8A5i6+3mvCDGxNq2I7UP/3WvYhHiuvo4YyQ1Z5WyqhAcpn2Ud/dLpnmzV5X1/hLLf+eGpjYnU3rcmw9TEcmYHQiBURuo2rfqckeEqYHnSWkoi9Oro5brSv1SsovDiq5JKFVT1bEbmWIzR+K/JLcXxBNQboyaVK/ci7W44FESgF3M6zHSnb+AfKLAM0osRJgyA5ekxLtY+Wq4FhMcHAsylb8nSNCgNMWlI1CMY8gu49GQbnqE3ef6h0pjZiW+8K9uqOVTjt8dynYsJjOvu68XITjPRfQm7ue1YVUTvwhmBGT1bUPbNaANm+wKpQH6Pb6mTaDWs;
	4:AmB824jLo5LzlN+kb/Zw6ClQB5pW+/XzaA51PWx9k5/uebCJ0kNwzAlGft7HqMRtfMOPys2/m8YeEP8T1LcvfqwusEatgN04v6du3NzVwOyibttwSGQ1PftL1JXoeuWEE/Ik7qI1ZUeM4wfYlKuURF4rsRRBemBAlD+hVg+7v1hXmZNeokOSrafIY41cAbr8nU2OBHF52y5Hv/I868ljjhhn/frje0FXg/cmZvosMu78Ev5wXs2oaUgNfJy8H4HC6en/dqJbWwjDv8H3K2kmURzxFSIzXLGSiBotQ4J813FX80wZzS6HU0g+P9rE0KUY
X-Microsoft-Antispam-PRVS: <AM3PR02MB117261FA757D7291C865ED7E90610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(575784001)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:5KeTmVa/olox3dW5c16GhfJAtPBLO9WpqxmZqNoM4?=
	=?us-ascii?Q?e89Y6NHcGwD6c1bBcfaA59R6fR0Tt8r8wUdnZg20cibIvKOR2S8FlQgkYRl6?=
	=?us-ascii?Q?zHOp7qEc8MDemNsSNxr46pTn3xdFwW9Z9rRMz+kEKIoTXrciuVGE5/gK5Sgb?=
	=?us-ascii?Q?18yXinzR1RKwR4CRNhNEkTiBN4Fd0uH6tyFEwLTaSptXqKtT71Rjz2wDyzsB?=
	=?us-ascii?Q?+Abl/xXxVLQFO+H+ymOkFIMEvMd670dMkw8eVGHqz4CsFlQZl7Crk7yaiN4h?=
	=?us-ascii?Q?9LD6zCjlLuQZLU5WWI9HGC1Bg6UBzZvEfMP2LI5CzErspu1NCcyiCnxRX5s+?=
	=?us-ascii?Q?0eVaYKsOpLtApG5eOZK5hc1buk6CenlbpwTN1+gbfClQTbVTX1Ihp2MOW567?=
	=?us-ascii?Q?OQ0Ee/F2bMr+MeiulEGnsM4fpO0j0j8Fobac5kL6MjMF8vKJ0w71I4gzSWY3?=
	=?us-ascii?Q?F50t4FW1vRRZEjiDAZpagxcpHnqKGZS6TVvbBb58GYypGQO21lerT58COPn6?=
	=?us-ascii?Q?22RzwftbnEU2iqZpsV8eVXwsfAtAc6qwWAyq0Yinw9FXkZeMw7dyivTiqeNs?=
	=?us-ascii?Q?4hPXIau39kuo96l6s3F0IepFfik/C52QytGMW3v6SqRGMhcFRPwWSB1g70Cf?=
	=?us-ascii?Q?ovG9ohuzp41oyqVx8D9bsmn36kxi4IYaesUdEAabYDJvWfPQkfh7MuBb+Vyn?=
	=?us-ascii?Q?8WKTv1TU9tDJboWIA90xhVSuJ3pH1H9TUFNYZAh9qi/tAcMAKGJrRbXuD0S1?=
	=?us-ascii?Q?rvCbyPHdvWPrETNIAVJX5ANKJYP+G8Rkztp1UD3hUTD18tul4t66wTZtfsKL?=
	=?us-ascii?Q?I779egp0DX4aKoqg4Dwua0uZCdVcbBAq3Ek5mJXLGVJgjqa78AOY2RhmPmW1?=
	=?us-ascii?Q?EPWPoYF1SURs+KBLUUYsssXzKmKZGQS3rw2dMnfPYVxHNCmBft92m17zi5O2?=
	=?us-ascii?Q?kBLjdChlMzbNl0EVmVkrbCz4l+zIJr/4kzir+CzXya7UIZlOTgKF+VAMrpJu?=
	=?us-ascii?Q?Cy3TyQ6UNMvXqkatNapL7E5rc023omXdWCQ5INbfZxg3DcNHZ5pYnohabzdK?=
	=?us-ascii?Q?PopuZKejcYpTgPUFW+I7J3Uu1OOY413VJVh8CvNmFy2dLpAzpXZC09fAd51c?=
	=?us-ascii?Q?dw/rSCD/xtgzXbSzcOFXv+XafQfUQJavezC+dC8T1tp5k1ituofG4LWimkDP?=
	=?us-ascii?Q?KOXju/wLf+lhXayHM4Iu371HJm8wa0zhs/WJVESNPETNmrRBfnv4uuD3l//j?=
	=?us-ascii?Q?KaZ3jiEgq1I7tM8OsS45KYXrjhyUw2y53K4+nytXniXlRgM1XFmTMvUeoINm?=
	=?us-ascii?Q?ae7S9Z+Tu7LQ/AfotXX7y5fL0mpXIQTA6f01jmifC3zUOyuF01IQM/G8XsFw?=
	=?us-ascii?Q?LQFmZpKf3HzJ5rl9X1MFGBZ9Wk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:HTCOJv5gba//DqfMiKjwotNNCJaED0P+g2z2WXI5w+MKI1hzq8L55Ju4W0Ujmt4ttQQfp5vN3GDvKBDGmDiyCvtv0ZlYTykyAP7qj1qL1py+7nEYaPknaBaw8IUsgwv9RBU2bo8DGbH+hax/y/ZYlA==;
	24:s9GjSSmDOX0PMd+2SRX5CQrN3+x1qIYsBkuCvp9VyyCWag4TTEX1O9TQ+vqUfTNl7tCk9K2R5L102/dMDbPbSb8e1b1VYPmS/sornrfPp2Y=;
	20:RpBEa4mIACGmL4iS0J+TZyIlbZrjYJBI/wzM1ilt/WdMYbDS6TfH5m8Dv3oLYQBdGyR0vFMNUcS4WUGf2L2Wdw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:46.3424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 07/11] qttools: use one recipe for all compilations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 11:43:48 -0000
Content-Type: text/plain

Instead of separate recipes for target, native and nativesdk, use
one recipe with BBCLASSEXTEND in place.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/nativesdk-qttools_git.bb | 42 ---------------------------------
 recipes-qt/qt5/qttools-native_git.bb    | 24 -------------------
 recipes-qt/qt5/qttools_git.bb           |  9 ++++++-
 3 files changed, 8 insertions(+), 67 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_git.bb

diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
deleted file mode 100644
index b217da1..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-QT_MODULE = "qttools"
-
-DEPENDS = "nativesdk-qtbase qtbase-native"
-
-require nativesdk-qt5.inc
-require qt5-git.inc
-
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-FILES_${PN}-dbg = " \
-    ${OE_QMAKE_PATH_BINS}/.debug \
-"
-
-FILES_${PN} = " \
-    ${OE_QMAKE_PATH_BINS}/* \
-"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    # remove things unused in nativesdk
-    rm -rf ${D}${libdir}
-}
-
-SRCREV = "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
deleted file mode 100644
index cb78697..0000000
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DEPENDS = "qtbase-native"
-
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-QT_MODULE = "qttools"
-
-require qt5-native.inc
-require qt5-git.inc
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
-
-SRCREV = "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 443d58c..68fb459 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -9,9 +9,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
+DEPENDS += "qtbase"
+DEPENDS_class-target = "qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
+    file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
     file://0003-add-noqtwebkit-configuration.patch \
 "
@@ -20,8 +22,13 @@ FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
 FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG_class-native ??= "linguistonly"
+PACKAGECONFIG_class-nativesdk ??= "linguistonly"
 PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
 SRCREV = "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


