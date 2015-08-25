Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id AC1E176CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:45 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:43 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:45 +0300
Message-ID: <adfabef1014d271e9ea61356e0d4f3756052ccf9.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:rTxU1KzRRUBkP7cQOMiy7/yvR7G7bsDoi63UaELGMV/YHgPiOlLYcLSVNNQT31aAku7FVhbgil0n9FO9BU6r0DGqUB2gJbHCIohobnLpDiWTPG9/2gd77fBcxl8BJkMtyJsFVtr50FZsOBgLmKY3EPQwFnMj/SfuHilkLjdHic8=;
	3:uClgDW6pOGHjTgsyGIZbqNoBxR0QnAEqs9cWMSWfp8zDFNbZD9M0fgoRJWaHR4H6oADaed+sLL8dbfUBcjM8ZgopyB05rzMOn7wsnmn2W5s0Qnlud6nfnb1AfdEDM++N/6zwdrbgbevEaotu23YXPQ==;
	25:E8s86vouroa2v2BG34EN7iNK1bXmJDJv4DpQCneb5G8uf6jZcFUh1fmMJeKRNeq1wqX4P92ZSlRZAkDIV5oDYvPhaocRTDyMbJMl7riuIVCEWuSVHUdxNVOmFklr4wBLDlndqR+QYCVoNTxg9/iTIlJCkzyWDNLY46jJdnadZ+7Yip6nOjWtZcGN5IG72IwvTENuvJjnVARmprHpnbqijBBOuz4INFSJYZrSOfhukE+rwU7llWRe5JF+kKVZbIVPqvSDq6GT7hVrjqPei9QoDg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:JQrwUyJ6nbr6m9lrzVhVysDJI8UsRiuhG2Ek1bdZRx4DyRnzpsO4uAlLMUBssoRrBtj0DKr9k0m15T/nro5i8Kb4JwLnO3T4EaMzAiiV6bccz8buKuZYvyWG1siYA2ktjvkf5P1MVzn29xxh++MJ8+6VbhIjZuQYy+PmzSL+4gY8zTu2cHn5Tea5Z6uns769VEJTFrPcH2LEWL/faTjnJXhrvq2nT3ha3UJyWn3X+jxOcpbvD8EN1XGhe3CvIYHnVf7OndAEzwYznLfg8e5PvVF16wprpm8KaTTjrPdk+INd0URZviv4E5YgKt2YY4RYFcPU9OVKzga9aF2iypHL9AkdopmrUKuqxF5DlLtNGLMyghF7vCx23iFg0USH+qV9mKqRvg6mVHFcn4+YUy3Wd0AVt9jpWhU9BYTUz/tU0IgwVMXn1u7hTnAr8vKmtL+lKgJXdCNZ8xAbiyevNHtoPdJYDhbMKaAsDls9jHPkOWw2P9YWRWsrcnAJmqnfJ6zr;
	4:eSfXm8WPbMzidUaO5/C8CE7OpIK/sMwJvhl91mySwVRRZwHmGb439Cte1PqiczYQw6eVaz17c+BYlHauTMeB0YisVPz75baa+47PmA5OlDwz6N8b39Fl0GGSPoP9rbZINThI8BgJtSQ3c4JMYrYOZOEu6p9T8q6p/C7HvCZE5fSxMZ7/7viQKiusWCSq7/LUP3hgkjttybYn6BwllTJ5Sb1PeN0FrWT3sEh9RZKQytDOHsOAqsJ21/obRX8FrExVCz8lsWtW6XVzq8j3/XvSEw0YkXtagEzrGhvWL54eZ1OD3t0aBBd5KZ6flc9ijigs
X-Microsoft-Antispam-PRVS: <AM3PR02MB117257B4D67EC85E40A0F08990610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(575784001)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:hj48Jepx0LOJfy+duux8f8ZaliLKOnMTEVsTi8svP?=
	=?us-ascii?Q?Cc9N2ArUii6kN9gR1RNW4ef2lsT4lxyZ74UZyPJygPzDCyZOIU5sd7WMAQVe?=
	=?us-ascii?Q?6wa4btDQP7znOS8Y2imFP52agvGjciFZzSnl12KWNnR8YCygqUnHAL8Tmmj2?=
	=?us-ascii?Q?KJcicVbCj39Tx5fU7wmDsE7dFGrkGDmRFC25m6ycwCN3No1y/VOuCSBlvbAK?=
	=?us-ascii?Q?7NTT6MOU2LFEv5eqToTKVqUs2vJAd2GbfFFH4NzoR/53KRP9P82NQroXAJcH?=
	=?us-ascii?Q?Vz0CpgvnoTlU2gfaKhVhIOXcg3LrGPBB7fgXSmzIdk7ZvtEa7ifPVIB0a4Rx?=
	=?us-ascii?Q?Qieqnkj1zr63BYqWhhDDIf83evyWPoAd8S3xfs0E1ptW5gcbHnlqdEAObE16?=
	=?us-ascii?Q?KkOyaDpN6bJeq7sVZJHUIPF9clzXTLq8kw+osnsBCc4KTcQ1FQ7/Xby+XgeW?=
	=?us-ascii?Q?VruJnY9gsy0dhn3BtE3VdGIYQAIJtUEDR2Lh7NGOFDpmvFRxqYm5KJIERG9Z?=
	=?us-ascii?Q?qwOnudbtGvaqgbnQNI9AGTINnCbAJTIV1yqxGbO6B06ucjGCLsjqirJNDlnO?=
	=?us-ascii?Q?0o86EXRk4iLPuQgvPVMmFVLNNx1wI2ADZm53XybA/mAWof5fq9nIsk5Y7Xr8?=
	=?us-ascii?Q?8DiAXUbdQIFdIjtUnE+UQKMPPASWJFpTrXCMd9R7F0O8CkdHOkhWyOVakwwL?=
	=?us-ascii?Q?VABEJvM+KMNVmaOzDfg6ADBeB9Kcwo7ryzK/77kevsWpYhRqY7d3wH4TKxvI?=
	=?us-ascii?Q?l2Cxruk4ZRNsoFv+BFh3qIwRW2/CF8VfcqXmT6MeaiJHhyLuQ2WE+Z3Td643?=
	=?us-ascii?Q?2TyCH/vkKtBq0FAM1qBM1RB9SKyx9/dnFYxNyZKegrnIH1oK7JV5rxBprO2I?=
	=?us-ascii?Q?8qpJxqzWPP9JpQO5EcpMbcnjqeuhS0+LaYyNDyVJbsPYYQUR/fNq3XLd6rqt?=
	=?us-ascii?Q?UDoIu7FIk4HjRDpSfBhrcvJlNdH39ONd9uABDevnMEI2ZfFwyCdw+gPpYsSt?=
	=?us-ascii?Q?90+yFBOHwVaP+OpikonADRak0Bip3td3obEg408cYwlM9Og2jgRQrj23SkTV?=
	=?us-ascii?Q?NQAeffy9eO304EFl5nPSzAIC1uaNDFNDzPCict0oqIW9L3PaEBkvOGR3Mujk?=
	=?us-ascii?Q?yYpUheKgNPc41oOISmwHBDrbMZJiYoALdq1hJ9hngNoMV281pR3TtYxV83S6?=
	=?us-ascii?Q?AElgFacvCfYr/sPO7Lrt0qTJq1X++RntygLKGAD3qvfqUf+R7QtYMKl7o9tx?=
	=?us-ascii?Q?494L577mGb0OnieyQDHmwoA9Q7PcfWubHH65AKHo5v/kSY3QFtVC2ue2sQD/?=
	=?us-ascii?Q?AjFaWNx3DLfDirYPwZNjrqTTUtBAJCCqxBJrGG6BxyuFpeN5DbcqipeWXkJU?=
	=?us-ascii?Q?NMh3Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:EuFDnmMHSPB98vn/I5q2KQNvtcclW5UkVQ+eQyi4pYzyZ/sXeHbzW39jmWQU5gaQe6IkwqCveZF81X8HbYvZpCPAju/ik2I+4kQ9DYJHWtnkVRPijoUpbU46T72DjskcFiTKWhkE1vGP/7Jb1uDG6A==;
	24:jgie6bBx0nuxIQIxMU7wrI40sWUjNe/9IdJCEa7Z0yZzc5IQjUu/j1mwXz2PmEKSAJ/xlErkb3PHB/7NXeowOhXG41cJm7yQOYCVk/D75JQ=;
	20:FiDssgnQvxcxXzy0nG816+0KTQFJB0GzAlkD3nGbqns4OhgzZWNu5uiocnhJY7AB44s+2o+gUZSz/hOR9ZUv5w==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:43.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 03/11] qt5: improve support for native and nativesdk modules
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:46 -0000
Content-Type: text/plain

Change qmake.bbclass to support building native and nativesdk packages,
so that qmake or qt5-module can be inherited and BBCLASSEXTEND used to
create native and nativesdk packages.

qtxmlpatterns and qtdeclarative native and nativesdk modules are required
for Qt Quick Compiler.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 classes/qmake5.bbclass              |  8 ++++++++
 classes/qmake5_base.bbclass         | 11 +++++++++++
 recipes-qt/qt5/qt5.inc              |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb |  2 ++
 recipes-qt/qt5/qtxmlpatterns_git.bb |  2 ++
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
index b056ea7..2b43f2e 100644
--- a/classes/qmake5.bbclass
+++ b/classes/qmake5.bbclass
@@ -13,3 +13,11 @@ do_configure() {
 do_install() {
     qmake5_base_do_install
 }
+
+do_install_class-native() {
+    qmake5_base_native_do_install
+}
+
+do_install_class-nativesdk() {
+    qmake5_base_nativesdk_do_install
+}
diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 44575c4..ffb3103 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -166,6 +166,17 @@ qmake5_base_do_configure () {
     ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
 }
 
+qmake5_base_native_do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
+
+qmake5_base_nativesdk_do_install() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+
+    oe_runmake install INSTALL_ROOT=${D}
+}
+
 qmake5_base_do_install() {
     # Fix install paths for all
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index ef849bf..4c58ad6 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -50,7 +50,7 @@ PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplu
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-RRECOMMENDS_${PN} = " \
+RRECOMMENDS_${PN}_class-target = " \
     ${PN}-plugins \
     ${PN}-qmlplugins \
     "
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 421c482..f9689e6 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,3 +33,5 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
 SRCREV = "cc0df64bb0e1dea2fe37950816095802f527a241"
+
+BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index cb6bf9d..3c273db 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,3 +13,5 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase"
 
 SRCREV = "ae6504efc85adf754d60a02f81413e5949282d78"
+
+BBCLASSEXTEND =+ "native nativesdk"
-- 
1.9.1


