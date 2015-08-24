Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0116.outbound.protection.outlook.com [157.55.234.116])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6A27694D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:27 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:52 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:52 +0300
Message-ID: <37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:hpbo0iMISTLjRY7+/1o9wAkPtxrdAc9g+ZrCl9+2N0FlVwR9DsHAnAwsuvMGQx4Ibe6yyX71vbu3RzQp4LeSZzc1eO6h3BnDhQluMePiuZenk5rAgQsaYSCKBbWKcm7AiyTehzI9ozNkv5zEV324QjKdKtm9e3VyESfgAz/TZa8=;
	3:j0haERTcKTq4+DbeMsfvFogncTfUAqgUCjephEG3YEIzGgwfBXcY/HhjUUueDwq8ia7kTVLAe4OvUdPA1ZdGKnd3FZ5RxNtg0ZRlAorm4RgbZ8QijBIIVK4m+EecA/Kc34DaTgHFF9j/TLtshhULJw==;
	25:b85jwCpUHj7w2mzEg+aQ640Nv5MWXa4xYzSGobmr4vYv01zwxkz59rP6Fat80+bSk00JOcxCQRBm8x+Ykwz7jtAvEUPXXLHxZ92x3nsA7tD5wt0iyIvgLNuy27abgPIAXHwjiWOX8SzwgeVrNR7FJYiFGKPd9cJB+1b7IYdzjMTra1Y0w5Y7svK9zG7YBLms7H/z0zeIz5+s0J0KKEPvCh/HC0U9q1DKFu+Zqci86MzbDkXSy/YXaCUApeTcOB3aU27gVoBGvngCTlrQCvbreg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:7BMCOZuTnE2OYWThaDjUvzr1cbAU/vEn8IBpUr76LY7Vo1cqrJ5X/RK6KDej4aGXIL0/NKanJb47tRPaqVRD9MkmyTiOZI9IIGDXSz/Tl49XOwE55DfOiwmRICJrtTPwJIGM73yiM+xWOASLjJPDs0POfTJalHpk+5UWPf4VNZJLSPgnjCF5ugigrNvKdDLdK6ZudWAepE6m9T2lpZ3pexQgz3cOO97GW09EgSrU8IRCE0hR+JM393cjaQNGovWu606lPX3E/uW0ZpqSEeLfDlFkFzt/D3FNtpLpDevAQrIf4xPrpDhsLpoybwd74y0uXuDkl6QPs2DuuIF8OIcor/OlzueZaeRHwtq7L32N1bdzCUrt2AkrJz2Ku0fvlbJe6mupBWdKJ7yPKB4FiaYi7wUHHB1FJ36/Au3VWddh+ws/v/Jcky2b7FZvuxTzAWQeOq0KgBPyFn3uVMiN/m7JW/yr0Dlam8EnvJVLlMiCiJbOsoP73gUZj6zX9yIaikYl;
	4:xVfBf0hZEQXfHYLRQtQTn4KjW3XNJdbGdW1sraQMsPJXvmgyi1wsATGW7vr76gPrwzHg2V7j9eimv+y3qYQyuRnNJcxqAjGO7/PvdbkIlDUMp0pLTsqfGzDdj+fsSuNtFUVNHtPh3dmtVQuMwTC9aD9RnSRCB1IwkIOJNCm3TMcushT31epmkngam0hKhevcdOXWPIAMdxrnJ3M6ZEXADa/ENucTGpVR9RAHhDo2FOBkDorQNwwxWAvFbqrbSNvivrwSA6Cqrr5qCvN/DD95VdAn2gaLwcCjkpglS+INF8tRPreRPkLf38hllhtzXEa9
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174DD29E62C423E6337FFB690620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(575784001)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(15975445007)(7099028)(4001430100001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:MBiHSh37JdO9LgO/du8KpEgpmfFS3GW3Ju35WCzMg?=
	=?us-ascii?Q?WD+HOjGVj9Qg8D7m9XBlGFwqRKsuDbtXr80tRSBTBa4t+BC9iyQrXB1ef5S7?=
	=?us-ascii?Q?zdYzn0Hgmp4LUzCk8fi7TzlVnN6LhN47Modx8Kpp/q9+z8DKM3LDA5rA+psW?=
	=?us-ascii?Q?q+srlOcHlIHW/910Kzt9cAu9OK6CYurqTcG1S1415xrX1eZ3KTqEQRi8Yq1f?=
	=?us-ascii?Q?rwj9ZEMIBcRcCDJUIwGUqsYl3fjsu71CA9esrL5fGELYLv8GqLCtzW4xJQ6i?=
	=?us-ascii?Q?1K875qK5gQ2t2P0T0u9Zo2f1QpJi3suXbjHaX1CZlnWmmRJxC/1zmQAovuWx?=
	=?us-ascii?Q?m4/5yf17S8V0AOBIgZoGscJTn8gv3EzktJWaTmjsdB4Jg1iReCcwYxNCbC1Z?=
	=?us-ascii?Q?ChRtcPzlCUClSRvbvQitAKkLDSoQTqb9g8tzSrvde4CxJScED5CuVdMFhQTe?=
	=?us-ascii?Q?t89f/2kjFcbqUGESbKAbBrfSC5d+qEAFGyNNUcwO9cGTozocWU0UZWxGLSNB?=
	=?us-ascii?Q?LV66aevNRiPRRBu34GoSq6srXAjPvgY1PSkYh9veUtYWEHW3qr4WN1AEBkZl?=
	=?us-ascii?Q?BNiGHgwuf2JE4Uliv09SGRpDS5cDVAl3RHjjRZD9B162yqEq0uM672FedO8/?=
	=?us-ascii?Q?dL+0jpdZQnSSaSiez6rWwodngQLV64AmDEPihNY3lkFnz7Y09CDQm+B8ffqt?=
	=?us-ascii?Q?5PuEXhgsZuaeOAmtarJMYjnAW+I4EMph69CO1hbEmZZsrCDAx+QrldmfeZ0m?=
	=?us-ascii?Q?44y8coXvvE3sckmCDtMPNYVPSVgd9yYCRtff7AnPN1dqTu/i3806K8W+b8Ue?=
	=?us-ascii?Q?GeLVMmGQ0nqcUKIxoQS5GC+hScCuVTZ3l8//y3Mr+NRWaoMtVqef0TKlX+3C?=
	=?us-ascii?Q?/hELC0dyDYuTpdA4MWYT9uGGEKuFka0qNxz8SUFNnEZjJcxr5Y2YJvAumZV6?=
	=?us-ascii?Q?D3Mb3JB2nmHmAY6y6oOYDmHmxmbsxjBPTNemaapkexq9xpa33A2yzoYVyAEf?=
	=?us-ascii?Q?5k8nnuqZ2VTkYjhEmAWVCl69kAoc2mqsCLjtLyaHHgZgwDL1epozi6wEHG8v?=
	=?us-ascii?Q?lT2IlNbXkEnb0gu6pWGFCMTk//wPUIEZ6uEXrDxQPtpE8hWASLd2Gfi8SLZo?=
	=?us-ascii?Q?ZJIbv5ZY5hIcZl3kEiiJlmePRe2ePkgO0qSaPczMg+OnGQWknjJ7MstNJy11?=
	=?us-ascii?Q?gYcnPrOqgn0XDFBgv72Voyg4Oz2M4tql1Zv8k+XYa3mEi0VsyazgyqQ/csUk?=
	=?us-ascii?Q?feRtU/qmRj7Is8L+OUlALaQlTTsI3eHGG7ubHXtsCjOUvwgOm1MzoiL6AlJi?=
	=?us-ascii?Q?ZggRGZQ9zM89nbfAHGpKxoNKnqKjx9xeUrymeABo6ieszh43LKbTD5P3imJL?=
	=?us-ascii?Q?5t/3OJPYIdwrFTDqGmBTDMu9PRYkh4klW6Xq6RvM7pFxBpt?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:SWmP0trjzzTGa8oOjTLVIUIxHJyt212OJM2Xuw6/MJ7zx89MfFdb+/GICjfkpFdYfc5+TFuOd8o1+pTVdP3arLSNaIHKfoK039yg8DVC19PIMpsxrlsgdvYc/dS8+iUni9d9W+siXyQ/o5bIBPSJcQ==;
	24:ntvpPUOTH4h4GZRwoGeWa0UQQKWZcq09A9POx4CJ9CQdbLs0nPJiE4WkDSAwd6SW6+ShRzqJLytURKdug6XitpaceRjD6n8o4L2T3e+Bqdo=;
	20:v2KWEcdKMa4Xhr/UnoX0N2dBKEoFpib4f8KC4Pj8+q0vzC5tLdV5LinduXG4n6qp9kDl1AdVen1fYKjcon4+6w==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:52.4750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 06/11] qt5: make qt5.inc reusable qt5-module.bbclass
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
X-List-Received-Date: Mon, 24 Aug 2015 09:28:31 -0000
Content-Type: text/plain

qt5.inc has common parts that can be used to build any Qt5 module.
Make it a bbclass so that it is easily usable from other meta layers.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass | 0
 recipes-qt/examples/cinematicexperience_1.0.bb       | 2 +-
 recipes-qt/examples/qt5everywheredemo_1.0.bb         | 2 +-
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb        | 2 +-
 recipes-qt/examples/qt5nmapper_1.0.bb                | 2 +-
 recipes-qt/examples/qtsmarthome_1.0.bb               | 2 +-
 recipes-qt/examples/quitbattery_1.0.0.bb             | 2 +-
 recipes-qt/examples/quitindicators_1.0.1.bb          | 2 +-
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb       | 2 +-
 recipes-qt/qt5/qt3d_git.bb                           | 2 +-
 recipes-qt/qt5/qtbase_git.bb                         | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb                 | 2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                  | 2 +-
 recipes-qt/qt5/qtenginio_git.bb                      | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb             | 2 +-
 recipes-qt/qt5/qtimageformats_git.bb                 | 2 +-
 recipes-qt/qt5/qtlocation_git.bb                     | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                   | 2 +-
 recipes-qt/qt5/qtquick1_git.bb                       | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb                | 2 +-
 recipes-qt/qt5/qtscript_git.bb                       | 2 +-
 recipes-qt/qt5/qtsensors_git.bb                      | 2 +-
 recipes-qt/qt5/qtserialport_git.bb                   | 2 +-
 recipes-qt/qt5/qtsvg_git.bb                          | 2 +-
 recipes-qt/qt5/qtsystems_git.bb                      | 2 +-
 recipes-qt/qt5/qttools_git.bb                        | 2 +-
 recipes-qt/qt5/qttranslations_git.bb                 | 2 +-
 recipes-qt/qt5/qtwayland_git.bb                      | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                   | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb                    | 2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb              | 2 +-
 recipes-qt/qt5/qtwebkit_git.bb                       | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                   | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb                    | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                  | 2 +-
 35 files changed, 34 insertions(+), 34 deletions(-)
 rename recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass (100%)

diff --git a/recipes-qt/qt5/qt5.inc b/classes/qt5-module.bbclass
similarity index 100%
rename from recipes-qt/qt5/qt5.inc
rename to classes/qt5-module.bbclass
diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 116127f..b1eee73 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 0546b00..b906741 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${QT_GIT}/qt-labs/qt5-everywhere-demo.git"
 
 S = "${WORKDIR}/git/QtDemo"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
index 7edf727..67525ca 100644
--- a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
+++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "445da212074a10a432f4508d125814212bbe7a967bfa47b015b92dfac6
 
 S = "${WORKDIR}/Qt5_NMap_CarouselDemo_1.0"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/qt5nmapper_1.0.bb b/recipes-qt/examples/qt5nmapper_1.0.bb
index 77cb067..cc61b18 100644
--- a/recipes-qt/examples/qt5nmapper_1.0.bb
+++ b/recipes-qt/examples/qt5nmapper_1.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "607fbf4c448f00d3c563f9ef8a582bcb6e8fe550e80b56bf8d9127a417
 
 S = "${WORKDIR}/Qt5_NMapper_1.0"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples/qtsmarthome_1.0.bb
index 944c4dc..3af01f4 100644
--- a/recipes-qt/examples/qtsmarthome_1.0.bb
+++ b/recipes-qt/examples/qtsmarthome_1.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "fceaa813c33e462bad6c0383eaef81a6f6e586c15d1fa73898173b517f
 
 S = "${WORKDIR}/smarthome_src"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/quitbattery_1.0.0.bb b/recipes-qt/examples/quitbattery_1.0.0.bb
index ea218d7..a8fb77d 100644
--- a/recipes-qt/examples/quitbattery_1.0.0.bb
+++ b/recipes-qt/examples/quitbattery_1.0.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "38dcb7630553c397f9d8a53c6411b1a6237956ed8dd4859e01487b1dd8
 
 S = "${WORKDIR}/QUItBattery_1.0.0"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/examples/quitindicators_1.0.1.bb b/recipes-qt/examples/quitindicators_1.0.1.bb
index 19a861a..0377350 100644
--- a/recipes-qt/examples/quitindicators_1.0.1.bb
+++ b/recipes-qt/examples/quitindicators_1.0.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "db84112adbde9b6f28c129e8fb37a6912f4bc34bed18e57f570fb78ea0
 
 S = "${WORKDIR}/QUItIndicators_1.0.1"
 
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 do_install() {
     install -d ${D}${datadir}/${P}
diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index f79dc0c..fcd7cbf 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -1,4 +1,4 @@
-require recipes-qt/qt5/qt5.inc
+inherit qt5-module
 
 SUMMARY = "Qt Library for ConnMan"
 HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 62f17e1..e658690 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 33620cb..92faf29 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index c758d04..688d844 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index d186705..273891b 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index a0aff8f..2edc931 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 9da5c94..0641f80 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 31d4fb0..17784c0 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 12416bb..0264b93 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index bab9bee..abaa28f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 928963b..994d0bc 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index af11119..769c191 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 5751e20..6c1c20c 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index ec33355..ee1f579 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index c59eef6..19748c2 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 1dce8c6..6350b38 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index edc0360..6bde2af 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a4f63c7..e27d6ef 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 9341453..75130b7 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 0be7afe..83cdbf4 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 8433652..ce5f2fe 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4b89ddd..3bd75af 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -25,7 +25,7 @@ inherit gettext
 inherit pythonnative
 inherit perlnative
 
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # To avoid trouble start with not separated build directory
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 5fd6436..f98dd63 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index db1a098..674d8ed 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "BSD & LGPLv2+ | GPL-2.0"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 85e9156..bd77d52 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 6f60f2b..6428711 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index da2255a..98bab6e 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
-- 
1.9.1


