Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0127.outbound.protection.outlook.com [157.55.234.127])
	by mail.openembedded.org (Postfix) with ESMTP id 946F7769A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 06:57:47 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1171.eurprd02.prod.outlook.com (10.163.183.149) with Microsoft
	SMTP Server (TLS) id 15.1.262.15; Thu, 10 Sep 2015 06:57:45 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Sep 2015 09:57:26 +0300
Message-ID: <1441868246-3987-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR02CA0032.eurprd02.prod.outlook.com (25.160.28.170) To
	AM3PR02MB1171.eurprd02.prod.outlook.com (25.163.183.149)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	2:5CwNjPM3VBBuWLS466VL1QqZ1a1Gx3UOLZBHIeuw+B3L3JPTtTLp049lC7CKliCzAtP8aonxF3YrWhGfO9fL1BsT5DuVDpJ6FGXS36+clyATQd+ZLO2Lls6Sw3BQ3VAEyFqg88p/khJCXsEO3T41zG18XXVGl4sF1E2zwDMByxU=;
	3:G0Wkwxj+eQgEGVKIjM61lVlGUhRgaPyjQ/OTYAuxo4ksNF90UtZ5V/v7n6ieU8qSKMpwuPcoAGJXVe3JKB9GaiXzPDShrKc3L1MmLu2wHFqF1TKZXnnzPtbhEHH11NhI9TX0JWi/Z1BuEYxj45Cluw==;
	25:SuDMl+KDteLhdvVfx/k+TzzUq13yXBeCbJ7Bety/b0mbcYmRpAzzeUixM0qTuPl69hO0VA20x0yfju2EYWBOuhev85DyzWhhE7/0sXrjmtyOFshaRrPN8+gJzj3LwTSfcaX4W5H0Hwxl1bRkUqM4WMz6ruU6LiF7YohXOtYMJ5f8B43kViWrO89NpucBOMek1UjOsrQMByakK+iiqaOUlGVyXmh/dwPXqzFl9vbSavhFtsDuJAwWoEVPjz7QivGgLrFTsy2TGCTq57jSmZERbQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1171;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	20:UOnJAL9PTPlJBN9unKnEka7ySNOHPJG9pfhz+MgrqAEj9oUqougdobx1qBjzPytEaa9fIvJlKIzqWVdtRVD2tq7lHtE8oauiIP5zcGjpRj9bUbr+7+BLHcMmbZt43IuTBtgE6EJ0w6RtG6zQU+N7eawIkUodVelMOowpvIkRJ0hhS4hfuHqODxRXn1qc1QlGsmaJIomXt7Lq6R2Py/FPLhPDJuM8uX3Jres3MmhKvnf5hGe/PbeWcpIqPu04UZzMbA2iid9HuyQknSMbI6Ldk49RlwEyA1WhSRkzJl5lTNgIa1zsVk3j6/CRgps+9yttIeSRRhWp27zuQM2W7F8AlKk5IC0VZ8rRqDZN9977Mku45ppqTNEZSJqF9ahlkutRJQa4raT9ADHcrVeI1MrK17WUOUcBtzHU/LzebsZr65eaM1fMxmHOTV66Nn5a+LnFaFsUStEFUPnEaQqiSfg5EGge9SNJdr25Ou2gPagclYmCE7rcVN2R4ErWSHJaFrqb;
	4:mG/peek0jxzFEM3ki4eMORYcc0LKGx3zyFV9wVP7FNGjh7GZ3dmLgbmwYTEyHl1ERVOGiAxMe3VuICfi6J9NRnvuih+XziPryr6FgfidrqMGgUQVAqitOxaIEWrZGgLwoPu4BFOklCR7ssfpjtS0aoIs5qvC5CeI6PTv3SjN0PB/hpKQruLVYSz29L5gX8/zfMOGBxu32c1FeEIN1sEUrGXsGrWFWqNuXHP0WczHECSI7rh8SG+4fnFEHjyKIETk+XMNXhVtYchf0hRrwbwvNgjq1MKvh+L6/sFTfaQqH2U43tBItTARPMu0Kory5m8T
X-Microsoft-Antispam-PRVS: <AM3PR02MB1171AFDC47A9B6E2CD64BB8590510@AM3PR02MB1171.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:AM3PR02MB1171; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1171; 
X-Forefront-PRVS: 06952FC175
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(110136002)(66066001)(105586002)(81156007)(42186005)(107886002)(47776003)(5007970100001)(50986999)(36756003)(46102003)(106356001)(33646002)(4001540100001)(5001860100001)(2351001)(229853001)(77096005)(86362001)(189998001)(87976001)(64706001)(40100003)(50226001)(5004730100002)(5001830100001)(5003940100001)(50466002)(97736004)(5001960100002)(19580395003)(68736005)(101416001)(122386002)(62966003)(48376002)(77156002)(450100001)(92566002)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1171; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1171;
	23:kXWXbnolMxHZDSbApJjVYjpzFl9hEUfE8tbEV91+H?=
	=?us-ascii?Q?L7X3VquPE0PFEMaXnucpgddGxpispTQJzToghU3dXvyEKL5Q7bcrNvRWrepe?=
	=?us-ascii?Q?yUjd/WafNSRqYhdCM/aPLfKX46zb6qDSlVpISV2CcfuPOkvJrsW9pKz60/LY?=
	=?us-ascii?Q?7BJv2ktZP5092P1DB/d/085Z0MjWkER9Tly4wB6eILnXcEtSowCKCT1dyMq6?=
	=?us-ascii?Q?dAfp6nIT1ORMN7Aim8Ju3dYhyfM0nTLtmiBoLh9fVfsJ/RUMB9iQew1cCs/s?=
	=?us-ascii?Q?JZ0Kcctmk+TDSDTlvsUyyTgdI0GC7mY3QHHWEkx7AHZJSk0G6vIvPBmxUmH0?=
	=?us-ascii?Q?cRV6JyYOGXF27ujev6tEuulQxZZsdJyEsXHy6KepF95Jqjzjw1ecQOA8du4v?=
	=?us-ascii?Q?vrPhNaD/PCMTAiJk3/VFCpJMcVyJps0VZoVCuRsPDWwwXfxuw2EVtxogTGFX?=
	=?us-ascii?Q?VjsiPnfc7nKIncuwF0nXk6gRi+u3tZ7DsGOAuxHSZeM3iaith22pHXUmGE4M?=
	=?us-ascii?Q?oos3fcRChsLT521F0S4FfnCXGDjTOSQBysyeH4f00p5vb6YY62/az58hmVV/?=
	=?us-ascii?Q?XvR4LVnhkIQ4AegkONjLYtHrJofna8kU5sHHR4FnbiwY0QwoECrSArcHP+ZQ?=
	=?us-ascii?Q?gGGwz9fDKSr7x3woeiLQ/kR62nDVyefQ9HV6pS7Ki7G1S0KxnSm7Gn0qY6X5?=
	=?us-ascii?Q?6hDq+JA6mE2m/lw8QEjIUMF8iDr7tEIXOfYkOQk6phE7ZIqVvCfFHRXZRJ3V?=
	=?us-ascii?Q?y4jeRbStAospROWzXZKxixyx7VsdataCjTnZ2/RQwuDBFN8DnI0uBSBLgK0A?=
	=?us-ascii?Q?+c7D1NZrHLbP7ejJV8U6uZYwUEanr9Hdp8xdJKkV1+h+cVR1SQzrildWJqLg?=
	=?us-ascii?Q?NhqjItheIQG7l8nD2pVABcE2VUC8TndJoHdVebpp5AYjCCzoP/AhVTCeA3IZ?=
	=?us-ascii?Q?BPbbuJ/wS9FPK8noP6cYPWldPopDaQ2lV/X2Yx1YBocekqyNskJjWLWohj9l?=
	=?us-ascii?Q?yYkhU8gbUD6npiOvuK6Dltln35kju8HvP1PCmtpoyWSUZVVDXSeN694cgXm8?=
	=?us-ascii?Q?EQNrwG4j8MfVpnbb23TAOW79dhnbGVGmu26Nauy2vpn5IVIRKHHa0zPBXzGk?=
	=?us-ascii?Q?76jsIf412XG+iZoSy0fae3deYefLzqM4lv+zClC41OMbI6RejC8sesiRfphz?=
	=?us-ascii?Q?W4PrWOy4G1Qk7nuMzm9pCNLM75ubHXKsKm8?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	5:1o+bXDvisLCaoM+IXfA/SwrmOLPzEcVobR5ByDZrSg5GdKdqh1zPLcc+uptr59mX5urVuKxCEf5+N667zQnTFwYJo88ALd/GusSf1lWr33iw2b42F39UjGyJ4bjKu5W2SEpET2K3BWvHwkLd154/Uw==;
	24:u3MesQEZew70aYMNFEoyQMzCV1sjDCDmXsgOBtJc2zpa0+kzzFul2FbZffkiBd1JpvFhBU9bAlLN3XEJfZrDlbMVxKRBqCI0OfnTMMODnZo=;
	20:As/+kOX1EqtX437So/ET3GQj2jaB2G0L9PHRO7L3bEDvAQ8eNoPEDhVkpqa70KHGNlrWgxyblLPzCU5CKHb27A==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2015 06:57:45.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1171
Subject: [meta-qt5][PATCH v2] qt5: package Qt Quick Designer files separately
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
X-List-Received-Date: Thu, 10 Sep 2015 06:57:51 -0000
Content-Type: text/plain

Some modules (at least Qt Quick Controls and Qt Canvas 3d) have extra
files for Qt Quick Designer integration, which are not needed in the image.
Create new ${PN}-qmldesigner package that includes those files instead of
${PN}-qmlplugins.

Modify qtwebkit recipe so that it removes the conflicting {PN}-examples*
packages, instead of redefining all packages again.
---
 recipes-qt/qt5/qt5.inc         | 8 +++++++-
 recipes-qt/qt5/qtwebkit_git.bb | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 4c58ad6..17d8fd7 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -45,7 +45,7 @@ INSANE_SKIP_${PN}-examples += "libdir"
 INSANE_SKIP_${PN}-examples-dbg += "libdir"
 INSANE_SKIP_${PN}-examples-dev += "libdir"
 
-PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
+PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmldesigner ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
@@ -58,6 +58,7 @@ RRECOMMENDS_${PN}_class-target = " \
 RRECOMMENDS_${PN}-dev = " \
     ${PN} \
     ${PN}-mkspecs \
+    ${PN}-qmldesigner \
     "
 
 RRECOMMENDS_${PN}-dbg = " \
@@ -85,6 +86,11 @@ FILES_${PN}-plugins-dbg = " \
 "
 
 # extra packages
+FILES_${PN}-qmldesigner += " \
+    ${OE_QMAKE_PATH_QML}/*/designer \
+    ${OE_QMAKE_PATH_QML}/*/*/designer \
+"
+
 # qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
 FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 74f98a7..d80ab7f 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -55,8 +55,8 @@ do_configure_prepend() {
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
 EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
 
-# remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc, because it conflicts with ${PN} from separate webkit-examples recipe
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
+# remove default ${PN}-examples* set in qt5.inc, because they conflicts with ${PN} from separate webkit-examples recipe
+PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples"
 
 # make sure rb files are used from sysroot, not from host
 # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-- 
1.9.1


