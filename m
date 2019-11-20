Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 969947CBD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:36:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78782807"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 15:36:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6B9F04B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:27:57 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 15:36:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 15:36:49 +0800
Message-ID: <20191120073649.2280-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6B9F04B6EC6D.AA4F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-twitter: upgrade 3.7.0 -> 3.8.0
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
X-List-Received-Date: Wed, 20 Nov 2019 07:36:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-twitter.inc      | 6 +++---
 .../{python-twitter_3.7.0.bb => python-twitter_3.8.0.bb}    | 0
 .../{python3-twitter_3.7.0.bb => python3-twitter_3.8.0.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twitter_3.7.0.bb => python-twitter_3.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.7.0.bb => python3-twitter_3.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twitter.inc b/meta-python/recipes-devtools/python/python-twitter.inc
index f5657eeb2..ac3f65279 100644
--- a/meta-python/recipes-devtools/python/python-twitter.inc
+++ b/meta-python/recipes-devtools/python/python-twitter.inc
@@ -2,10 +2,10 @@ SUMMARY = "Twitter for Python"
 DESCRIPTION = "Python module to support twitter API"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0307fffd8c4d9946c029daa1426d26e7"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8"
 
-SRC_URI[md5sum] = "c6dc2f315ded761aafc96bea3351c7f6"
-SRC_URI[sha256sum] = "fe85a79f58a01dd335968523b91c5fce760e7fe78bf25a6e71c72204fe499d0b"
+SRC_URI[md5sum] = "8aeff278b7cefcd384c65929bc921e2c"
+SRC_URI[sha256sum] = "8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b"
 
 PYPI_PACKAGE = "tweepy"
 
diff --git a/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python-twitter_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
rename to meta-python/recipes-devtools/python/python-twitter_3.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
-- 
2.20.1




