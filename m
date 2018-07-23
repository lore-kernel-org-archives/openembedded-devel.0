Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3151F74D41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:33:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42543813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2018 17:33:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 200754B66A24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:33:51 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 23 Jul 2018 17:33:50 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 17:33:25 +0800
Message-ID: <20180723093326.12122-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
References: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 200754B66A24.AA5CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-greenlet: 0.4.13->0.4.14
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
X-List-Received-Date: Mon, 23 Jul 2018 09:33:59 -0000
Content-Type: text/plain

Upgrade python-greenlet from 0.4.13 to 0.4.14.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
 .../python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
index 7a42240..fcd81f6 100644
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
-SRC_URI[sha256sum] = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
+SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
+SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
-- 
2.7.4




