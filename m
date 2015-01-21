Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0131.outbound.protection.outlook.com [207.46.100.131])
	by mail.openembedded.org (Postfix) with ESMTP id DA08572C42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:23:27 +0000 (UTC)
Received: from BY2PR03CA011.namprd03.prod.outlook.com (10.255.93.28) by
	BN3PR0301MB1185.namprd03.prod.outlook.com (25.160.156.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:27 +0000
Received: from BN1AFFO11FD030.protection.gbl (10.255.93.4) by
	BY2PR03CA011.outlook.office365.com (10.255.93.28) with Microsoft SMTP
	Server (TLS) id 15.1.65.19 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:25 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD030.mail.protection.outlook.com (10.58.52.168) with
	Microsoft SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:24 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8NEev017727; Wed, 21 Jan 2015 01:23:22 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:23:06 +0800
Message-ID: <1421828586-19021-5-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1421828586-19021-1-git-send-email-b28495@freescale.com>
References: <1421828586-19021-1-git-send-email-b28495@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(450100001)(62966003)(77156002)(106466001)(86152002)(87936001)(92566002)(68736005)(77096005)(104016003)(33646002)(110136001)(229853001)(97736003)(230783001)(36756003)(2351001)(105606002)(46102003)(50986999)(48376002)(6806004)(76176999)(19580405001)(50466002)(64706001)(47776003)(19580395003)(2950100001)(50226001)(85426001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1185;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN3PR0301MB1185;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN3PR0301MB1185; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1185; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:23:24.5614 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1185
Subject: [meta-java][PATCH 4/4] README: correct openjdk-6-jre version
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
X-List-Received-Date: Wed, 21 Jan 2015 08:23:28 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 623e7c4..3a02fa2 100644
--- a/README
+++ b/README
@@ -62,7 +62,7 @@ PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 For openjdk6:
 PREFERRED_VERSION_openjdk-6-jre = "6b24-1.11.9"
 or
-PREFERRED_VERSION_openjdk-6-jre = "6b27-1.13.4"
+PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
 PREFERRED_VERSION_icedtea6-native = "1.8.11"
 
 For openjdk7:
-- 
1.9.1


