Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CC1857D274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 02:47:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,364,1549900800"; d="scan'208";a="59581927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2019 10:47:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 040EC4CD84C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 10:47:04 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Apr 2019 10:47:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Apr 2019 10:47:53 +0800
Message-ID: <20190418024753.30897-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 040EC4CD84C7.ADCA5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-stevedore: upgrade 1.29.0 -> 1.30.1
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
X-List-Received-Date: Thu, 18 Apr 2019 02:47:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-stevedore_1.29.0.bb to python-stevedore_1.30.1.bb.

-Upgrade from python3-stevedore_1.29.0.bb to python3-stevedore_1.30.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-stevedore.inc      | 4 ++--
 ...{python-stevedore_1.29.0.bb => python-stevedore_1.30.1.bb} | 0
 ...ython3-stevedore_1.29.0.bb => python3-stevedore_1.30.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-stevedore_1.29.0.bb => python-stevedore_1.30.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-stevedore_1.29.0.bb => python3-stevedore_1.30.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
index 14ebc0ef0..0aa0ef2fa 100644
--- a/meta-python/recipes-devtools/python/python-stevedore.inc
+++ b/meta-python/recipes-devtools/python/python-stevedore.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/dreamhost/stevedore"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "525186cba577852e0408c92c3f8fac65"
-SRC_URI[sha256sum] = "1e153545aca7a6a49d8337acca4f41c212fbfa60bf864ecd056df0cafb9627e8"
+SRC_URI[md5sum] = "02c747c39f4634465aa2590ceefddf59"
+SRC_URI[sha256sum] = "7be098ff53d87f23d798a7ce7ae5c31f094f3deb92ba18059b1aeb1ca9fec0a0"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-stevedore_1.29.0.bb b/meta-python/recipes-devtools/python/python-stevedore_1.30.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-stevedore_1.29.0.bb
rename to meta-python/recipes-devtools/python/python-stevedore_1.30.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.29.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_1.30.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-stevedore_1.29.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_1.30.1.bb
-- 
2.20.1




