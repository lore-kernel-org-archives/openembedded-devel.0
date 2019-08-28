Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CAE417ED46
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:58:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="74440237"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 15:58:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A30D74CE032B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:58:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 15:58:10 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 16:57:56 +0900
Message-ID: <20190828075756.9117-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: A30D74CE032B.A19FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-xxhash: upgrade 1.3.0 -> 1.4.1
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
X-List-Received-Date: Wed, 28 Aug 2019 07:58:12 -0000
Content-Type: text/plain

License update: Copyright year updated to 2019.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-xxhash.inc       | 6 +++---
 .../{python3-xxhash_1.3.0.bb => python3-xxhash_1.4.1.bb}    | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.3.0.bb => python3-xxhash_1.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xxhash.inc b/meta-python/recipes-devtools/python/python-xxhash.inc
index 9df4520f7..6b4448220 100644
--- a/meta-python/recipes-devtools/python/python-xxhash.inc
+++ b/meta-python/recipes-devtools/python/python-xxhash.inc
@@ -1,7 +1,7 @@
 SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2c6db5887cc6b2fac8b701d64cb8442"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
-SRC_URI[md5sum] = "a4289aa01839f3ea1fb98929d9131001"
-SRC_URI[sha256sum] = "fe21f23a9d05428c75461790b670f2bf15f50a632d6c171a7e7b588269c619e6"
+SRC_URI[md5sum] = "2e6c0bd69a540e15ff2222d6cb8da466"
+SRC_URI[sha256sum] = "6b5af8c37ff12745ae77f28e695c0d3a3327932fd229824e49382377e940fdf1"
diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.3.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.1.bb
-- 
2.17.1




