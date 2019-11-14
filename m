Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA9B7F830
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:47:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78434705"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 11:47:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EE5F84CE14FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:38:48 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 11:47:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 11:47:32 +0800
Message-ID: <20191114034732.6660-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: EE5F84CE14FE.AC016
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest-tempdir: upgrade 2016.8.20 -> 2019.10.12
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
X-List-Received-Date: Thu, 14 Nov 2019 03:47:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pytest-tempdir.inc       | 6 +++---
 ...dir_2016.8.20.bb => python-pytest-tempdir_2019.10.12.bb} | 0
 ...ir_2016.8.20.bb => python3-pytest-tempdir_2019.10.12.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-tempdir_2016.8.20.bb => python-pytest-tempdir_2019.10.12.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-tempdir_2016.8.20.bb => python3-pytest-tempdir_2019.10.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir.inc b/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
index 196f6d644..cf355a364 100644
--- a/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
@@ -2,9 +2,9 @@ DESCRIPTION = "Adds support for a predictable and repeatable temporary directory
 HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8751a9cf4a70be4f02697a9b89e686ce"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9872c3a37cc9baf79a464cd168282be5"
 
-SRC_URI[md5sum] = "f87f2583f5f8aaca7203d57ada3948b5"
-SRC_URI[sha256sum] = "65ff815966ea6dfc07ca1b43747c9888a6d883971170e67b16290f9f50d434ea"
+SRC_URI[md5sum] = "79b997d418fb85c2529ab50cd4333689"
+SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb b/meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
rename to meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb
rename to meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
-- 
2.20.1




