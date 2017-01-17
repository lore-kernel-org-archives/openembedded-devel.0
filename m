Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB2971998
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 03:02:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14824199"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 11:02:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E58247AD1FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 11:02:05 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 11:02:04 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 11:02:15 +0800
Message-ID: <1484622135-26284-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 8E58247AD1FF.A83A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-py: 1.4.31 -> 1.4.32
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
X-List-Received-Date: Tue, 17 Jan 2017 03:02:10 -0000
Content-Type: text/plain

Upgrade python-py from 1.4.31 to 1.4.32.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-py.inc                     | 4 ++--
 .../python/{python-py_1.4.31.bb => python-py_1.4.32.bb}               | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.4.31.bb => python-py_1.4.32.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 9e33b16..4ac502e 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "5d2c63c56dc3f2115ec35c066ecd582b"
-SRC_URI[sha256sum] = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"
+SRC_URI[md5sum] = "68ee0b5867282595d0b410a7f3c03ab3"
+SRC_URI[sha256sum] = "c4b89fd1ff1162375115608d01f77c38cca1d0f28f37fd718005e19b28be41a7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.31.bb b/meta-python/recipes-devtools/python/python-py_1.4.32.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.4.31.bb
rename to meta-python/recipes-devtools/python/python-py_1.4.32.bb
-- 
2.7.4




