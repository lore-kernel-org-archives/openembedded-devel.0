Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 46F4876CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:47 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:45 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:48 +0300
Message-ID: <cc41028c7b2dce9e368dcb3f2017a8b8edf3741a.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:6BBe9A/44TPdVdhpR4nHuZ5A/wJg6WV9KYYk4FkOXLMogj0D7eWn8YQt8jhZaM+iWCLWsma9GEx0NhB0VjgzJXx6rA7hv8My2IYbVGhTSwqsN8bnzX7IccqVQvfcD8HEIVTFWX84MR+6k2pbynhEY0ic+HBQ01Yo7FSVFuRLlMs=;
	3:MIDar/yldxEwHHFZoqWaeQl6s4gPoBwGaEQoqySqEQ8XucEQ+ivFcg9Cp+GXgZrqi3xCy025kvBdIjRFjlFdy6fkGJAnoQpBVCm1kgISHOk0v9QmzLQNVb+GDAwb5wylpyNaa5IrbUjvMg2EHfg6IA==;
	25:3WmsdI3x5z0Mx3Qnf1nUw+IwecbWODweiq4KrA/16AKVH7AGpa+oB8GJtT+B23X9jUnZW8Z353vN+vPWtL5e0DKjJoelvov13+XcagBTkUjSLc8uCbsvBeQVwiZlcPREHYsAG76pvmOY3pSOrsoiFaKEzCl3zkmDxS5/43ySdhncHnmcXv+MeWuq8kejiSG5xhzKklqj5ucG35FS0IOKd3r/chm7+6PZu/wkrdZ33zgEAZw9AEb7LjNixu4xTrmu
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:KmTiR8baaG+qzDws42GRnzUMxGzu36LX01aH60OCAk2+lu3VgVBV8QVQaueHrmMVnF5taie9Q1uYop3hXiTJRF4R9H20TK1qadLwtt/G0GC1Z+xLpANHDNsQWsX6QqUrjUdUtYWphi3KAv4XbxvtlgXq40Z+mrJKmo3wazvaRmjwdu/ltkBeqXzb6ttygR8CEmIfTO70EeTPdA5i7I5z96hWRifQiz3adcyXwvYtOlAnhdoxqHpjAfxNdGYfnuRFB2eMJOtsh36HGZQRni5ox3ooTcZ/kFbWJi4Zsz3ed9kt4lMaO0j/hSVtpZfLq77zeP9LJYp4E5O6CNlhyR2HMfwMfok/O7KPKawVUifF8emKXIvWSlb6Ei3L8/EJmJsT/3l1okVyWtUIynm6KEYD7gutuQUn1dYpaHaVsdJQZkYsvi8XTAfRb2toPhsUGGN9EXAj2VGG0i+brOrBorMgkT/jc74L401xSkhcWk9Udm93tkjWnxUr15B7XCPX1+lx;
	4:ZkIOvxoxLBVKF1t6+DjDb/cDbxA7tYL7adR17xpTeHIZg6GPNrxBZ5XyYIWpl+Eh/Kz2tKJga8Q0yb6YJ/zsXPRq66MAn7TgOJPWIE3zbgyDncxUvOrKmVTM4mbtwRHgUeOfwe4T63xjRTeXuf8YaN0ieqBmdWo1XmbxNhCwcKphNP9Dz5BpmQqsVUIOk42gp6fhPfbqV7S2209H7iXZlPJYTLuM0+SQZIdfIKx5Hj7oNJ2ddUmyXS/w3KtI37v3Zub1PiRQtMCVGYzZX7NHGozXAKh8ahujd5rjJCeVMRUK3aJuWoEkSXKvbGa4sSCS
X-Microsoft-Antispam-PRVS: <AM3PR02MB11720E775C78FECAE2FC542290610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(575784001)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(15975445007)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:n4CoXb6/MPtvAwuzpXuCVrnJlqq6UyN/C5uyp6s1Q?=
	=?us-ascii?Q?TcjI8gueyykLFR+WmffqLZ4M8FWLLcH6DlLC9yPyGS5wPr/BPEVrL9BnrdZV?=
	=?us-ascii?Q?yeNda9pR5etMflIj8ko7iRlPkGWpTGHSdsaVxCnkNj05bnss/wVjlS8xJtrW?=
	=?us-ascii?Q?ADmE8SqwRRPD7wazN8m1pu5mgO5GbxIR+dVayOplJ9L8oyQI5/FlPp1LjwAi?=
	=?us-ascii?Q?srK5aQqM6MaQk3vxvUtVKXt7K5hcdUzaG5KvpG3xzgpBdP4aijp5zrW3JXDT?=
	=?us-ascii?Q?F2W0w1rx2+HSrz2z1/i1TekGsJbTndU8NcHLLsHT4ebsVd1QN+Bc/RA9Aadu?=
	=?us-ascii?Q?M+ZLPriRj+mG1nESpc8Nf01Obpo5/zKepL3Qc4WqyS+Dy9w7V8Kzt+43wnE5?=
	=?us-ascii?Q?WXHruHobCeCpnfElkANrud04XFZ5yQhLaf2ocuxf6Pzc7Xrwly6fJI7nYzki?=
	=?us-ascii?Q?0sl5SNrnGpjnALe+YNHjRHimeoD2KTvjx0YfjZltwjDSc2//PP/nw6k98r+C?=
	=?us-ascii?Q?82zvoO5Z+cu90VlK9hYbQffgnaI6/GZpLXns/S/wO/F+eH4pL+3neamJ42os?=
	=?us-ascii?Q?mWak44FNmbagtS6E5M/1fwKW2uK1ZkkbeA1AfrLACN/BluWyHnTSo3GslqVW?=
	=?us-ascii?Q?hysdW/T4voA8VtU02+OWxtOXekPZ0Wz4RJ38ukBFTQxAwunfo47pqgu2a1B9?=
	=?us-ascii?Q?38F3CAZfzt4tqcqkbkeTbcds+PvTFinKYQ8B/ukXloocw2EEkCr00FOHK6/Q?=
	=?us-ascii?Q?0owKtz07GICtVg+I6YVsszpGA8GgVX3XpzNYpoLDmnH8AXsqO071jy59/MrV?=
	=?us-ascii?Q?6FaKzn8QbRgWoP6aMLu5fhd1CJKLAgctM+S+a7GHn73p0yaMYjEZRKdSclxC?=
	=?us-ascii?Q?1EPqOel52BrIOc7ruKo22MUfX+Vd2VeDMnDFQHoSeGdKjTBB3PAIjjF2JaFd?=
	=?us-ascii?Q?hRJDmT3ubcnWKFWRUcUtM+x75VPxZybxqvStUvGKDT4SiARogdjDH8VT64BY?=
	=?us-ascii?Q?kqYjLdBdUH7y/Mc3Sak3vKrDqf8k98R2/OhIbp3ymImE+ZdcUAvJgaLM2lHd?=
	=?us-ascii?Q?rn++5Q0Vc5IhUvLmTsYw/K3G+brf9VyqZ+3efe0wIgf9N4PGRmXLDXfDcn8A?=
	=?us-ascii?Q?jxtico0s6V8S+pv3ueiK4slUukGlPmRDza3BJZYXKGhyPp6RNcQtX+aFZaq5?=
	=?us-ascii?Q?a/rv+VT7YwN5vwXUqHowmFA4ULUVknW8ypP2dS2aFcWrTsrrqYTbgHQTm3/Z?=
	=?us-ascii?Q?TLcYqL1/sYD/HySGDmmwWCKiqyai8LbUEiFlijUDezTkTqoKyvC3XIOyoac3?=
	=?us-ascii?Q?7gdbtxRZywgrqTXlkyqV3OdyOvKDcLGrqvjdL/S90hMd3wjtLGy65UN0Ecfy?=
	=?us-ascii?Q?iKpwcDHmTru3rkabF/bBrOORk5Hi7nXF5a4264QDT9oM+96?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:mmuqYBBPMlcyJxn1tJ7itds3oLmgwHTuJflg9qHFsx3lGASUHhIiq+C62ig+iNFQlR+Ko26jYRYPkEm3uAK4qzDmNFlYc15L5/+ZKvAauRchkA8jv25FlDmeCqjsYXAH3iL1nEk0KlTndMuwal4ntQ==;
	24:xBHcnysamOmSG6Kf4a+FIEg7AJhheNiFeS4/H20PgAFbnDctvWc3xFzFEcfiqvritskt3jSe7OwhCX0Ya0a7QsyrzWdgcPw+6l2UH58UyJ8=;
	20:4pRbcOl+GzkVSUA7YBbQrMg7op6NMEQTa7bQEezWPlI0T+IQWaqEcddwmYH8Yh2G+ZI5ngmaeARuIsHmOOc1TQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:45.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 06/11] qt5: make qt5.inc reusable qt5-module.bbclass
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:47 -0000
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
index 7f61271..1135d1d 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & LGPL-3.0 & DIGIA-TPLA-2.4 | GPL-2.0"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f472c98..cf77a44 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 0cb724e..187ec08 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index f9689e6..5f6c4d8 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index f80e42e..84158fa 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 64c9a10..9d175b2 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index f3726da..5dd3bb9 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 963c576..c0ea2bb 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 5c05145..adec185 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 1dcba1e..2d62570 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 51db1ae..5ab10ea 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index a54deb8..f650efa 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 02688a6..7b39cfb 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 5f41974..2139448 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6350e97..b13bb70 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 781cd38..493736e 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index afc8984..443d58c 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 10ec1aa..b63d2aa 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 361b54a..a725404 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 236eb47..55acae4 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 2933bf7..fa0f019 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -26,7 +26,7 @@ inherit gettext
 inherit pythonnative
 inherit perlnative
 
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # To avoid trouble start with not separated build directory
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 62e9612..bf0b3d6 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 74f98a7..d42b4f1 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "BSD & LGPLv2+ | GPL-2.0"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index b1e2951..c30b0ca 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index e73feb7..c108c10 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 3c273db..66dddd2 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,4 @@
-require qt5.inc
+inherit qt5-module
 require qt5-git.inc
 
 # There are no LGPLv3-only licensed files in this component.
-- 
1.9.1


