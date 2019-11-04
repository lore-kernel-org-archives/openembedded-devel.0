Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 248F16D74B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 01:39:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,265,1569254400"; d="scan'208";a="77870514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 09:39:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E42D64CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 09:31:47 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 09:39:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2019 09:40:08 +0800
Message-ID: <20191104014008.17756-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E42D64CE1511.A7554
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyjks: upgrade 17.1.1 -> 19.0.0
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
X-List-Received-Date: Mon, 04 Nov 2019 01:39:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyjks.inc          | 4 ++--
 .../python/{python-pyjks_17.1.1.bb => python-pyjks_19.0.0.bb} | 0
 .../{python3-pyjks_17.1.1.bb => python3-pyjks_19.0.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyjks_17.1.1.bb => python-pyjks_19.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyjks_17.1.1.bb => python3-pyjks_19.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyjks.inc b/meta-python/recipes-devtools/python/python-pyjks.inc
index d866c5650..9a066f7f1 100644
--- a/meta-python/recipes-devtools/python/python-pyjks.inc
+++ b/meta-python/recipes-devtools/python/python-pyjks.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/kurtbrose/pyjks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
 
-SRC_URI[md5sum] = "d53501e7c80d465969742bc6bee91d49"
-SRC_URI[sha256sum] = "709c44a303dd6b2464078ebeb677417e717818d4b3dc3844a462bef9d215dcc8"
+SRC_URI[md5sum] = "b6e8f3b91be355d15e3ba99de2cccf9b"
+SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb b/meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb
rename to meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb b/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
-- 
2.20.1




