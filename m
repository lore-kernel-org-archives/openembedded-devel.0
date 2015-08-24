Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0147.outbound.protection.outlook.com [157.55.234.147])
	by mail.openembedded.org (Postfix) with ESMTP id D7D116AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:23 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:50 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:49 +0300
Message-ID: <e33017765b36c82842ccb39b6691887ab704b3ab.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:4RjM4cc3pgszai+WYE54q3kVfxXxBqDfN9xRR8wYFMHe/8nhP2joP1u2kiokbQHEQEqUaHyR/DsL3/n33ZEpUflQc5VwF31HjotHrOL0h4QH3oXTbFds4nrS7O8BCotHwHN96jqqDsc8iE5SUGa92b8RmBQ7RVHxPdiZj/Po0Xs=;
	3:vZmFCUWPh5wPTK4oZF67kscDeHWYBzV3FcY7PNTHiu4cUQ29K8hlxYK9xydxqRTPVXbM3COXl/Kfbc4lefGSou2gd+X49DXDAz3cXb/jqUu6DdjNbgiKutz222PqA7f71+nojj9VNUVMWy6IDHSlBw==;
	25:ygdDMtf7pBGdbHHgdcKddkJba+ua0ThskRhsvmHcO2Ad9zPb0nEr8C454GF4aPyljxMhFsQXI/y6XYXWjBGn2JXvga2Ac9KHG6H3VfWHgnd46BN51T/Nn0nqOQ0JesaHol48whSwPt+P6Ei4GxB0ycRjB1xh9J6cR8GF87bfj7vZqxZlUgJ9U7uBe4jDs4IoLZZB0JOqF1BV0pim4ilcBTJpOBufLulpOO2nfv84uDm9jonfzUKNO3EgmjqH/FdvvuBKoXkppapkWxvI1zpGxA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:4JPvhuOHdPRahwy1l4F7sebmakWe5j3huxjQZHZUZvhQG3vpI0X7gKPe4LQxKkkiv4hvgTTVjCjBtEhaBEmOOVeK3uh4bDkc2OAK9QbA/iJYLFIkTbJDiV0xM6GeRd88/I7crAknSuPh6tf8lHOCMAkJz6I/ce6OkS4+3dZox5f++TeuCzB62jvMufz3c5PwhGbm6Ec/9vXwlKBVVhS0cy6TnSuZgs43AaAsMV2bxGYqo/tfuPms/MGepWGUJqY3CIje91Sby5H7acc0t798LNBz03W+Tg2KFifTubWSFFpPwADMtjpjPJD0CK9rRQ8zd/uQVw7fT6jhrcENf9rnknxBtyGWP09ZCtA1sSwhT0h5VAaY3kTBmK2lFFnj+5dnr6Ox5xQPC9y2+8d9VP5BjlmuLG7+vFGhnwA8m4RNsv3IsqBmKQ377vIckcpPzXDEew7OR5xzawhlyp28tnHhsMzV+tV35Mx8xlWDPIXeXRwsbowhwdemLMw0Q7TAephW;
	4:U9bKF6d/HW/WgeUr4kTIeIBOqBHX6ElgTYiFeoaX7eiWAVGpI+GPwXPaPGOlffqJYQNtJFF39/H4ALz0C4P8jjpeug8+MOPwr9lVYXhiq5RQuCoVXXfYGZA781pYFT7tNOjhuKvGRpZBoj6/RJtI1zLq4JWNmyo59oW/HkdJDarQwb0HGrUwdG1xu7i5wSwqXB7s0KHnfuirV13ChlCt+EEZkH9vcNHF3TSf7M1H0AGw8ZGlCXCjTvct6EiTWB2b5hxZE748EhKuNAFSjtV9hMQZA185k15bVFVQpw3Mn22PNW5Ci2zy1KPM9Gu36eI0
X-Microsoft-Antispam-PRVS: <DB5PR02MB11749B82D34EF73EBDAF71D290620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(575784001)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:J75WAUlFTSqaAok9OCJarPlmKWziqS4GgikOPZ2j1?=
	=?us-ascii?Q?VoGPSjVUYPQayUoV7bIDk+Ij3kG6Y9hxNbJY3l7JH4QJc1Gv2s5RQ++NxFgM?=
	=?us-ascii?Q?y+dwjysVa6MqOHf63JlKeRLLSHuJHdtsMYq641ifWtl052H2DmwJwVGe3LgL?=
	=?us-ascii?Q?rtpjWGSD9F2g8LWyLdB/Gle4r0BWRlzk7oN2YGL8nDHPCORIvKPP/kT8ydZC?=
	=?us-ascii?Q?cGIDSvpyYfJMA+Dj4PHvhMCryK/vsZyL5lOpRlStci+/VjkSGF++fXsIVGBK?=
	=?us-ascii?Q?nZbA30Oxmbu24vQuJpbfA8WJyg12T4Eac+hn1DPeI2Y0KkiSqrWPnQGaNLhz?=
	=?us-ascii?Q?hZDP3hj93TwxkTYqOTlliBWrA6Q2xXhgvwkx+7tLF1Rq4Xkzf09CH+NVwZiF?=
	=?us-ascii?Q?uL5ySeIbjuo/nL8+pEeHNljmgX6Zq12iec0uEw1Dlxk8dvHvDhLMHb/IIZAA?=
	=?us-ascii?Q?Y2i2b8QPmmzNLPP+pGqwsoHIoD59XQ/I3mZifLN9uHa9tn/rGm7EcovXS4BD?=
	=?us-ascii?Q?pqVibnFauHOJ+SMc9DUS/CbILEQybeKbYMMDlKe/KpnRfd+V+6cQGZGea04c?=
	=?us-ascii?Q?f4BDRwzpZgs6KCujiAlP2I2nFYWB8FmOjZizOwjuMBDSKnySUw/l/zEBDXNc?=
	=?us-ascii?Q?VmV5/I1mlE5RcYeC3vwIR8LgHFLTlpAqJmpKWYoEH85j8+6+0pdIjCnJMdkj?=
	=?us-ascii?Q?3bdfunsG9ORPDLdTGk88uA/7MmVRHq1UYyz8jjSDg2cyeBKbW3RNCzmbExBt?=
	=?us-ascii?Q?ulyFySSc+LVGY0ni3QqXUN3W+fPAJ7Eb6UBrTo0wZopFT8LEtw/sFF+di4yi?=
	=?us-ascii?Q?Ou3sK3xd2iQOcGAuoKY47Oy2XGYPcYSSGt6JcX7XwHNOxzDmFoqm1hJJWNH/?=
	=?us-ascii?Q?atYREDxb9w3r10xYPg/5404OAr7ehgykEYkXNFBXQLYzm8bDnoRRHBU4N6NQ?=
	=?us-ascii?Q?+Ai//An5sLsET2DB1yd59N6WMzFu/3reGSKxMegEdynREnTEfBDptRZYOOXk?=
	=?us-ascii?Q?4o2nWd9/6nhL/pCLEqFTBCio7JryGfAZhMnjmHPeO36R8HImIAh9k/+ceQOB?=
	=?us-ascii?Q?UrgaqqOibAUI1hVXPHTEc3KH9r5flNzjxnssr1Hkt+OM3O+UaWGKOddMRYVp?=
	=?us-ascii?Q?qwuf+PAG/vFI2yRZ1NGpt2jZpmAiglXw+e2EtOaIiMer/qsnlfQqb1kPvEG+?=
	=?us-ascii?Q?q/tbLM8gw2qnOWBLaoct2vWGHDcgnjipWTDN2jn8ZJPbz5HmEo74JIrx2/wc?=
	=?us-ascii?Q?R5UDqN8efthW4o54ozr5WYImKP+xHgRY5S7GwANoJgMDgw6DT2VwR9Bu+oCd?=
	=?us-ascii?Q?ZrwQk3FvCBab//N0GvLH2AOztSEVk2z8I8pdc1CO1NrUbIZXXw3iwyK04qF5?=
	=?us-ascii?Q?B7Pog=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:85WH9sOqGvbg6aRbR+PQR6ByTcIFwdZiJrQYUgFbf8HMMfVFEwwhwR+GGcg1F1Cxwl8rYM9O3/82GGx/U6HqytiOqXM0PMlEydbb2QL7p1AAlWrDoA5yF0j0PsE2lzIPnXPRucxhOw1BnJG18KiDIw==;
	24:QtdN4zxx9tWkzqHM0fyupaSz6enjQAIhJNJ3pk/kMOkMu4MeV9ZO4vTzYKOpRDi58a14XcbZmNB28ivStZmhIIJLBE1oDBzmYIFv8LSnjWQ=;
	20:q90Ml1Ie8fe10a0cka/asUCgMnRJbipb5WVVTcurJOjBTaTDKjjYOsXnZGNq1QPSYPofTrY6hjzof5EsrcFUJg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:50.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 03/11] qt5: improve support for native and nativesdk modules
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
X-List-Received-Date: Mon, 24 Aug 2015 09:29:24 -0000
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
index 8caaad3..36d77db 100644
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
index 9333016..d186705 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -28,3 +28,5 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
 SRCREV = "2fdb6eba0a58b629db32f9eefec2f26df08d3d2e"
+
+BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 1be6853..da2255a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,3 +13,5 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase"
 
 SRCREV = "c21924d67a8ef39282afdf3ae6fef798dfca7135"
+
+BBCLASSEXTEND =+ "native nativesdk"
-- 
1.9.1


