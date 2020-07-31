Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.12449.1596173804938954081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:36:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AA7E14CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:36:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:36:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zlog: upgrade 1.2.14 -> 1.2.15
Date: Sat, 1 Aug 2020 01:36:38 +0800
Message-ID: <1596216999-3834-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AA7E14CE5059.A44FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-extended/zlog/{zlog_1.2.14.bb => zlog_1.2.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/zlog/{zlog_1.2.14.bb => zlog_1.2.15.bb} (89%)

diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.14.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
similarity index 89%
rename from meta-oe/recipes-extended/zlog/zlog_1.2.14.bb
rename to meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
index b94664c33c..7dde4182fb 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.14.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/HardySimpson/zlog"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "8fc78c3c65cb705953a2f3f9a813c3ef3c8b2270"
+SRCREV = "876099f3c66033f3de11d79f63814766b1021dbe"
 SRC_URI = "git://github.com/HardySimpson/zlog"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



