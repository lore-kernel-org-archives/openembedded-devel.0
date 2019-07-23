Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6095C7E265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 03:17:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,297,1559491200"; d="scan'208";a="71997809"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2019 11:17:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B1424CDE81D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 11:17:24 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 23 Jul 2019 11:17:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Jul 2019 11:16:39 +0800
Message-ID: <20190723031639.10770-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2B1424CDE81D.A8848
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-mako: upgrade 1.0.13 -> 1.0.14
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
X-List-Received-Date: Tue, 23 Jul 2019 03:17:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-mako.inc                   | 4 ++--
 .../python/{python-mako_1.0.13.bb => python-mako_1.0.14.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mako_1.0.13.bb => python-mako_1.0.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
index 0b3fe14..27d14a3 100644
--- a/meta-python/recipes-devtools/python/python-mako.inc
+++ b/meta-python/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "ad6c7dcb5d39c99f4fdf4fec892c5dee"
-SRC_URI[sha256sum] = "95ee720cc3453063788515d55bd7ce4a2a77b7b209e4ac70ec5c86091eb02541"
+SRC_URI[md5sum] = "e162578170331f0cc6a4adb063c7c0f6"
+SRC_URI[sha256sum] = "f5a642d8c5699269ab62a68b296ff990767eb120f51e2e8f3d6afb16bdb57f4b"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-html \
diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.13.bb b/meta-python/recipes-devtools/python/python-mako_1.0.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-mako_1.0.13.bb
rename to meta-python/recipes-devtools/python/python-mako_1.0.14.bb
-- 
2.7.4




