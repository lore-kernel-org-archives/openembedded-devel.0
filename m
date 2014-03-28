Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe010.messaging.microsoft.com [216.32.180.30])
	by mail.openembedded.org (Postfix) with ESMTP id 63ECF6E951
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 06:03:24 +0000 (UTC)
Received: from mail146-va3-R.bigfish.com (10.7.14.238) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Mar 2014 06:03:23 +0000
Received: from mail146-va3 (localhost [127.0.0.1])	by
	mail146-va3-R.bigfish.com (Postfix) with ESMTP id B27ADE0178	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 06:03:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch21a7h1fc6hzz1de098h177df4h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail146-va3 (localhost.localdomain [127.0.0.1]) by mail146-va3
	(MessageSwitch) id 1395986601398700_10145;
	Fri, 28 Mar 2014 06:03:21 +0000 (UTC)
Received: from VA3EHSMHS018.bigfish.com (unknown [10.7.14.248])	by
	mail146-va3.bigfish.com (Postfix) with ESMTP id 5ABA740239;
	Fri, 28 Mar 2014 06:03:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS018.bigfish.com
	(10.7.99.28) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 28 Mar 2014 06:03:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 28 Mar 2014 06:03:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s2S63FsP019572; Thu, 27 Mar 2014 23:03:17 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Mar 2014 14:03:05 +0800
Message-ID: <1395986585-15248-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] daq: update to 2.0.2
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
X-List-Received-Date: Fri, 28 Mar 2014 06:03:27 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb => daq_2.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb => daq_2.0.2.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
rename to meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index c12ccde..2675e2a 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "libpcap libpcre "
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
             file://disable-run-test-program-while-cross-compiling.patch "
 
-SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
-SRC_URI[sha256sum] = "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
+SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
+SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
 
 inherit autotools
-- 
1.8.3.2



