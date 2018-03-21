Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E131E7894E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026081"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8EA2648AE76D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:25 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:15 +0800
Message-ID: <1521603377-34881-10-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8EA2648AE76D.A80DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-msgpack: 0.5.5 -> 0.5.6
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:28 -0000
Content-Type: text/plain

Upgrade python-msgpack from 0.5.5 to 0.5.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
 .../python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb}       | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index 2e852cc..fdc8926 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "62640290ea856420d83b7f9dc1dd789d"
-SRC_URI[sha256sum] = "7f5d6e59228b65c47cfdae76a4aea71f6902525f18256862cda69888a686b5f9"
+SRC_URI[md5sum] = "6d644c06a87a5a111bbbf5b34b4be440"
+SRC_URI[sha256sum] = "378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
-- 
2.7.4




