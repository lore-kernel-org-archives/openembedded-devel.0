Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0101.outbound.protection.outlook.com [157.55.234.101])
	by mail.openembedded.org (Postfix) with ESMTP id C25DA76A0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:43 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:53 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:53 +0300
Message-ID: <805439ad0b3909810c1eb60a9d9b568062e160d4.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:Zn408IB1BceKnL76GVfgXBIjCOgXo9H6zGL533SoMBKK+K3xVF8BJzrEp7UWfGOMyvLcXZIWQXcS90VNZXCvI2QLchHNKjQeZD2urjLG9970NLmYv1yvNDwEVelD+w/NUOoqjSb0HG4pPbBB5ZfMRH8RWVZnfyWnmKUi6ysWUHY=;
	3:RsUuKa2sB1f0HcAFu7Uw1xf4UOpSQ2cNrwTXH5uGtVV5XXQQ2Eg0nCj3ApI2gm8hqx38vmly90S7D98lITtbqN6jU5z7Ar0ZoTH5Vita58OcYx6yZu67slIUhRUYeM06slnXozY9Pa0UMeLoj5rYXg==;
	25:lWGhlQiSNtyv+tw+Irhp2u/EnSUWzUN5n3li+W1LBSn9SyekkKBl4n98Xin54mxnUu6X0palp6ybZw+VTKPfe59qrn/gx8bxbLi4bWCw5jxpaIe0HY331H2BcVGzrGRrn9B6ZgLlhKTWXi15YYwo/pu0Vzw/jjNFjyQFlqgtDi8X/ijeY5WixidsgVlaIqtsWTrz7FLMIPKreUxS99ySeak3Mn2NiA5VGPGcPOIinsIoJnnYwkz0Xd5WJ4wFM6TwWH23yTsbQdkPkpzqS0QD2Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:wkBGKpuYH16IapDVn6V32PXWfFM0D5nMiPFbOXVtuZJyDaUJMsVOGITL1H7TUf7PT9XPiNYemazjYEqlkGEbaYE9HZcTngvR8HutmPpU0HSt3LNVOum/Oe31toE7ForYG6bArQDanuRcB4oDt2uTHv5/AnHBkT7bATEhO00X5IITfiScnzJd4V6lfTsjUjuVvOxymj7ZUwQR8/JW4L4fITKe7fK7s0Pmau+A1vgR3QFQWtS9lhWfPX0wWRg4a/qVh/jGICJIMBZz/0Lf9MMeyISLIGAgxPaU4NxKZgcDxlv6PjFlzzbnSy/Ua9AqArm3EiZ8Jt5QKE9uZ+r5cnwWMHuHqxEwd4a6NVfX+g0okwgQAXuEFLHuCs5NXdC5JjdMgVNQeVqupEkzhWhzifL1AlhK4/GagWskNZ0GLPXOfZpsZly62sPQrjww65G15Z17P9cJM3PZGivEmcRK9L78jYVG6x4QjkoSTsQh1LH8hmmmMiF/CgT95OxmbroxZoLw;
	4:EbTbY2u3Vjasc3RojhRdfOR4wPSUBX/I8YlT1vDrmjnVvYDJxsELP5PuntPVbweImEnck38j8aMEsE3dX0NRT2MghA8xcFsIccZwCFYctA2OlXcu1TkTKsdj2AJDv+qcmZPuz3B1K6Qybp4C12DXW1Ri2KMZ2j/gRCQNCM/cXo6Db76BDn25EE56Zn3oh7S1p2P9e4M6YyTraiSFGwnDw6nRqD6DftE+WnNRnBBFBbCBsMsy/o3BDp9/fnMrZnCWdvX1bD+WIfAOGuJ1nZV/cYcuEGIesAdBn02ZmhYjQ9rk2bJDV9DlVYQOO6djSm6P
X-Microsoft-Antispam-PRVS: <DB5PR02MB11746AF64735D17C001A417F90620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(575784001)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:CLKxe9yKyHO2sp5lnyUcV9zaYr/ZEKfhkKoERmv2u?=
	=?us-ascii?Q?Oiu0zjVp4ECd56i5euF/8R7RB7NdbqIibVeug1OEzMotcx37315R3Du/UbxL?=
	=?us-ascii?Q?NLCBIvU7pEy2nLTwwjmGXYd5Z/6BExT+BfsnOTqqjw+g2OAWMMQX1ErD18Ii?=
	=?us-ascii?Q?z8hwtjw5SM7UmlpCPEMVitR1KWAp3dK2w3ayhROBHkgp0LkSt9EcoC2vTDcr?=
	=?us-ascii?Q?9ooRIKomzAsgyfNBOeDT3nlk+jEn4H18QrKMqeWg1VbsET7bbjkbkKIHEa8W?=
	=?us-ascii?Q?ay4rputtoWV6qfdKaSjN5LeaMTAgkX3pSpM9059+FKp7HARLxtx+zm7TR9j7?=
	=?us-ascii?Q?iG/cqImswa31yBkc8eb3lBjAX6RibKa+387nK6lXBBmoDedXxh93GZIyY8vg?=
	=?us-ascii?Q?lJOPPXCHNSffdTQYUP08qXxpfd4361djn33EyW/tTj5yiK1ICTZRVD2Jxg1p?=
	=?us-ascii?Q?48NAW7lS9IPRoWy6yGY+DlAk7vf35Gg2gaz9m4t4fJzos53n1PGXqujkMu47?=
	=?us-ascii?Q?+CN+0QBgoZ3YxXnimZyngDJrMAFORlzc3WtZzTLbK8B5mZT+LHlb4Zb6y8fc?=
	=?us-ascii?Q?MpGBzljQFcNCJNmL73YcC5jnAyWJPfqNM3RW+U4WaDxR1nTWC/Aw/w3ta8gs?=
	=?us-ascii?Q?uZ34uKAF3tAb/Yi0p2lmE6tG21eZRML4BLMeKZsi/gjZ0l8Z8YUqzkQjOO2N?=
	=?us-ascii?Q?Ba8l+vOlKpClUWIShhmaWgylQLSgnMA5UazCNcQzxn8sc+yiFYdgZ5xx+7qM?=
	=?us-ascii?Q?rzpy7yuGHPVmklC4cpofotAmDv/tOzGoJ7KgZYd4+GuV0oYJ2F6OtmsYEM2W?=
	=?us-ascii?Q?1sv54g4hFC3tFRPDv8TKiHnwo6FMssb4qoaHYhGQLu33SyG5v2/B+qlshunp?=
	=?us-ascii?Q?U8v2221436xiMUkGp1XkDzJUFScLZVVMIRt6pQNRR/ujlrL+29p+7a3qzbqq?=
	=?us-ascii?Q?GrfwKgly28X8KFCeGp+pTd/2Q4QzSarlRuTu/fa6R9XaeUea4foNNGhvHvTH?=
	=?us-ascii?Q?giISgyW9UMMn6W5p4Z1FfhElj/8lWFw5eCvIxs1m4HXUo7+thWsLZ+WK7d6n?=
	=?us-ascii?Q?UOSv1SoQ43sVnXDQQas2tmvyMnBasBTpbuT3GsaAL5Y65ruiXR608jNn65ft?=
	=?us-ascii?Q?65xtBl1NOSyTFxQBkTwmWGoCtkTxbbbamo1gGEmjGi8eWJSDKxkHdcb/NY/R?=
	=?us-ascii?Q?1jRl3UOIQRdOQyTDy30nkMaeLNDGwlsSlqFP4mQeCHzrJFgMLqXt6Q/9Ew8d?=
	=?us-ascii?Q?vK87wVny1Tq6e2mDMZHgUG/JYXX9zrhQxLxD2p8VtYgAzYX0T7l6I/gx5pVO?=
	=?us-ascii?Q?YVKTXGVt+OfjXl9vrqYRva44Vm1ZqQ70IRRzHzaPKp8Z/Kzm3VgE6d6WYZU4?=
	=?us-ascii?Q?U9zklu9aaaxFnH7HA7k4kMAjTI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:8+2okFv2ttipooJJiwblwZjeFs9YdgyC2P0+tzNphTbIjtleDlO1Nz05uHHXWsW50wWES6tQU8xiaQYGtO+cvxtLlc6b+kedL3rzLmj4IXuyvN/VEVyIuMEIs8pAJusg6m3io4BGFFRkMhn0Zd3qvA==;
	24:GlZjaHbL6RdcjK6p0fXDu46jy/s1qOnJJ8fWBtGYFfi1XXwIWGKJ+5t5DjspS6X6ZypMRnSOshHfqvBcxxCkkzshQvFRjRQ2r5NLyu5Y1BM=;
	20:nOvDybeGQ/JvaKz+RYWC/H4LKO2pQoh33Z2MGH7PI5q8aMifiKaCnYVk+NNm3RdJ53871DstBZIXAH4ZC+Rdew==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:53.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 07/11] qttools: use one recipe for all compilations
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
X-List-Received-Date: Mon, 24 Aug 2015 09:28:44 -0000
Content-Type: text/plain

Instead of separate recipes for target, native and nativesdk, use
one recipe with BBCLASSEXTEND in place.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/nativesdk-qttools_git.bb | 45 ---------------------------------
 recipes-qt/qt5/qttools-native_git.bb    | 26 -------------------
 recipes-qt/qt5/qttools_git.bb           |  9 ++++++-
 3 files changed, 8 insertions(+), 72 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_git.bb

diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
deleted file mode 100644
index 73e5d22..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
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
-# it's already included with newer oe-core, but include it here for dylan
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
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
-SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
deleted file mode 100644
index 13e1b79..0000000
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DEPENDS = "qtbase-native"
-
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-QT_MODULE = "qttools"
-
-require qt5-native.inc
-require qt5-git.inc
-
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
-
-SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index e27d6ef..51690ac 100644
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
@@ -24,4 +26,9 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
+EXTRA_QMAKEVARS_PRE_class-native += "CONFIG+=linguistonly"
+EXTRA_QMAKEVARS_PRE_class-nativesdk += "CONFIG+=linguistonly"
+
 SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


