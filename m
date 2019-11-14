Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 170B17D25F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:31:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78434132"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 11:31:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 909594CE14FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:23:14 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 11:31:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 11:31:58 +0800
Message-ID: <20191114033158.3477-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 909594CE14FE.A9382
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest-helpers-namespace: upgrade 2016.7.10 -> 2019.1.8
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
X-List-Received-Date: Thu, 14 Nov 2019 03:31:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pytest-helpers-namespace.inc              | 6 +++---
 ....7.10.bb => python-pytest-helpers-namespace_2019.1.8.bb} | 0
 ...7.10.bb => python3-pytest-helpers-namespace_2019.1.8.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-helpers-namespace_2016.7.10.bb => python-pytest-helpers-namespace_2019.1.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-helpers-namespace_2016.7.10.bb => python3-pytest-helpers-namespace_2019.1.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
index a69867d91..c091ab976 100644
--- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
@@ -2,9 +2,9 @@ DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, howe
 HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cc99508c43d9d14fd51c7fac622ffd23"
 
-SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
-SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
+SRC_URI[md5sum] = "04ec1d8750f9b154e782a47cf8b30736"
+SRC_URI[sha256sum] = "4eff23a19f92410c0166f6dffbfa8901d3e14a80e97d70cd08428b6d597771ce"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
rename to meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
rename to meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
-- 
2.20.1




