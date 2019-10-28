Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7748C7FA7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 01:37:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="77559228"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 09:37:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B2E694B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 09:29:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 28 Oct 2019 09:37:50 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 09:37:37 +0800
Message-ID: <20191028013737.19666-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B2E694B6EC6E.AA4CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-bitarray: upgrade 0.8.3 -> 1.0.1
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
X-List-Received-Date: Mon, 28 Oct 2019 01:37:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-bitarray.inc             | 6 +++---
 .../python/{python-bitarray_0.8.3.bb => python-bitarray_1.0.1.bb}   | 0
 .../python/{python3-bitarray_0.8.3.bb => python3-bitarray_1.0.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bitarray_0.8.3.bb => python-bitarray_1.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_0.8.3.bb => python3-bitarray_1.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
index 480f048..e7d49db 100644
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -1,10 +1,10 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f4ce1ae80a385140f0ddb2bcef410b06"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d736cf16034030b4aab4ea179d91e778"
 
-SRC_URI[md5sum] = "f3131ac2a277f3b70dbb6132ca8f8889"
-SRC_URI[sha256sum] = "050cd30b810ddb3aa941e7ddfbe0d8065e793012d0a88cb5739ec23624b9895e"
+SRC_URI[md5sum] = "56f55188d8d5361834db0bc7120f8998"
+SRC_URI[sha256sum] = "3eb500f8b9cde19e14472fcbee0195dbf0fbac006f8406a03f0cfb495dff20a0"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bitarray_0.8.3.bb b/meta-python/recipes-devtools/python/python-bitarray_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bitarray_0.8.3.bb
rename to meta-python/recipes-devtools/python/python-bitarray_1.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_0.8.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bitarray_0.8.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.0.1.bb
-- 
2.7.4




