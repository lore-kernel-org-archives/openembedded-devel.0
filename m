Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2857D535
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:42:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549900800"; d="scan'208";a="60375060"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 16:42:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7BF2E4CDAAA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:42:45 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 16:42:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 16:43:35 +0800
Message-ID: <20190424084335.31135-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 7BF2E4CDAAA9.ACBAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-zopeinterface: upgrade 4.5.0 -> 4.6.0
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
X-List-Received-Date: Wed, 24 Apr 2019 08:42:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-zopeinterface_4.5.0.bb to python-zopeinterface_4.6.0.bb.

-Upgrade from python3-zopeinterface_4.5.0.bb to python3-zopeinterface_4.6.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc  | 4 ++--
 ...n-zopeinterface_4.5.0.bb => python-zopeinterface_4.6.0.bb} | 0
 ...-zopeinterface_4.5.0.bb => python3-zopeinterface_4.6.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.5.0.bb => python-zopeinterface_4.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.5.0.bb => python3-zopeinterface_4.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 12623c9b6..7213bc8ac 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "7b669cd692d817772c61d2e3ad0f1e71"
-SRC_URI[sha256sum] = "57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c"
+SRC_URI[md5sum] = "a3b24f9d079bae5e13dd7a88aa512112"
+SRC_URI[sha256sum] = "1b3d0dcabc7c90b470e59e38a9acaa361be43b3a6ea644c0063951964717f0e5"
 
 PYPI_PACKAGE = "zope.interface"
 
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.5.0.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.5.0.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.5.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_4.6.0.bb
-- 
2.20.1




