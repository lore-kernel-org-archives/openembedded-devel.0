Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S16.hotmail.com (blu004-omc4s16.hotmail.com
	[65.55.111.155])
	by mail.openembedded.org (Postfix) with ESMTP id 7099672769
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:29:15 +0000 (UTC)
Received: from BLU437-SMTP10 ([65.55.111.135]) by BLU004-OMC4S16.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Mon, 22 Dec 2014 13:29:16 -0800
X-TMN: [IyAe1vlGsjRa5PVLtXaG54FLb2Xf/R4Y]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Dec 2014 14:29:06 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 22 Dec 2014 21:29:14.0516 (UTC)
	FILETIME=[557A6D40:01D01E2E]
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
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
X-List-Received-Date: Mon, 22 Dec 2014 21:29:22 -0000
Content-Type: text/plain

Signed-off-by: Leah <lchristina26@hotmail.com>
---
 .../cyassl/{cyassl_3.1.0.bb => cyassl_3.3.0.bb}                    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.bb => cyassl_3.3.0.bb} (74%)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
similarity index 74%
rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
index e3edab6..b6f852d 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "CyaSSL Embedded SSL Library"
+SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
 DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
                optimized for embedded and RTOS environments. It can be \
                Up to 20 times smaller than OpenSSL while still supporting \
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.yassl.com/${BP}.zip"
 
-SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
-SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
+SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
+SRC_URI[sha256sum] = "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
 
 inherit autotools
+
-- 
1.9.1


