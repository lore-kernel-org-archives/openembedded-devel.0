Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7465E6C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 06:40:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77728106"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 14:40:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 179EB4CE1513
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 14:32:18 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 14:40:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:40:29 +0800
Message-ID: <20191031064029.19290-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 179EB4CE1513.AB510
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-isort: upgrade 4.3.4 -> 4.3.21
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
X-List-Received-Date: Thu, 31 Oct 2019 06:40:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-isort.inc          | 4 ++--
 .../python/{python-isort_4.3.4.bb => python-isort_4.3.21.bb}  | 0
 .../{python3-isort_4.3.4.bb => python3-isort_4.3.21.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-isort_4.3.4.bb => python-isort_4.3.21.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-isort_4.3.4.bb => python3-isort_4.3.21.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
index 359b18012..324d4cf10 100644
--- a/meta-python/recipes-devtools/python/python-isort.inc
+++ b/meta-python/recipes-devtools/python/python-isort.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "fb554e9c8f9aa76e333a03d470a5cf52"
-SRC_URI[sha256sum] = "b9c40e9750f3d77e6e4d441d8b0266cf555e7cdabdcff33c4fd06366ca761ef8"
+SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
+SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-isort_4.3.4.bb b/meta-python/recipes-devtools/python/python-isort_4.3.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-isort_4.3.4.bb
rename to meta-python/recipes-devtools/python/python-isort_4.3.21.bb
diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.4.bb b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-isort_4.3.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
-- 
2.20.1




