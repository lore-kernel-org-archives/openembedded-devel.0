Return-Path: <B40290@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id D22B7600FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:13:22 +0000 (UTC)
Received: from mail122-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Wed, 10 Jul 2013 03:13:22 +0000
Received: from mail122-ch1 (localhost [127.0.0.1])	by
	mail122-ch1-R.bigfish.com (Postfix) with ESMTP id D0482320217	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:13:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail122-ch1 (localhost.localdomain [127.0.0.1]) by mail122-ch1
	(MessageSwitch) id 1373425936310075_13337;
	Wed, 10 Jul 2013 03:12:16 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.235])	by mail122-ch1.bigfish.com (Postfix) with ESMTP id
	8CBD24A00BF	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:12:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Jul 2013 03:12:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Wed, 10 Jul 2013 03:14:24 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r6A3C7rr025395;	Tue, 9 Jul 2013 20:12:08 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jul 2013 11:12:03 +0800
Message-ID: <1373425923-19558-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-networking][PATCH] licences: Add netperf license
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
X-List-Received-Date: Wed, 10 Jul 2013 03:13:24 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-networking/conf/layer.conf  |    2 +
 meta-networking/licenses/netperf |   43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/licenses/netperf

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index f75080a..14eb048 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -14,3 +14,5 @@ BBFILE_PRIORITY_networking = "5"
 LAYERVERSION_networking = "1"
 
 LAYERDEPENDS_networking = "core"
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-networking/licenses/netperf b/meta-networking/licenses/netperf
new file mode 100644
index 0000000..3f3ceb2
--- /dev/null
+++ b/meta-networking/licenses/netperf
@@ -0,0 +1,43 @@
+
+ 
+              Copyright (C) 1993 Hewlett-Packard Company
+                         ALL RIGHTS RESERVED.
+ 
+  The enclosed software and documentation includes copyrighted works
+  of Hewlett-Packard Co. For as long as you comply with the following
+  limitations, you are hereby authorized to (i) use, reproduce, and
+  modify the software and documentation, and to (ii) distribute the
+  software and documentation, including modifications, for
+  non-commercial purposes only.
+      
+  1.  The enclosed software and documentation is made available at no
+      charge in order to advance the general development of
+      high-performance networking products.
+ 
+  2.  You may not delete any copyright notices contained in the
+      software or documentation. All hard copies, and copies in
+      source code or object code form, of the software or
+      documentation (including modifications) must contain at least
+      one of the copyright notices.
+ 
+  3.  The enclosed software and documentation has not been subjected
+      to testing and quality control and is not a Hewlett-Packard Co.
+      product. At a future time, Hewlett-Packard Co. may or may not
+      offer a version of the software and documentation as a product.
+  
+  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
+      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
+      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
+      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
+      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
+      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
+      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
+      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
+      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+  
+  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
+      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
+      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
+      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
+ 
+
-- 
1.7.5.4



