Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DE6686D409
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:53:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74876840"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 14:53:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C93D4CE14E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:53:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 14:53:53 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 15:53:28 +0900
Message-ID: <20190905065328.41172-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 1C93D4CE14E8.A10B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-stevedore: upgrade 1.30.1 -> 1.31.0
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
X-List-Received-Date: Thu, 05 Sep 2019 06:53:50 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-stevedore.inc      | 4 ++--
 ...{python-stevedore_1.30.1.bb => python-stevedore_1.31.0.bb} | 0
 ...ython3-stevedore_1.30.1.bb => python3-stevedore_1.31.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-stevedore_1.30.1.bb => python-stevedore_1.31.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-stevedore_1.30.1.bb => python3-stevedore_1.31.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
index 0aa0ef2fa..5aa9fb424 100644
--- a/meta-python/recipes-devtools/python/python-stevedore.inc
+++ b/meta-python/recipes-devtools/python/python-stevedore.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/dreamhost/stevedore"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "02c747c39f4634465aa2590ceefddf59"
-SRC_URI[sha256sum] = "7be098ff53d87f23d798a7ce7ae5c31f094f3deb92ba18059b1aeb1ca9fec0a0"
+SRC_URI[md5sum] = "42fa2bf0251c96b543765c5ce13f37c9"
+SRC_URI[sha256sum] = "e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-stevedore_1.30.1.bb b/meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-stevedore_1.30.1.bb
rename to meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.30.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-stevedore_1.30.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
-- 
2.17.1




