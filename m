Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 071F162134
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 05:11:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78437678"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 13:11:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CA434CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:02:55 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 13:11:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 13:11:38 +0800
Message-ID: <20191114051138.27741-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0CA434CE1510.AA8B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-requests-oauthlib: upgrade 0.8.0 -> 1.3.0
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
X-List-Received-Date: Thu, 14 Nov 2019 05:11:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-requests-oauthlib.inc      | 4 ++--
 ...ts-oauthlib_0.8.0.bb => python-requests-oauthlib_1.3.0.bb} | 0
 ...s-oauthlib_0.8.0.bb => python3-requests-oauthlib_1.3.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests-oauthlib_0.8.0.bb => python-requests-oauthlib_1.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests-oauthlib_0.8.0.bb => python3-requests-oauthlib_1.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
index 4bc6a368c..7c4d85f2a 100644
--- a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
@@ -1,7 +1,7 @@
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
 
-SRC_URI[md5sum] = "4358a879a4377393bcfd37d0f9ae6d4d"
-SRC_URI[sha256sum] = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
+SRC_URI[md5sum] = "1ebcd55f1b1b9281940b4bc33010e2ba"
+SRC_URI[sha256sum] = "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
rename to meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
-- 
2.20.1




