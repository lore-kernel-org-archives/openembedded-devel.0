Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE6AE7D3EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:41:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78780422"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 14:41:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 383844CE14FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:32:45 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 14:41:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 14:41:36 +0800
Message-ID: <20191120064136.5922-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 383844CE14FF.A91CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-yappi: upgrade 0.98 -> 1.0
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
X-List-Received-Date: Wed, 20 Nov 2019 06:41:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-yappi.inc        | 6 +++---
 .../python/{python-yappi_0.98.bb => python-yappi_1.0.bb}    | 0
 .../python/{python3-yappi_0.98.bb => python3-yappi_1.0.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-yappi_0.98.bb => python-yappi_1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-yappi_0.98.bb => python3-yappi_1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
index 651ce7731..54d408742 100644
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -2,10 +2,10 @@ SUMMARY  = "Yet Another Python Profiler"
 HOMEPAGE = "http://yappi.googlecode.com/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b131c3041637f6a5175a43112dde05c"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
 
-SRC_URI[md5sum] = "dc56240575c99938a924eaeb7c0d8beb"
-SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b27b263c"
+SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
+SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-yappi_0.98.bb b/meta-python/recipes-devtools/python/python-yappi_1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-yappi_0.98.bb
rename to meta-python/recipes-devtools/python/python-yappi_1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-yappi_0.98.bb b/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-yappi_0.98.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.0.bb
-- 
2.20.1




