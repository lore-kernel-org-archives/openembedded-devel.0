Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1E35E6022F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 05:52:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14792824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2017 13:52:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D138A47B0CA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:52:34 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 16 Jan 2017 13:52:39 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2017 13:52:24 +0800
Message-ID: <1484545944-24805-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: D138A47B0CA7.A8054
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-jsonpatch: 1.14 -> 1.15
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
X-List-Received-Date: Mon, 16 Jan 2017 05:52:43 -0000
Content-Type: text/plain

Upgrade python-jsonpatch from 1.14 to 1.15.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-jsonpatch_1.14.bb => python-jsonpatch_1.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.14.bb => python-jsonpatch_1.15.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb
index c845eda..f214bf2 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "cf4fbad8188f1389363433dbf867109f"
-SRC_URI[sha256sum] = "776d828d6f7b4581862529cf413439a652d74b9e3a0261fa08c36fd761a78b4a"
+SRC_URI[md5sum] = "818d36e05d68ba90ca2b26597bd82975"
+SRC_URI[sha256sum] = "ae23cd08b2f7246f8f2475363501e740c4ef93f08f2a3b7b9bcfac0cc37fceb1"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
-- 
2.7.4




