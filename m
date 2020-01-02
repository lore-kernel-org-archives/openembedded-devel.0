Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0381C7F291
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 05:15:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81229466"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 13:15:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CFAD7406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:06:35 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 13:15:29 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 13:15:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 13:16:46 +0800
Message-ID: <20200102051646.7463-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CFAD7406AB15.ABC03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-engineio: upgrade 3.10.0 -> 3.11.1
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
X-List-Received-Date: Thu, 02 Jan 2020 05:15:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-engineio.inc       | 4 ++--
 .../{python-engineio_3.10.0.bb => python-engineio_3.11.1.bb}  | 0
 ...{python3-engineio_3.10.0.bb => python3-engineio_3.11.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-engineio_3.10.0.bb => python-engineio_3.11.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.10.0.bb => python3-engineio_3.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index 134713064..57b7b186b 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "bec3b06a112a7f09a0a9c92b627282fe"
-SRC_URI[sha256sum] = "9c9a6035b4b5e5a225f426f846afa14cf627f7571d1ae02167cb703fefd134b7"
+SRC_URI[md5sum] = "327c16ca05e9b0cc4f994b9d35c7f7d7"
+SRC_URI[sha256sum] = "50d108fc7feb7f970e6ebc86733752ebd714545bb5622383e6135bdad45fc9fe"
diff --git a/meta-python/recipes-devtools/python/python-engineio_3.10.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-engineio_3.10.0.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.11.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.10.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.11.1.bb
-- 
2.20.1




