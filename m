Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2288C7F821
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:24:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77779551"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 13:24:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 84EDC41B7076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 13:16:02 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 13:24:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 13:24:04 +0800
Message-ID: <20191101052404.5844-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 84EDC41B7076.A7F78
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-prompt-toolkit: upgrade 2.0.4 -> 2.0.10
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
X-List-Received-Date: Fri, 01 Nov 2019 05:24:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc | 4 ++--
 ...rompt-toolkit_2.0.4.bb => python-prompt-toolkit_2.0.10.bb} | 0
 ...ompt-toolkit_2.0.4.bb => python3-prompt-toolkit_2.0.10.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_2.0.4.bb => python-prompt-toolkit_2.0.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_2.0.4.bb => python3-prompt-toolkit_2.0.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index ef1b05639..91aa7bb19 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "8db8b8e40e91bc6dce133d8d5727a717"
-SRC_URI[sha256sum] = "ff58ce8bb82c11c43416dd3eec7701dcbe8c576e2d7649f1d2b9d21a2fd93808"
+SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
+SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.4.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.4.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.4.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
-- 
2.20.1




