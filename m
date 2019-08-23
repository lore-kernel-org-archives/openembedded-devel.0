Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B50807F311
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 05:36:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74143314"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 13:36:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8ED0A4CE03FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:36:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 13:36:08 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Aug 2019 14:35:55 +0900
Message-ID: <20190823053555.3370-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 8ED0A4CE03FC.A2BC4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-typing: upgrade 3.7.4 -> 3.7.4.1
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
X-List-Received-Date: Fri, 23 Aug 2019 05:36:10 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-typing.inc         | 4 ++--
 .../{python-typing_3.7.4.bb => python-typing_3.7.4.1.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-typing_3.7.4.bb => python-typing_3.7.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
index b392b7521..ab8ee81ec 100644
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typing"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
-SRC_URI[md5sum] = "8a3e4b822bac02b9b33c97e7d4f1521c"
-SRC_URI[sha256sum] = "53765ec4f83a2b720214727e319607879fec4acde22c4fbb54fa2604e79e44ce"
+SRC_URI[md5sum] = "0a1ebd4af65b4769e33459004eb20345"
+SRC_URI[sha256sum] = "91dfe6f3f706ee8cc32d38edbbf304e9b7583fb37108fef38229617f8b3eba23"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.7.4.bb b/meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-typing_3.7.4.bb
rename to meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb
-- 
2.17.1




