Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7249379B57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 04:38:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,267,1571673600"; d="scan'208";a="79419722"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 12:38:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0FC0D4CE20E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:29:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 12:38:21 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 03:07:18 -0800
Message-ID: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0FC0D4CE20E1.AC6E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH v2] python-cmd2: upgrade 0.9.19 -> 0.9.21
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
X-List-Received-Date: Mon, 02 Dec 2019 04:38:16 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc                   | 4 ++--
 .../python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.21.bb}           | 0
 .../python/{python3-cmd2_0.9.19.bb => python3-cmd2_0.9.21.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.21.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.19.bb => python3-cmd2_0.9.21.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index 3a6bf54..c5cd663 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "20f3f76b2aaf36a17372717b469ca969"
-SRC_URI[sha256sum] = "c81284083d993af18b8fef57d89d854d49d051d4c2c8a8e12d0281e369ac3682"
+SRC_URI[md5sum] = "0e1ce6a2fd8846c2a9e0de2ceb1fa461"
+SRC_URI[sha256sum] = "8880fea501bb45a42e8ddde18023d336ccf72f187c4b03e9ee9f13d719ecbd5f"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.21.bb
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.19.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.19.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_0.9.21.bb
-- 
2.7.4




