Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CCD607E648
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 03:14:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,538,1559491200"; d="scan'208";a="75868690"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Sep 2019 11:14:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 748604CE14ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:14:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Sep 2019 11:15:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Sep 2019 11:14:30 +0800
Message-ID: <20190923031430.19091-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 748604CE14ED.A9CEC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest: upgrade 5.1.2 -> 5.1.3
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
X-List-Received-Date: Mon, 23 Sep 2019 03:14:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc         | 4 ++--
 .../python/{python-pytest_5.1.2.bb => python-pytest_5.1.3.bb} | 0
 .../{python3-pytest_5.1.2.bb => python3-pytest_5.1.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_5.1.2.bb => python-pytest_5.1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.1.2.bb => python3-pytest_5.1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 5f3e60eef..576361c41 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "90fec5504fcebc5d1081bcd654df7cf0"
-SRC_URI[sha256sum] = "b78fe2881323bd44fd9bd76e5317173d4316577e7b1cddebae9136a4495ec865"
+SRC_URI[md5sum] = "79efe2708aa73dd5c618e5a89d80ce58"
+SRC_URI[sha256sum] = "cc6620b96bc667a0c8d4fa592a8c9c94178a1bd6cc799dbb057dfd9286d31a31"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.1.2.bb b/meta-python/recipes-devtools/python/python-pytest_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_5.1.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.1.3.bb
-- 
2.20.1




