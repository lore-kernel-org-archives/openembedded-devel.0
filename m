Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF83F7ECAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 02:09:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75500873"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 10:09:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 653BB4CE14E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:08:58 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 10:09:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Sep 2019 10:09:04 +0800
Message-ID: <20190916020904.2339-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 653BB4CE14E7.AAFE6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pluggy: upgrade 0.12.0 -> 0.13.0
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
X-List-Received-Date: Mon, 16 Sep 2019 02:09:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pluggy.inc                 | 4 ++--
 .../python/{python-pluggy_0.12.0.bb => python-pluggy_0.13.0.bb}       | 0
 .../python/{python3-pluggy_0.12.0.bb => python3-pluggy_0.13.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pluggy_0.12.0.bb => python-pluggy_0.13.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pluggy_0.12.0.bb => python3-pluggy_0.13.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
index c9bee62..5766006 100644
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
+++ b/meta-python/recipes-devtools/python/python-pluggy.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[md5sum] = "e986647f5d786c0cc1bd065cf9bac658"
-SRC_URI[sha256sum] = "0825a152ac059776623854c1543d65a4ad408eb3d33ee114dff91e57ec6ae6fc"
+SRC_URI[md5sum] = "4b8384b69cddbc2e104fdd3ff5631788"
+SRC_URI[sha256sum] = "fa5fa1622fa6dd5c030e9cad086fa19ef6a0cf6d7a2d12318e10cb49d6d68f34"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
diff --git a/meta-python/recipes-devtools/python/python-pluggy_0.12.0.bb b/meta-python/recipes-devtools/python/python-pluggy_0.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pluggy_0.12.0.bb
rename to meta-python/recipes-devtools/python/python-pluggy_0.13.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pluggy_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pluggy_0.13.0.bb
-- 
2.7.4




