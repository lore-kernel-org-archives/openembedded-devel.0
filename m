Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4159.1606788992120267289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101913898"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:16:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 35EC54CE5CF5
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:16:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:16:20 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.2.4 -> 2.2.5
Date: Tue, 1 Dec 2020 10:16:12 +0800
Message-ID: <1606788972-56547-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 35EC54CE5CF5.A9364
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../c-periphery/{c-periphery_2.2.4.bb => c-periphery_2.2.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.2.4.bb => c-periphery_2.2.5.bb} (90%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb
similarity index 90%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb
index 621e174ff..ff05227aa 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.2.4.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.2.5.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
-SRCREV = "d34077d7ee45fa7d1947cc0174919452fac31597"
+SRCREV = "513f5edbcf2f2ec5c0cd711d1cc312eb2d753f1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



