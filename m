Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.13710.1606442836466085740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800921"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:07:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F28894CE5CE3
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:07:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:07:12 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cloc: upgrade 1.84 -> 1.88
Date: Fri, 27 Nov 2020 10:07:10 +0800
Message-ID: <1606442830-117541-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F28894CE5CE3.A28D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_1.84.bb => cloc_1.88.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.84.bb => cloc_1.88.bb} (79%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.84.bb b/meta-oe/recipes-devtools/cloc/cloc_1.88.bb
similarity index 79%
rename from meta-oe/recipes-devtools/cloc/cloc_1.84.bb
rename to meta-oe/recipes-devtools/cloc/cloc_1.88.bb
index 3e46c726c..b6a4ae773 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.84.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.88.bb
@@ -6,8 +6,8 @@ LICENSE="GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "a52f3843825377cfa4e4b3b30a567ab4"
-SRC_URI[sha256sum] = "c3f0a6bd2319110418ccb3e55a7a1b6d0edfd7528bfd2ae5d530938abe90f254"
+SRC_URI[md5sum] = "9f12f29c824ef61c5eaba6cf2dd6e183"
+SRC_URI[sha256sum] = "e4e30f083bf4e4a5efbe29efa0f6cefa223ba4e841ad1337653ad1f52702dc6f"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 
-- 
2.25.1



