Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E072F7984C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:30:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44773895"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2018 17:30:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 387304B6AE13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:30:52 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 11 Sep 2018 17:30:51 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Sep 2018 17:30:50 +0800
Message-ID: <20180911093050.25992-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 387304B6AE13.AD418
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-greenlet: 0.4.14->0.4.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 09:30:56 -0000
Content-Type: text/plain

Upgrade python-greenlet from 0.4.14 to 0.4.15

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
 .../python/{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
index fcd81f6..c7c656c 100644
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
-SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
+SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
+SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
-- 
2.7.4




