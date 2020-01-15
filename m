Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 568BC7FA13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889272"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CE984CE26C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:07 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:12 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:22 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:23 -0800
Message-ID: <1579093951-77460-8-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3CE984CE26C8.A2BEB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-ordered-set: 3.0.1 -> 3.1.1
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:11 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...hon3-ordered-set_3.0.1.bb => python3-ordered-set_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ordered-set_3.0.1.bb => python3-ordered-set_3.1.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb b/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
index 662d3eebb..013a2e755 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
 
-SRC_URI[md5sum] = "a8059c7b99cde0f8dda01ddee6b43c2c"
-SRC_URI[sha256sum] = "3d6fd7bffbb15f613a9e8a6281bf97c2d67f7bb8677deca8249df2fbdd9cce7b"
+SRC_URI[md5sum] = "6e12312c8dc4c90fe840e86e8a352644"
+SRC_URI[sha256sum] = "a7bfa858748c73b096e43db14eb23e2bc714a503f990c89fac8fab9b0ee79724"
 
 inherit pypi setuptools3
 
-- 
2.17.1




