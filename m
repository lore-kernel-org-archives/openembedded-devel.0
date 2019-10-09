Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4857F400
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 08:23:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,273,1566835200"; d="scan'208";a="76695218"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Oct 2019 16:23:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8ED694CE14F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 16:23:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 16:23:24 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2019 16:23:24 +0800
Message-ID: <20191009082324.32317-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8ED694CE14F5.A94FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-asn1crypto: upgrade 0.24.0 -> 1.0.1
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
X-List-Received-Date: Wed, 09 Oct 2019 08:23:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc           | 6 +++---
 .../{python-asn1crypto_0.24.0.bb => python-asn1crypto_1.0.1.bb}     | 0
 .../{python3-asn1crypto_0.24.0.bb => python3-asn1crypto_1.0.1.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-asn1crypto_0.24.0.bb => python-asn1crypto_1.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_0.24.0.bb => python3-asn1crypto_1.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index e85ce9a..b18dbaf 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 str
 HOMEPAGE = "https://github.com/wbond/asn1crypto"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "de3520426e81a6581352d4366f310eb1"
-SRC_URI[sha256sum] = "9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49"
+SRC_URI[md5sum] = "cf33950b47b5148e29f1d62a6b6c009b"
+SRC_URI[sha256sum] = "0b199f211ae690df3db4fd6c1c4ff976497fb1da689193e368eedbadc53d9292"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
rename to meta-python/recipes-devtools/python/python-asn1crypto_1.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.0.1.bb
-- 
2.7.4




