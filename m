Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S12.hotmail.com (blu004-omc4s12.hotmail.com
	[65.55.111.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3041872A92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 23:58:00 +0000 (UTC)
Received: from BLU436-SMTP117 ([65.55.111.135]) by BLU004-OMC4S12.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Fri, 19 Dec 2014 15:58:00 -0800
X-TMN: [Nici1xfAF6Bw4D8Qj8gZH9Is6rDU5Iul]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP11763FCC6123D403C929D0CD66B0@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Dec 2014 16:57:45 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 19 Dec 2014 23:57:58.0419 (UTC)
	FILETIME=[9D4CB630:01D01BE7]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyassl: add new recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 23:58:05 -0000
Content-Type: text/plain

add cyassl-3.3.0 as new recipe. cyassl-3.1.0 can be removed.

Signed-off-by: leah <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
index b6f852d..715cf1f 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
+SUMMARY = "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"
 DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
                optimized for embedded and RTOS environments. It can be \
                Up to 20 times smaller than OpenSSL while still supporting \
-- 
1.9.1


