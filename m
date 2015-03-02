Return-Path: <Andy.Nichols@theqtcompany.com>
X-Greylist: delayed 892 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2015 15:46:05 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0118.outbound.protection.outlook.com [157.55.234.118])
	by mail.openembedded.org (Postfix) with ESMTP id D2C9B73864
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 15:46:05 +0000 (UTC)
Received: from localhost.localdomain (91.237.34.118) by
	AM2PR02MB0595.eurprd02.prod.outlook.com (25.160.57.23) with Microsoft
	SMTP Server (TLS) id 15.1.99.14; Mon, 2 Mar 2015 15:31:12 +0000
From: Andy Nichols <andy.nichols@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Mar 2015 16:30:28 +0100
Message-ID: <1425310228-14311-1-git-send-email-andy.nichols@theqtcompany.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
X-Originating-IP: [91.237.34.118]
X-ClientProxiedBy: AM3PR01CA024.eurprd01.prod.exchangelabs.com (10.141.191.14)
	To AM2PR02MB0595.eurprd02.prod.outlook.com (25.160.57.23)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR02MB0595;
X-Microsoft-Antispam-PRVS: <AM2PR02MB05951037AB4512983B526866CD100@AM2PR02MB0595.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004)(5005006);
	SRVR:AM2PR02MB0595; BCL:0; PCL:0; RULEID:; SRVR:AM2PR02MB0595; 
X-Forefront-PRVS: 0503FF9A3E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6069001)(50986999)(46102003)(47776003)(50466002)(48376002)(33646002)(86362001)(575784001)(66066001)(92566002)(40100003)(19580405001)(122386002)(2351001)(19580395003)(36756003)(42186005)(229853001)(77156002)(110136001)(62966003)(50226001)(450100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR02MB0595;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2015 15:31:12.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR02MB0595
Subject: [meta-qt5][PATCH] qtwebengine: change license to LGPL-3.0
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
X-List-Received-Date: Mon, 02 Mar 2015 15:46:06 -0000
Content-Type: text/plain

The opensource license for qtwebegine as of Qt 5.4.0-beta
has been changed to only be available under LGPL-3.0. The
checksum for this license is already for the LGPL-3.0 version
so no need to update.

Signed-off-by: Andy Nichols <andy.nichols@theqtcompany.com>
---
 recipes-qt/qt5/qtwebengine.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index a9c7005..29c31ef 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -1,5 +1,5 @@
 SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
-LICENSE = "LGPL-2.1 & BSD"
+LICENSE = "LGPL-3.0 & BSD"
 LIC_FILES_CHKSUM = " \
   file://src/core/browser_context_qt.cpp;md5=91895ac1852e1b07202d9716194e8dd8;beginline=1;endline=35 \
   file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-- 
2.3.1


