Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6B97F7B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 03:17:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,219,1569254400"; d="scan'208";a="77344621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 11:17:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AC7F04CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 11:09:49 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 11:17:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Oct 2019 11:17:56 +0800
Message-ID: <20191023031756.24984-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AC7F04CE1508.A9121
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-asn1crypto: upgrade 1.0.1 -> 1.2.0
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
X-List-Received-Date: Wed, 23 Oct 2019 03:17:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc             | 4 ++--
 .../python/{python-asn1crypto_1.0.1.bb => python-asn1crypto_1.2.0.bb} | 0
 .../{python3-asn1crypto_1.0.1.bb => python3-asn1crypto_1.2.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-asn1crypto_1.0.1.bb => python-asn1crypto_1.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.0.1.bb => python3-asn1crypto_1.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index b18dbaf..9b8c1cb 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "cf33950b47b5148e29f1d62a6b6c009b"
-SRC_URI[sha256sum] = "0b199f211ae690df3db4fd6c1c4ff976497fb1da689193e368eedbadc53d9292"
+SRC_URI[md5sum] = "fc3815cdd4812505e3ee297740c5f5d3"
+SRC_URI[sha256sum] = "87620880a477123e01177a1f73d0f327210b43a3cdbd714efcd2fa49a8d7b384"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_1.0.1.bb b/meta-python/recipes-devtools/python/python-asn1crypto_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-asn1crypto_1.0.1.bb
rename to meta-python/recipes-devtools/python/python-asn1crypto_1.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.0.1.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.2.0.bb
-- 
2.7.4




