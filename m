Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8462.1609726736222920252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150941"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:18:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CAC0B4CE546D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:18:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:18:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-c: upgrade 1.3.7 -> 1.3.8
Date: Mon, 4 Jan 2021 22:18:48 +0800
Message-ID: <1609769928-7611-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CAC0B4CE546D.A5B73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.7.bb => paho-mqtt-c_1.3.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.7.bb => paho-mqtt-c_1.3.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
index 151228bcb..f9b503a2c 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "e047e25d34d53b4b265649144a3cac3b01eee76c"
+SRCREV = "317fb008e1541838d1c29076d2bc5c3e4b6c4f53"
 
 DEPENDS = "openssl"
 
-- 
2.25.1



