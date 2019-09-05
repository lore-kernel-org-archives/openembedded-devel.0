Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9F096C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:48:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74876688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 14:48:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CED6A4CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:48:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 14:48:41 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 15:48:16 +0900
Message-ID: <20190905064816.41064-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: CED6A4CE14E4.A31EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest: upgrade 5.1.1 -> 5.1.2
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
X-List-Received-Date: Thu, 05 Sep 2019 06:48:45 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc         | 4 ++--
 .../python/{python-pytest_5.1.1.bb => python-pytest_5.1.2.bb} | 0
 .../{python3-pytest_5.1.1.bb => python3-pytest_5.1.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_5.1.1.bb => python-pytest_5.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.1.1.bb => python3-pytest_5.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 49ef790f0..b58cdea96 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "662313b4f539f5b66d2fb77791458e82"
-SRC_URI[sha256sum] = "c3d5020755f70c82eceda3feaf556af9a341334414a8eca521a18f463bcead88"
+SRC_URI[md5sum] = "90fec5504fcebc5d1081bcd654df7cf0"
+SRC_URI[sha256sum] = "b78fe2881323bd44fd9bd76e5317173d4316577e7b1cddebae9136a4495ec865"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.1.1.bb b/meta-python/recipes-devtools/python/python-pytest_5.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest_5.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.1.2.bb
-- 
2.17.1




