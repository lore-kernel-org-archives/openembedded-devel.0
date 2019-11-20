Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A73A77F79E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:50:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78780855"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 14:50:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 98DE64CE1C86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:42:11 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 14:50:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 14:51:03 +0800
Message-ID: <20191120065103.14465-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 98DE64CE1C86.A78E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-xstatic: upgrade 1.0.1 -> 1.0.2
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
X-List-Received-Date: Wed, 20 Nov 2019 06:50:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update:Changed docs and repository information.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-xstatic.inc      | 6 +++---
 .../{python-xstatic_1.0.1.bb => python-xstatic_1.0.2.bb}    | 0
 .../{python3-xstatic_1.0.1.bb => python3-xstatic_1.0.2.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-xstatic_1.0.1.bb => python-xstatic_1.0.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-xstatic_1.0.1.bb => python3-xstatic_1.0.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xstatic.inc b/meta-python/recipes-devtools/python/python-xstatic.inc
index f7c7db99a..c44d66853 100644
--- a/meta-python/recipes-devtools/python/python-xstatic.inc
+++ b/meta-python/recipes-devtools/python/python-xstatic.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "XStatic base package with minimal support code"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.txt;md5=36a1e7eaa71e1bd07b8d2247839f228e"
+LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
 
 PYPI_PACKAGE = "XStatic"
 
-SRC_URI[md5sum] = "7064b5ea7fd1ee990e0ae0538301d9bc"
-SRC_URI[sha256sum] = "0ec93d7c66ebb9e0d31b664753437dc8634cb66e13310cb47c9eb1e0bc66d726"
+SRC_URI[md5sum] = "dea172b7b14b0dbcd5ed63075221af4b"
+SRC_URI[sha256sum] = "80b78dfe37bce6dee4343d64c65375a80bcf399b46dd47c0c7d56161568a23a8"
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
diff --git a/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
rename to meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
-- 
2.20.1




