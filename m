Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 068FA6C37F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 05:27:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77723531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 13:27:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5CBCE4CE1515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 13:19:21 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 13:27:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 13:27:21 +0800
Message-ID: <20191031052721.26424-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5CBCE4CE1515.AB4DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-engineio: upgrade 3.9.3 -> 3.10.0
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
X-List-Received-Date: Thu, 31 Oct 2019 05:27:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-engineio.inc       | 4 ++--
 .../{python-engineio_3.9.3.bb => python-engineio_3.10.0.bb}   | 0
 .../{python3-engineio_3.9.3.bb => python3-engineio_3.10.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-engineio_3.9.3.bb => python-engineio_3.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.9.3.bb => python3-engineio_3.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index f24da1284..134713064 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "11a4f18f5b08a36d07d3c0ff85e7c047"
-SRC_URI[sha256sum] = "2a4c874aea686e79f8ea9efc30748110df581df6d577d18bb5eaa1a8f2199d12"
+SRC_URI[md5sum] = "bec3b06a112a7f09a0a9c92b627282fe"
+SRC_URI[sha256sum] = "9c9a6035b4b5e5a225f426f846afa14cf627f7571d1ae02167cb703fefd134b7"
diff --git a/meta-python/recipes-devtools/python/python-engineio_3.9.3.bb b/meta-python/recipes-devtools/python/python-engineio_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb b/meta-python/recipes-devtools/python/python3-engineio_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.10.0.bb
-- 
2.20.1




