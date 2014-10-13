Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S23.hotmail.com (blu004-omc4s23.hotmail.com
	[65.55.111.162])
	by mail.openembedded.org (Postfix) with ESMTP id 87A906ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 17:52:10 +0000 (UTC)
Received: from BLU436-SMTP51 ([65.55.111.136]) by BLU004-OMC4S23.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Mon, 13 Oct 2014 10:52:11 -0700
X-TMN: [i2f2GcFKCqjh6aHAJyJt0oqU2yj4ARNT]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP515C53ADE83EDFDE88FD20D6AC0@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 11:51:59 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 13 Oct 2014 17:52:09.0213 (UTC)
	FILETIME=[68E06AD0:01CFE70E]
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] cyassl: add version 3.2.0 with updates
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
X-List-Received-Date: Mon, 13 Oct 2014 17:52:20 -0000
Content-Type: text/plain

Update 3.2.0 to include the correct md5sum and sha256sum values.

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
index 0c0cac2..508bab4 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "CyaSSL Embedded SSL Library"
+SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
 DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
                optimized for embedded and RTOS environments. It can be \
                Up to 20 times smaller than OpenSSL while still supporting \
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.yassl.com/${BP}.zip"
 
-SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
-SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
+SRC_URI[md5sum] = "9f076e82d32bea986651ada34c49f6c0"
+SRC_URI[sha256sum] = "c9e97cd3fa4697e55328c2016965ac4b304fcef45a10559caf540c42f1d5e93a"
 
 inherit autotools
 
-- 
1.9.1


