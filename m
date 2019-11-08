Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C83347F8AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 08:00:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78055023"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 16:00:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 44C6C4CE1BF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 15:52:07 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 16:00:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 16:00:43 +0800
Message-ID: <20191108080043.9903-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 44C6C4CE1BF2.AA607
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-serpent: upgrade 1.25 -> 1.28
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
X-List-Received-Date: Fri, 08 Nov 2019 08:00:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Upgrade PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-serpent.inc      | 6 +++---
 .../{python-serpent_1.25.bb => python-serpent_1.28.bb}      | 0
 .../{python3-serpent_1.25.bb => python3-serpent_1.28.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.25.bb => python-serpent_1.28.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.25.bb => python3-serpent_1.28.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 2ba65706b..1a3aac07f 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5a8193ba89f1083617f32d522f6485e9"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
 
-SRC_URI[md5sum] = "0f9684622125a527fa4fbe2587738973"
-SRC_URI[sha256sum] = "264a028e059c1b557701ae7c567cdab330dbd228ff924489343efcb39bd828a0"
+SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
+SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.25.bb b/meta-python/recipes-devtools/python/python-serpent_1.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.25.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.28.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.25.bb b/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.25.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.28.bb
-- 
2.20.1




