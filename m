Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0101.outbound.protection.outlook.com [157.55.234.101])
	by mail.openembedded.org (Postfix) with ESMTP id 02B6676A0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:42 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:56 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:57 +0300
Message-ID: <017bae8c6b5f47376a7b02d85211c463a8e4d97b.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:aHINtqHDO6S+owK+vipQdgz/DJ4qWpIfwiE0PZfSAjfmt0hpiXQfOIZFXbwt47TW9jNqo2Fn4/Ng4Cwon6RaOBsm8Fsqv1a74/qrZ1kIiC2/KONABQ1eSGWfRAbaKiA8xxtbnOuq5AFdycp6rNugOQMl+q8Z/b7cKeYBpJleLnU=;
	3:Kl0p1QhwUac2kXWLmtbAxvEFqiv+F7jH4dAJPLULrho+5cpinr14g/ZmcAZSq19IoOl2LdUx8vBoJkTA8JGr5uRS1upt23NbtzJRx+piw66Xo5C5XIywVrphjXn26sD7HcW5R0f6ugLZnWyTiI/v/A==;
	25:vWFIU0XWZgHk68NxNWvGegZ+WFLdJ6g4xH2eBi/OH+DP3Gt9YLkxgX5UKTE0x12BieHD3Sutb6HLCXdL8fm1h3zNWErPulSp4kaybGZnEYAFQH4BpOlx/DUgLOKgdHPd3AtVGWBY1pVGDb+fwg4liJqyz5CXonBaT4dGu5lM8kJhxbnTFPw8TAOj46fn/e9+XBg6J8kw8G07TFi/irZd8edI6RjGWgz8hELkBDx5X+Ea63FMvOGSWH1eAhY3Kg8F
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:8oEttrSFmeH3qSiU40YxzDnZ/Oiz7EQDFGV736Ihc6QPokjle2ldRbI5EOOZ7obftTl9ZbiHrLW/THTBdPY4TIFwJB42ymMtSO/WJTqOYeYsCzddtXGNhizk3Gk0+TGFFpJbUuSfiX4wWvPqDYmXIZhdfVH/tgfLxFAr7sQEd5swqUt6rDx9UoqnUu49U82kP8bzHr1aci3+LG2BHMODU6cfGUEUrdg9I4FO4dxUHG6pmoP/tB0jyr+KJOKWpTc5c1aRYYMATC8G/8I28/eUNr8MleuFo8Nvjfbw1BPn2U+Tx6GZQksmq/WOGsY1t87miCgPukbj1DSGN63rKZACmooCnPoRSanowHtEGgx/cfBHMOdjNmLDuDQqk2BT2LZ7vK66oAm+v48l4YdzUUQJS+Fljxk2iiQ1ACUbar8tGvE6xSpzX7vAQeAltOLAVXtk/Wkf0eEsEdde+45S6HnwJj3nZWrHaWsX23y344MS1xxgSBAGOAoeV7wk3nu95t9b;
	4:lg6CFWmFNUPPizm397Nr54Y51zctfKa22tXIMW8we2V3evahus1HpNVnMcpaWo5UfyRvwk+Ce1j4DPr3gL2XaCzwnM/n0AC215QD3Wk8dxlrBr9Ky9fYWr4XL8IQ0An7J23/MsRHMyqZft8qaDxjMZp4CD4+6DjClyX7INheMMX13O4xSsKKq4R+iOc4woNz8v1CIcqiF09f1kacwW97KY47z0xIJ4ghON6awPEZqRJepkij9AXN3oNldcrbWn9BZp0d3SG5i6uNr6Km22/RYK9p+y4EHO5ghAduNTsnqjxM/LrClcV+nWdo2aJXLzIc
X-Microsoft-Antispam-PRVS: <DB5PR02MB117428D35F4308A4E2EC114890620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:tFut5g8dKz6ckzclTg/tPDGsM0JCNqjYrLppDSRvs?=
	=?us-ascii?Q?euWfC5DOABGJq9rbN73lJWHUdvqpHsOB1+ewxsxf0wctwVIQg0GT5+ryN/sL?=
	=?us-ascii?Q?irjhZaqHeeNe+j/K0y02KhWVvwP8e4WiRKL2ugFxA5z1xKFfubFmsHf2BpK1?=
	=?us-ascii?Q?5Rphjitl9kM5zVbDwfyxVAoLotzG8qZ8vkiggnWrVm7Cf7o/sYsylSOp4z1O?=
	=?us-ascii?Q?BDjJR0To7BVCv8X510jOHuDeGIY5nbvnQHPV6kjev32yX6cUvVCIrbovc3h0?=
	=?us-ascii?Q?5AEJA4mykmiDQeZNJj5zUOWZ3GJ6uaL5qbPvtXAOtORUZ+xAum7ETg55QufZ?=
	=?us-ascii?Q?455deUWdN3ADzPry8ayckbpNZfGUwf6jMaJJ8O563dsrSe4ijNVEUbCyqtmf?=
	=?us-ascii?Q?MFxkb982rCYujE4MafpyOKmdxocMx4U7SVO3gHisc31UD21m0IgEQ2EH19ES?=
	=?us-ascii?Q?boAXZutPeDevszxIb+B+Nlhqw9EZHH4mkV40DkawInnHnetLnZlo7x277Eya?=
	=?us-ascii?Q?wfoB2uN8NHpi64Dr981s6Sa1EFq4QhAnMP7SaU9nDcO31lXG2ekvbaQfUd2F?=
	=?us-ascii?Q?uFJZl2DsL+CSkrOMrDT2ernAJDy7XbumlyCw5ZqALJ5h4BBVixJrt6DwYYTI?=
	=?us-ascii?Q?aG0ti8Bq0/IOa/IemjWMMe3HRui4kdvaGDiZtUjndt3XkFi3Bkl/UjW4BIFs?=
	=?us-ascii?Q?aJpGLDNdlRbGgdF9zp0A0OMJdTHfsCncA6biCSjmq1UPz6/Z1ywBmrBJ6O3T?=
	=?us-ascii?Q?UOPSjuUblVqguc8AuxRRTeknj+3oyT+HIeIkN3DFBFKRlF6DEy/NJqfDvvJK?=
	=?us-ascii?Q?v5LFI5G2KZH5XjuvasBA1PZAzSNY/AvFA+xjcAwcIaboR2YdtlZyGBwbhEWz?=
	=?us-ascii?Q?W0ESOZ1LE56Q+tz/ZLoI0Z9jpLF1o5pcg65taLD5iylVT8au9W/f4sqwW2dw?=
	=?us-ascii?Q?6X5ArMJPgEOc26zGOCBw6sxPZeRUbKbTdoZtWVizM/GegD3f+CqBEUIS+tbl?=
	=?us-ascii?Q?eRDkiQFUH0RmKtP52aMOPSG9hq9h1vpw2zni3bftmDLPT0g9DZiu/zSSyhj7?=
	=?us-ascii?Q?cmlXPg78wqmkjy9R5rRH0kHQ4+Jj2Zx1OzsY6/lwM35MyMDdtNyL41LVicCi?=
	=?us-ascii?Q?/rdnpKtwfSAm8mz3oVUgCgj267/FIYdebb3Ln7+2+f5NbcthV5WMGp+rZQoR?=
	=?us-ascii?Q?vUuUazzhBhfg3uefOBXLckixRXY8SidAjTfkO5+XZpcSHpXOvqNFe3hgtLZB?=
	=?us-ascii?Q?4qSvpH6PxsgCUHsdjGBW/3dsaFtrUy5zFOE2FUH4aBzL0QKKXPGUWznC2yNg?=
	=?us-ascii?Q?8UTBA5MzQPPNNOXLAyYaD0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:+5gZNFIIKWT+O8X5o3d8EJx/RNKTnDkxruytTABEzckvp+WdBEiuxdrYzdWvlTl/roUVqGPy0gBF1TLh7d17eVVmN8tK/W+vvwF9JOpQkwkpaZdPnizFxTmfYvLytBMRq/TZaxJQZmz2ZNVIyiQG0g==;
	24:+MOyJ0452NiQ4Dm0/Q3e7lV4vgdsOSng8Rx+CN9hdLt+xaQk+wcjkB0fS/smVIHxiiilz7Cvlhtm6/iwo5Bnj9b1yBkIbfagHaGP1fUPoiA=;
	20:sT4/3g7/9sWfEQJ7ofaHImNp7UWHYLoK7/kvs4xzdfQ46sfXxo208kpoub8LhQ4l1SJV1WEGK7OhmQReOiHrTg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:56.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 11/11] qtwebengine: fix problem with recursive qmake call
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
X-List-Received-Date: Mon, 24 Aug 2015 09:28:43 -0000
Content-Type: text/plain

On RaspberryPi, the EGL include paths were not included in the generated
ninja build files, because the pro files were run in wrong order. Fix the
order, but remove compiler overrides, as they would break the build again.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 .../0005-Generate-usable-qmake_extras.gypi.patch   | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch

diff --git a/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch b/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch
new file mode 100644
index 0000000..89f56e0
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch
@@ -0,0 +1,71 @@
+From 9d2fafdd9a15adf51d8383bdd545d73e76ad0428 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@theqtcompany.com>
+Date: Mon, 11 May 2015 13:47:06 +0300
+Subject: [PATCH] Generate usable qmake_extras.gypi
+
+Running qmake recursively does not take .depends into account, so
+the SUBDIRS need to be in correct order so that qmake_extras.gypi
+is used for the ninja files. Do no try to write compiler tools as
+it will break the build.
+
+Task-number: QTBUG-45706
+Upstream-Status: Pending
+---
+ src/core/core.pro                 | 7 ++++---
+ src/core/gyp_configure_host.pro   | 3 ---
+ src/core/gyp_configure_target.pro | 3 ---
+ 3 files changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/src/core/core.pro b/src/core/core.pro
+index cf00f39..747b711 100644
+--- a/src/core/core.pro
++++ b/src/core/core.pro
+@@ -12,9 +12,7 @@ gyp_run.depends = core_gyp_generator
+ core_module.file = core_module.pro
+ core_module.depends = gyp_run
+ 
+-SUBDIRS += core_gyp_generator \
+-           gyp_run \
+-           core_module
++SUBDIRS += core_gyp_generator
+ 
+ !win32 {
+     # gyp_configure_host.pro and gyp_configure_target.pro are phony pro files that
+@@ -28,3 +26,6 @@ SUBDIRS += core_gyp_generator \
+     gyp_run.depends += gyp_configure_host gyp_configure_target
+     SUBDIRS += gyp_configure_host gyp_configure_target
+ }
++
++SUBDIRS += gyp_run \
++           core_module
+diff --git a/src/core/gyp_configure_host.pro b/src/core/gyp_configure_host.pro
+index 3eb6738..d6820c4 100644
+--- a/src/core/gyp_configure_host.pro
++++ b/src/core/gyp_configure_host.pro
+@@ -6,9 +6,6 @@ option(host_build)
+ 
+ GYPI_CONTENTS = "{" \
+                 "  'make_global_settings': [" \
+-                "    ['CC.host', '$$which($$QMAKE_CC)']," \
+-                "    ['CXX.host', '$$which($$QMAKE_CXX)']," \
+-                "    ['LD.host', '$$which($$QMAKE_LINK)'],"
+ 
+ GYPI_FILE = $$absolute_path('qmake_extras.gypi')
+ !build_pass {
+diff --git a/src/core/gyp_configure_target.pro b/src/core/gyp_configure_target.pro
+index 4d52044..f02bfa0 100644
+--- a/src/core/gyp_configure_target.pro
++++ b/src/core/gyp_configure_target.pro
+@@ -3,9 +3,6 @@ TEMPLATE = aux
+ 
+ TOOLCHAIN_INCLUDES = $${QMAKE_INCDIR_EGL} $${INCLUDEPATH} $${QMAKE_INCDIR}
+ 
+-GYPI_CONTENTS += "    ['CC', '$$which($$QMAKE_CC)']," \
+-                 "    ['CXX', '$$which($$QMAKE_CXX)']," \
+-                 "    ['LD', '$$which($$QMAKE_LINK)'],"
+ GYPI_CONTENTS += "  ]," \
+                  "  'target_defaults': {" \
+                  "    'target_conditions': [" \
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 3bd75af..659fb56 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -80,6 +80,7 @@ SRC_URI += " \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
+    file://0005-Generate-usable-qmake_extras.gypi.patch \
 "
 SRCREV_qtwebengine = "55a7fc7651136510032166ff24eb5e7e49635145"
 SRCREV_chromium = "140893bef70011645c686f5fabe45018dd2e392a"
-- 
1.9.1


