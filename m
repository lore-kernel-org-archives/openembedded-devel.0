Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A088B7F641
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 02:15:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="77977967"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 10:15:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19B734CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 10:07:02 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 7 Nov 2019 10:15:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 10:15:25 +0800
Message-ID: <20191107021525.9984-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 19B734CE1646.A7180
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cython: upgrade 0.29.13 -> 0.29.14
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
X-List-Received-Date: Thu, 07 Nov 2019 02:15:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cython.inc         | 4 ++--
 .../{python-cython_0.29.13.bb => python-cython_0.29.14.bb}    | 0
 .../{python3-cython_0.29.13.bb => python3-cython_0.29.14.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.29.13.bb => python-cython_0.29.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.29.13.bb => python3-cython_0.29.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 426159465..3260e92ba 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "f8109a2a86cded40b3896ee7a63bc5a5"
-SRC_URI[sha256sum] = "c29d069a4a30f472482343c866f7486731ad638ef9af92bfe5fca9c7323d638e"
+SRC_URI[md5sum] = "6e2f139e30bb08d68366f9370d87964c"
+SRC_URI[sha256sum] = "e4d6bb8703d0319eb04b7319b12ea41580df44fd84d83ccda13ea463c6801414"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.29.13.bb b/meta-python/recipes-devtools/python/python-cython_0.29.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.29.13.bb
rename to meta-python/recipes-devtools/python/python-cython_0.29.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.13.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.29.13.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.29.14.bb
-- 
2.20.1




