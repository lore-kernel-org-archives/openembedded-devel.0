Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AC6226C13D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 05:48:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,465,1557158400"; d="scan'208";a="70922279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jul 2019 13:48:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CA634CDE8CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 13:48:32 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 8 Jul 2019 13:48:34 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 13:47:41 +0800
Message-ID: <20190708054741.30391-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 0CA634CDE8CC.AD093
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-typing: upgrade 3.6.6 -> 3.7.4
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
X-List-Received-Date: Mon, 08 Jul 2019 05:48:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-typing_3.6.6.bb to python-typing_3.7.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-typing.inc         | 4 ++--
 .../python/{python-typing_3.6.6.bb => python-typing_3.7.4.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-typing_3.6.6.bb => python-typing_3.7.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
index 82c2ab74f..b392b7521 100644
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typing"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
-SRC_URI[md5sum] = "64614206b4bdc0864fc0e0bccd69efc9"
-SRC_URI[sha256sum] = "4027c5f6127a6267a435201981ba156de91ad0d1d98e9ddc2aa173453453492d"
+SRC_URI[md5sum] = "8a3e4b822bac02b9b33c97e7d4f1521c"
+SRC_URI[sha256sum] = "53765ec4f83a2b720214727e319607879fec4acde22c4fbb54fa2604e79e44ce"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.6.6.bb b/meta-python/recipes-devtools/python/python-typing_3.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-typing_3.6.6.bb
rename to meta-python/recipes-devtools/python/python-typing_3.7.4.bb
-- 
2.20.1




