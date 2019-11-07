Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0E2C7F821
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 03:01:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="77980486"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 11:01:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9BF184B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 10:53:51 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 7 Nov 2019 11:01:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 11:02:15 +0800
Message-ID: <20191107030215.13708-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9BF184B6EC86.A90A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-dominate: upgrade 2.3.1 -> 2.4.0
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
X-List-Received-Date: Thu, 07 Nov 2019 03:02:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-dominate.inc       | 4 ++--
 .../{python-dominate_2.3.1.bb => python-dominate_2.4.0.bb}    | 0
 .../{python3-dominate_2.3.1.bb => python3-dominate_2.4.0.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dominate_2.3.1.bb => python-dominate_2.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.3.1.bb => python3-dominate_2.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dominate.inc b/meta-python/recipes-devtools/python/python-dominate.inc
index ecf74a0bc..7e499a6c7 100644
--- a/meta-python/recipes-devtools/python/python-dominate.inc
+++ b/meta-python/recipes-devtools/python/python-dominate.inc
@@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
-SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
+SRC_URI[md5sum] = "27d3aa7e0d67902c505e248e705e5e2e"
+SRC_URI[sha256sum] = "a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-numbers \
diff --git a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python-dominate_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
rename to meta-python/recipes-devtools/python/python-dominate_2.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
-- 
2.20.1




