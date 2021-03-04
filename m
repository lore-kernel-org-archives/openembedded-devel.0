Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3909.1614846605984342609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105152089"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:30:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DDB7F4CE9E4B
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:30:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:30:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mailcap: upgrade 2.1.49 -> 2.1.52
Date: Thu, 4 Mar 2021 16:30:02 +0800
Message-ID: <1614846602-104869-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DDB7F4CE9E4B.A636F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mailcap/{mailcap_2.1.49.bb => mailcap_2.1.52.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.49.bb => mailcap_2.1.52.bb} (89%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb
similarity index 89%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb
index 537c458747..69e1788e94 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "d5701a1a541383c0eda328f4a6518751"
-SRC_URI[sha256sum] = "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe821dd248632d5601b59b5"
+SRC_URI[md5sum] = "3d1a14a80bb85564c323562670f1c01f"
+SRC_URI[sha256sum] = "e6f615ec2ffe705522075d960744534c443ece66acfb34fada38d567d8823639"
 
 inherit update-alternatives
 
-- 
2.25.1



