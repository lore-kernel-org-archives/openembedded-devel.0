Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S17.hotmail.com (blu004-omc4s17.hotmail.com
	[65.55.111.156])
	by mail.openembedded.org (Postfix) with ESMTP id 201BC727BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 16:21:33 +0000 (UTC)
Received: from BLU436-SMTP205 ([65.55.111.137]) by BLU004-OMC4S17.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Mon, 22 Dec 2014 08:21:33 -0800
X-TMN: [YYQnIIwvSJcIcaCP638cuiI05Ucg5cq6]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP205279D0490E10933874AE3D6560@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Dec 2014 09:21:19 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 22 Dec 2014 16:21:31.0402 (UTC)
	FILETIME=[589ACEA0:01D01E03]
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] cyassl: removed "version 3.3.0" from summary
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
X-List-Received-Date: Mon, 22 Dec 2014 16:21:38 -0000
Content-Type: text/plain

Signed-off-by: lchristina26 <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
index 715cf1f..b6f852d 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"
+SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
 DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
                optimized for embedded and RTOS environments. It can be \
                Up to 20 times smaller than OpenSSL while still supporting \
-- 
1.9.1


