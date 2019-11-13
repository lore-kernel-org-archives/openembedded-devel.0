Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1427F2C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 06:52:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78397981"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 14:52:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E7D714CE1A0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:43:58 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 14:52:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2019 14:52:41 +0800
Message-ID: <20191113065241.11917-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E7D714CE1A0C.AAC41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-astroid: upgrade 2.3.2 -> 2.3.3
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
X-List-Received-Date: Wed, 13 Nov 2019 06:52:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-astroid.inc        | 4 ++--
 .../{python-astroid_2.3.2.bb => python-astroid_2.3.3.bb}      | 0
 .../{python3-astroid_2.3.2.bb => python3-astroid_2.3.3.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_2.3.2.bb => python-astroid_2.3.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.3.2.bb => python3-astroid_2.3.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 171d32015..e9a68789e 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "b2cd5c0383ff33c1410e737c2607aa7a"
-SRC_URI[sha256sum] = "09a3fba616519311f1af8a461f804b68f0370e100c9264a035aa7846d7852e33"
+SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
+SRC_URI[sha256sum] = "71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_2.3.2.bb b/meta-python/recipes-devtools/python/python-astroid_2.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_2.3.2.bb
rename to meta-python/recipes-devtools/python/python-astroid_2.3.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.3.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
-- 
2.20.1




