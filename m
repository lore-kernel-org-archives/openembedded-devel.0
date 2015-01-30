Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 860 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Jan 2015 08:35:09 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0111.outbound.protection.outlook.com [157.56.110.111])
	by mail.openembedded.org (Postfix) with ESMTP id A24EB6076E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 08:35:09 +0000 (UTC)
Received: from BY2PR03CA064.namprd03.prod.outlook.com (10.141.249.37) by
	DM2PR0301MB1200.namprd03.prod.outlook.com (25.160.217.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.65.19; Fri, 30 Jan 2015 08:20:50 +0000
Received: from BL2FFO11OLC003.protection.gbl (2a01:111:f400:7c09::166) by
	BY2PR03CA064.outlook.office365.com (2a01:111:e400:2c5d::37) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.20 via Frontend Transport; Fri, 30 Jan 2015
	08:20:49 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC003.mail.protection.outlook.com (10.173.161.187) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport; Fri, 30 Jan 2015
	08:20:48 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0U8KjBK011221;
	Fri, 30 Jan 2015 01:20:46 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Jan 2015 16:20:44 +0800
Message-ID: <1422606045-7713-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(50466002)(48376002)(106466001)(87936001)(92566002)(77156002)(77096005)(62966003)(36756003)(15975445007)(104016003)(33646002)(110136001)(50986999)(86152002)(2351001)(47776003)(229853001)(50226001)(6806004)(19580405001)(575784001)(86362001)(19580395003)(46102003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1200;
	H:az84smr01.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=freescale.com; 
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:DM2PR0301MB1200;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DM2PR0301MB1200; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1200; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 08:20:48.9583 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1200
Subject: [meta-oe][PATCH 1/2] python-pip: correct license to GPLv2+
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
X-List-Received-Date: Fri, 30 Jan 2015 08:35:12 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

WARNING: python-pip: No generic license file exists for: GPL in any provider

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta-python/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
index d1a7c8b..87493f5 100644
--- a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
-LICENSE = "MIT & GPL"
+LICENSE = "MIT & GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
-- 
1.9.1


