Return-Path: <B40290@freescale.com>
X-Greylist: delayed 951 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Apr 2015 03:28:13 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0133.outbound.protection.outlook.com [207.46.100.133])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9A2727E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:28:13 +0000 (UTC)
Received: from BLUPR0301CA0026.namprd03.prod.outlook.com (25.162.113.164) by
	BY2PR03MB443.namprd03.prod.outlook.com (10.141.141.152) with Microsoft
	SMTP Server (TLS) id 15.1.148.15; Tue, 28 Apr 2015 03:12:21 +0000
Received: from BY2FFO11FD047.protection.gbl (2a01:111:f400:7c0c::161) by
	BLUPR0301CA0026.outlook.office365.com (2a01:111:e400:5259::36) with
	Microsoft SMTP Server (TLS) id 15.1.130.23 via Frontend Transport;
	Tue, 28 Apr 2015 03:12:20 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD047.mail.protection.outlook.com (10.1.15.175) with Microsoft
	SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Tue, 28 Apr 2015 03:12:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3S3CGu4018702;
	Mon, 27 Apr 2015 20:12:17 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:12:12 +0800
Message-ID: <1430190732-31890-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(104016003)(15975445007)(106466001)(19580405001)(50226001)(229853001)(16601075003)(77156002)(36756003)(450100001)(77096005)(62966003)(92566002)(33646002)(105606002)(19580395003)(87936001)(110136001)(2351001)(85426001)(50466002)(50986999)(86152002)(48376002)(6806004)(86362001)(46102003)(47776003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB443;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
X-Microsoft-Antispam-PRVS: <BY2PR03MB4434A900CD26DE659106FAC84E80@BY2PR03MB443.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006)(3002001); SRVR:BY2PR03MB443;
	BCL:0; PCL:0; RULEID:; SRVR:BY2PR03MB443; 
X-Forefront-PRVS: 0560A2214D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2015 03:12:19.8589 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB443
Subject: [meta-networking][PATCH ] netcat-openbsd: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 28 Apr 2015 03:28:14 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 4237dc4..12409d4 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -2,6 +2,7 @@ require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
 
 DEPENDS += "glib-2.0 libbsd"
 
-- 
1.9.2


