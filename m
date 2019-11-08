Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A60997FC46
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 07:43:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78054327"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 15:43:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CD8044B6AE15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 15:35:49 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:43:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 15:44:26 +0800
Message-ID: <20191108074426.7647-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CD8044B6AE15.AA225
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest: upgrade 5.2.1 -> 5.2.2
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
X-List-Received-Date: Fri, 08 Nov 2019 07:44:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc         | 4 ++--
 .../python/{python-pytest_5.2.1.bb => python-pytest_5.2.2.bb} | 0
 .../{python3-pytest_5.2.1.bb => python3-pytest_5.2.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_5.2.1.bb => python-pytest_5.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.2.1.bb => python3-pytest_5.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index fa264f791..a26d41084 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "00561d0295aab167987f8a4f784964c4"
-SRC_URI[sha256sum] = "ca563435f4941d0cb34767301c27bc65c510cb82e90b9ecf9cb52dc2c63caaa0"
+SRC_URI[md5sum] = "889344299c9182aff67d6e461cb7af29"
+SRC_URI[sha256sum] = "27abc3fef618a01bebb1f0d6d303d2816a99aa87a5968ebc32fe971be91eb1e6"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.2.1.bb b/meta-python/recipes-devtools/python/python-pytest_5.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_5.2.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest_5.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.2.2.bb
-- 
2.20.1




