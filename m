Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8457E5E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 02:55:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,538,1559491200"; d="scan'208";a="75867955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Sep 2019 10:55:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 086F04CE14ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 10:55:27 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Sep 2019 10:55:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Sep 2019 10:55:17 +0800
Message-ID: <20190923025517.4729-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 086F04CE14ED.AD330
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pysocks: upgrade 1.7.0 -> 1.7.1
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
X-List-Received-Date: Mon, 23 Sep 2019 02:55:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pysocks.inc        | 4 ++--
 .../{python-pysocks_1.7.0.bb => python-pysocks_1.7.1.bb}      | 0
 .../{python3-pysocks_1.7.0.bb => python3-pysocks_1.7.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysocks_1.7.0.bb => python-pysocks_1.7.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pysocks_1.7.0.bb => python3-pysocks_1.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
index 32cb50ce1..ceadcb20d 100644
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "ffea8bdc4eee054df2f9f6a9c3752567"
-SRC_URI[sha256sum] = "d9031ea45fdfacbe59a99273e9f0448ddb33c1580fe3831c1b09557c5718977c"
+SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
+SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
 
 PYPI_PACKAGE = "PySocks"
 
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.7.0.bb b/meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pysocks_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pysocks_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
-- 
2.20.1




