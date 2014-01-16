Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC02F6B2E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:40:25 +0000 (UTC)
Received: from mail45-tx2-R.bigfish.com (10.9.14.227) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.22; Thu, 16 Jan 2014 03:40:26 +0000
Received: from mail45-tx2 (localhost [127.0.0.1])	by mail45-tx2-R.bigfish.com
	(Postfix) with ESMTP id 32EBA8037B	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:40:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail45-tx2 (localhost.localdomain [127.0.0.1]) by mail45-tx2
	(MessageSwitch) id 1389843624833311_15922;
	Thu, 16 Jan 2014 03:40:24 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.236])	by
	mail45-tx2.bigfish.com (Postfix) with ESMTP id C554F3A0047;
	Thu, 16 Jan 2014 03:40:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 16 Jan 2014 03:40:17 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 16 Jan 2014 03:40:16 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0G3eCRS014939;	Wed, 15 Jan 2014 20:40:14 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2014 11:40:04 +0800
Message-ID: <1389843604-27432-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] python-nose: remove
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
X-List-Received-Date: Thu, 16 Jan 2014 03:40:27 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *This recipe is now back in OE-Core.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
deleted file mode 100644
index 083d052..0000000
--- a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "nose extends the test loading and running features of unittest, \
-making it easier to write, find and run tests."
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
-SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
-
-S = "${WORKDIR}/nose-${PV}"
-
-inherit distutils
-- 
1.8.3.2



