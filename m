Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 398326058C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:03:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73487676"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 14:03:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 194A34CE030F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:03:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 14:03:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Aug 2019 14:02:19 +0800
Message-ID: <20190812060219.29267-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 194A34CE030F.A9958
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-configparser: upgrade 3.7.4 -> 3.8.1
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
X-List-Received-Date: Mon, 12 Aug 2019 06:03:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-configparser.inc           | 4 ++--
 .../{python-configparser_3.7.4.bb => python-configparser_3.8.1.bb}    | 0
 .../{python3-configparser_3.7.4.bb => python3-configparser_3.8.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-configparser_3.7.4.bb => python-configparser_3.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-configparser_3.7.4.bb => python3-configparser_3.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
index 2860989..7f4385e 100644
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -5,7 +5,7 @@ LICENSE = "unknown"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "aaa80b58b6b0810e54f66486860b3ed1"
-SRC_URI[sha256sum] = "da60d0014fd8c55eb48c1c5354352e363e2d30bbf7057e5e171a468390184c75"
+SRC_URI[md5sum] = "bc1558ed941cb1acb80ff650726d5af8"
+SRC_URI[sha256sum] = "bc37850f0cc42a1725a796ef7d92690651bf1af37d744cc63161dac62cabee17"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-configparser_3.7.4.bb b/meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-configparser_3.7.4.bb
rename to meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-configparser_3.7.4.bb b/meta-python/recipes-devtools/python/python3-configparser_3.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-configparser_3.7.4.bb
rename to meta-python/recipes-devtools/python/python3-configparser_3.8.1.bb
-- 
2.7.4




