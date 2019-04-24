Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DD35D7C68C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:34:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549900800"; d="scan'208";a="60374143"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 16:34:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 665304CDAAAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:34:39 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 16:34:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 16:35:28 +0800
Message-ID: <20190424083528.27283-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 665304CDAAAA.AA6EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-twisted: upgrade 18.4.0 -> 19.2.0
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
X-List-Received-Date: Wed, 24 Apr 2019 08:34:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-twisted_18.4.0.bb to python-twisted_19.2.0.bb.

-Upgrade from python3-twisted_18.4.0.bb to python3-twisted_19.2.0.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc      | 6 +++---
 .../{python-twisted_18.4.0.bb => python-twisted_19.2.0.bb}  | 0
 ...{python3-twisted_18.4.0.bb => python3-twisted_19.2.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_18.4.0.bb => python-twisted_19.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_18.4.0.bb => python3-twisted_19.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 456adf4c3..ddef414a1 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=04e7730aecedc79d805625a91bc06145"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d136e8cf7b52f2e64079186ae2060d8a"
 
-SRC_URI[sha256sum] = "a4cc164a781859c74de47f17f0e85f4bce8a3321a9d0892c015c8f80c4158ad9"
-SRC_URI[md5sum] = "da8142ad4e9971a75fe751ac96a33b95"
+SRC_URI[sha256sum] = "1708e1928ae84ec9d3ebab0d427e20e1e38ff721b15bbced476d047d4a43abbe"
+SRC_URI[md5sum] = "473e12f4226e0fecc0ca5698e418e3f6"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb b/meta-python/recipes-devtools/python/python-twisted_19.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_19.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_19.2.0.bb
-- 
2.20.1




