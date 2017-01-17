Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 301F371C10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 03:53:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14825981"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 11:53:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C8AAC47B0CAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 11:53:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 11:53:14 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 11:53:25 +0800
Message-ID: <1484625205-26474-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C8AAC47B0CAC.AA072
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest: 3.0.4 -> 3.0.5
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
X-List-Received-Date: Tue, 17 Jan 2017 03:53:21 -0000
Content-Type: text/plain

Upgrade python-pytest from 3.0.4 to 3.0.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.0.4.bb => python-pytest_3.0.5.bb}         | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.0.4.bb => python-pytest_3.0.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 27f6c27..bf91faf 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 
-SRC_URI[md5sum] = "0fbf3cf9f127ae34300e2c8bb002b6a6"
-SRC_URI[sha256sum] = "879fee2c1fdbaacd1bf2c0047677c6dd4aee05b9c1e64330b34d130a584fa40d"
+SRC_URI[md5sum] = "cefd527b59332688bf5db4a10aa8a7cb"
+SRC_URI[sha256sum] = "4a003aa956f023ce91aa6e166b555e6f02a4b0aeb459ac61e14f64c0d39037fd"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.4.bb b/meta-python/recipes-devtools/python/python-pytest_3.0.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.0.4.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.0.5.bb
-- 
2.7.4




