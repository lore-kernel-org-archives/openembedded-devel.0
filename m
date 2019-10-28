Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A9DA8602D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 05:16:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="77568757"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 13:14:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BBA024CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:06:40 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 28 Oct 2019 13:14:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 13:14:52 +0800
Message-ID: <20191028051452.16892-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BBA024CE1508.A7E18
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-can: upgrade 2.2.1 -> 3.3.2
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
X-List-Received-Date: Mon, 28 Oct 2019 05:16:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update:changed from dos to unix.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-can.inc          | 6 +++---
 .../python/{python-can_2.2.1.bb => python-can_3.3.2.bb}     | 0
 .../python/{python3-can_2.2.1.bb => python3-can_3.3.2.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-can_2.2.1.bb => python-can_3.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-can_2.2.1.bb => python3-can_3.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 46f085933..7d0100d7d 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Controller Area Network (CAN) interface module for Python"
 SECTION = "devel/python"
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[md5sum] = "dcdd3f6b924e3f20acb1ccf4598236cf"
-SRC_URI[sha256sum] = "b5e93b2ee32bdd597d9d908afe5171c402a04c9678ba47b60f33506738b1375b"
+SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
+SRC_URI[sha256sum] = "5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e"
 
 PYPI_PACKAGE="python-can"
 
diff --git a/meta-python/recipes-devtools/python/python-can_2.2.1.bb b/meta-python/recipes-devtools/python/python-can_3.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-can_2.2.1.bb
rename to meta-python/recipes-devtools/python/python-can_3.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-can_2.2.1.bb b/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-can_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-can_3.3.2.bb
-- 
2.20.1




