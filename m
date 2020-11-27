Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.13767.1606442799749562228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800879"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:06:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D7CC4CE5440
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:06:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:06:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cjson: upgrade 1.7.13 -> 1.7.14
Date: Fri, 27 Nov 2020 10:06:32 +0800
Message-ID: <1606442792-117487-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0D7CC4CE5440.A2C82
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.13.bb => cjson_1.7.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.13.bb => cjson_1.7.14.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
index e6174821f..0e33275e2 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git"
-SRCREV = "39853e5148dad8dc5d32ea2b00943cf4a0c6f120"
+SRCREV = "d2735278ed1c2e4556f53a7a782063b31331dbf7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



