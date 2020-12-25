Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5817.1608860197921228436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:36:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C9B8D4CE5468
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 09:36:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:36:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.2.5 -> 2.3.0
Date: Fri, 25 Dec 2020 09:36:31 +0800
Message-ID: <1608860191-71268-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C9B8D4CE5468.A3B2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../c-periphery/{c-periphery_2.2.5.bb => c-periphery_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.2.5.bb => c-periphery_2.3.0.bb} (90%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb
similarity index 90%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb
index ff05227aa..a49d13692 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
-SRCREV = "513f5edbcf2f2ec5c0cd711d1cc312eb2d753f1b"
+SRCREV = "8c9f87227b99ac74509b01602dc21d814fe91516"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



