Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0124.outbound.protection.outlook.com [157.56.112.124])
	by mail.openembedded.org (Postfix) with ESMTP id D8043766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:12:05 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	HE1PR02MB1178.eurprd02.prod.outlook.com (10.163.173.148) with Microsoft
	SMTP Server (TLS) id 15.1.318.15; Tue, 10 Nov 2015 08:11:56 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Nov 2015 10:11:40 +0200
Message-ID: <1447143100-12365-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AMSPR04CA0030.eurprd04.prod.outlook.com (10.242.87.148) To
	HE1PR02MB1178.eurprd02.prod.outlook.com (25.163.173.148)
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	2:3GoWTnbkalquw+28jJXnI3h/euHqtIbSKTgF1eJrx5ZlxCayB1w6kPAOKsMoy4VRXCOUhNGhQ2dn8mYu1kAA7phb5kij1aJikVXiWKSgigpifVwuXEpDEcyKVA3zMHRa5VBhV4Bi0c0EI1DNZUPx9Utdub9K3uB5vNzRVNvmnpM=;
	3:MvM4yBEIK1OE0WYXE4yi9nfjxGSsPrRNeiG20BcR33DhEmJB69Px2QeYmp6+/P2Ri7nX0s8L0pesVqZipcgnHq8njxg5xkeSvrlcrTiwsoBLlUdEuEp5BL3cndAkMpVvTj4ytyb2KVcJNnwjxTXyIA==;
	25:hsxhlRWYQQTgcF0/beQHQppLafhljNibmES0WnYaCOclnc2ChynHHoLfe4zfl00b1F3rPyGSeDk8TzuDrTtQLip33RUD0SLb+YUXPkV1KW22jBbsGdW9IDBddsjss89Z0f3o+ip0h+0Uz6lYlJSQfVjallR5NMrWAdYdgxOHJV2/JsRLZ2XLfIdGk91TUbIHL5MdesU/KJKZ+VB/hd+djLVJDFP0S1IljzgRrH/+Rs1h5zXVPW9aRppaSO1DzNin
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1178;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	20:42WgsBbTmTOqKcRH8QcFRuLHT0FBFnDYnRp45LEPvgAFaAStbXKbQPiPJE0hRp6HqATRMxo4kNoCuU7gWtkuse5gI/aCh8oFWvVyd3TKsa0O2iC83yLFJTx2o0GPGHFpO8zNC4+WOKnD3R2Ohj+z7ienUwqW/ZbjbZ2wU2KyhGcGDENiIKWhwtRmveEGjfs9dsiJg2xuxg1XveIo3OM4RwIhX9PWTsat3uVGcDSNSvalnddOADrCJ+SXMljmcQ5YWI1QY84tYl4c+eUO69hK1KgpLSNaaMzAo7zxoAItgZSuVx+9u+fRcRVV3DsZiu1svxDkNIpuYunhDEVHODi/fJAZIaHFh+g5ZpX7W7Cna3KBud+cZ8LB5t74Jn41N1R4Mr64OU92mLoIV3d8iqXuhePtzeoxwiLyDETCKjXAO1wwTNcSolAAszgZeXNM5jSTYhsQc/9tWn5gmKhkxtj1eUuhGP41YIxBjANAPYRH8rfHlsZd3lM9AhBW/Xi/BJwv;
	4:EgrWKu8RlM2gDdXQxxRp6bUJCXZuQrLnuIbyqzaUju1gVuKyaVnffp4rYBALxpR7/Q2tb6RaMjqJgCzG9zvt1VHNMuyb8m/9tIWEJOrCWLi/SFaYxctJbxTm2p8dmy8WYAR5EDyTxnoXv9LP3uFCxePQR37nKM6Kkpl5c64ed3pa1CPjH7OPpHD2nvc5S7xoN3n/jlKuq0r1KhVL86s/NRgDfNtSsHdpugwJla1BAhYhvjzpnQmpeEh48W75SC97/Iy0BImaYO5IQukxrwCIM6GG9xPBWKgxzkvQGrSHjTFzPOTb4XT/GLv4bFhpicm1OCd8qv2pJX5QVN7HzWOAhJE6fvEHUng3pymrtoWStHWD9iEdpVx1CqQ7kiYjGQUS
X-Microsoft-Antispam-PRVS: <HE1PR02MB1178FED4893C46610FA92D1E90140@HE1PR02MB1178.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(10201501046);
	SRVR:HE1PR02MB1178; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1178; 
X-Forefront-PRVS: 07562C22DA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(450100001)(5008740100001)(101416001)(5007970100001)(5004730100002)(87976001)(50986999)(66066001)(105586002)(86362001)(106356001)(92566002)(47776003)(5003940100001)(50226001)(229853001)(42186005)(19580405001)(19580395003)(2351001)(33646002)(36756003)(81156007)(4001430100002)(5001960100002)(107886002)(189998001)(40100003)(97736004)(77096005)(48376002)(50466002)(122386002)(5001920100001)(110136002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1178; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR02MB1178;
	23:UVTaDV4OB4h10mG4xLDmUVz2UMszF+Bsi8aGWOj2a?=
	=?us-ascii?Q?Swcv2dZvouIT4KiGgP+44ZZhQkycfOPYaF9g8rvyWXMkuOJnkcQOVEqOrILR?=
	=?us-ascii?Q?5M2lfnijJLEhmfji/SvRRiG+cufX++Wc4qJUtbca0uWzVD5lqQJFky2ciqne?=
	=?us-ascii?Q?7aXsZhx77qPre0uy4gEvnMgKRX60ncXkpNV/uWn0kU3l3qc6TKXCOQChy0g/?=
	=?us-ascii?Q?SpbadKgicvMtyaZ1X7jzFGb/jM0AviLQXjcga5TlvcbGCte8mOTL0FlgW3ZP?=
	=?us-ascii?Q?ITOPC/iNCuBGsbVg4UteL84hrbgUeuDjKwr8QlSLvk79wMb7BB8hZUh50Qg6?=
	=?us-ascii?Q?Z61WYNVRIkNQ/XmqxzSbXnbYpAkFoB1y6cIp+B0EZC9/FciI+LftCp0ghbB0?=
	=?us-ascii?Q?/vgCacr5/qnyFEoRKew+Hi4tCeGmhBE8Wn2gpHCOXM35vxmhR/g3Ssyp4QoS?=
	=?us-ascii?Q?PQ0HC3/puAsYQwm+U+gZv4o99Vr2aHIIIO4RbyrGxZvD4wm9af6i1vaJIPqv?=
	=?us-ascii?Q?xdGi9tJ90C+5DJk9IsJmd+AQOs0wPZu0C2/W/2ZTReNHIFd51E2sezSpwNYY?=
	=?us-ascii?Q?NX7NEYwhf2NyfzNWnXQbnx0Hf9GhrPykSIVcW60ILZhlWk+I14WMuJwzr54K?=
	=?us-ascii?Q?8Dy8ZY31OGnKLd9GoiQLPCNjMoL0p2PtA8HWj+BRxGN2lD0GzVDPMRfNmPi3?=
	=?us-ascii?Q?p9X475TVg//kzY3dwAD1c6cuZ/6B7Eha2NgWKiTUsz0eMptoVugytpPeL1lU?=
	=?us-ascii?Q?i2znDA3VIXAk7R5pOch8TF21o1bmDtT3EdiAHNEuYa5nS2pkKNSX/H9n3pU5?=
	=?us-ascii?Q?uETm7godUQ2Rm+7EuSIZMLRdDg3HNdJNqZwGEiVjhJtTmNm3/jBqEEXFgBsJ?=
	=?us-ascii?Q?KWklkyEvQHR83HuTWh/hulD2q2U5eGXRkWKkJyENti9x5bV+UBN+2LAVmjUc?=
	=?us-ascii?Q?AuKL7DdMwiITwM/pD/dgdqM1nLbpb0zl87c7Y4Ho9/lygePE6O4QJto8ELwh?=
	=?us-ascii?Q?SIVAq3vPflPPjP1Qp8vVxOLi1qq9+lDNeYBAu212+CzRRyN+zDZ6eewiR6fW?=
	=?us-ascii?Q?5JBwWsDHpRcyPNFgsHS/Nl683tO?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	5:JGlbuOPCHuY3zWLIWgbETQy9GsnbWidG7uxjKyH7JHBJ5Wz9VwZhJL3TM1Taavva1ffu8u6PgqIyH2j7bTDz3L3F7iTf47hHdNRbFUSPSsG1FqPFNbYt6cCxP+m9BcFAWqrrqOa4f+NN+cO8S28ZeA==;
	24:xkAaEKXOVzQzhwHSMd1Lhs/KYe/DLtFCZjUF+P4JPKD0lP0VN6Rxgcp+MpsjLuUFar+B3QmLaQomNWSQ5JsmkF5Ewl1ta3YIo3KXlA99kvY=;
	20:CiYL2la2iM0goPC0Oy0Whgf+mUo5JEhGJ1ecQjzAy1K0CCic5LSAruU6swJNBhQt8/Wv2TV47tMegJN1nRp4Gw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2015 08:11:56.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1178
Subject: [meta-qt5][PATCH] qtwayland: remove unnecessary header install
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
X-List-Received-Date: Tue, 10 Nov 2015 08:12:08 -0000
Content-Type: text/plain

Installation of the generated headers was fixed in qtbase v5.3.2

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 2ea3285..f96a6cd 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -38,12 +38,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-QT_VERSION ?= "5.5.1"
-
-do_install_append() {
-    # do install files created by qtwaylandscanner
-    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/qwayland-server-*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
-    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
-}
-
 SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
-- 
1.9.1


