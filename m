Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5DE7FBEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 04:52:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81229045"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 12:52:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CBF45406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 12:43:23 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 12:52:17 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 12:52:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 12:53:34 +0800
Message-ID: <20200102045334.32269-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CBF45406AB15.A8874
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cmd2: upgrade 0.9.21 -> 0.9.22
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
X-List-Received-Date: Thu, 02 Jan 2020 04:52:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc           | 4 ++--
 .../python/{python-cmd2_0.9.21.bb => python-cmd2_0.9.22.bb}   | 0
 .../python/{python3-cmd2_0.9.21.bb => python3-cmd2_0.9.22.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.21.bb => python-cmd2_0.9.22.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.21.bb => python3-cmd2_0.9.22.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index c5cd663e6..ceaa181d5 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "0e1ce6a2fd8846c2a9e0de2ceb1fa461"
-SRC_URI[sha256sum] = "8880fea501bb45a42e8ddde18023d336ccf72f187c4b03e9ee9f13d719ecbd5f"
+SRC_URI[md5sum] = "90dccab3a20106c543ef85d2bee720bb"
+SRC_URI[sha256sum] = "ba244b07c0b465ff54a6838dc61919599141dc92de1bf00bb0a70875189155e6"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.21.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.21.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.22.bb
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.21.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.21.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_0.9.22.bb
-- 
2.20.1




