Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 487387E71E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:28:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="67855216"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2019 11:28:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AAFCD4CDD994
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:28:05 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 11:28:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jun 2019 11:29:28 +0800
Message-ID: <20190618032928.638-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: AAFCD4CDD994.ADF34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-twisted: upgrade 19.2.0 -> 19.2.1
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
X-List-Received-Date: Tue, 18 Jun 2019 03:28:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-twisted_19.2.0.bb to python-twisted_19.2.1.bb.

-Upgrade from python3-twisted_19.2.0.bb to python3-twisted_19.2.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc        | 4 ++--
 .../{python-twisted_19.2.0.bb => python-twisted_19.2.1.bb}    | 0
 .../{python3-twisted_19.2.0.bb => python3-twisted_19.2.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_19.2.0.bb => python-twisted_19.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_19.2.0.bb => python3-twisted_19.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index ddef414a1..005aaadef 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d136e8cf7b52f2e64079186ae2060d8a"
 
-SRC_URI[sha256sum] = "1708e1928ae84ec9d3ebab0d427e20e1e38ff721b15bbced476d047d4a43abbe"
-SRC_URI[md5sum] = "473e12f4226e0fecc0ca5698e418e3f6"
+SRC_URI[sha256sum] = "fa2c04c2d68a9be7fc3975ba4947f653a57a656776f24be58ff0fe4b9aaf3e52"
+SRC_URI[md5sum] = "528b7856938edc2a752c244aebd94981"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_19.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_19.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_19.2.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_19.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_19.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_19.2.1.bb
-- 
2.20.1




