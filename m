Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 64E3161054
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 10:55:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83207926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 18:55:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 97E7150A996F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 18:46:04 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 18:55:34 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Feb 2020 18:55:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Feb 2020 10:35:58 -0800
Message-ID: <1581532558-107111-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581532558-107111-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581532558-107111-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 97E7150A996F.A379B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-pytest: upgrade 5.3.2 -> 5.3.5
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
X-List-Received-Date: Wed, 12 Feb 2020 10:55:36 -0000
Content-Type: text/plain

Copyright updated: 2004-2019 -> 2004-2020

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc       | 6 +++---
 .../{python3-pytest_5.3.2.bb => python3-pytest_5.3.5.bb}    | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.3.2.bb => python3-pytest_5.3.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 752d67e36..402126300 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Simple powerful teting with python"
 HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[md5sum] = "71a8eb2ab5efb76512d9a69bd6477034"
-SRC_URI[sha256sum] = "6b571215b5a790f9b41f19f3531c53a45cf6bb8ef2988bc1ff9afb38270b25fa"
+SRC_URI[md5sum] = "d5ef453f723be46d93e0795f3be86c88"
+SRC_URI[sha256sum] = "0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    "
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_5.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
-- 
2.17.1




