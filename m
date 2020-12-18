Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.6834.1608279000259749360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708877"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:10:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C97648990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:10:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:10:05 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.1.7 -> 1.1.8
Date: Fri, 18 Dec 2020 16:10:07 +0800
Message-ID: <1608279007-111859-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0C97648990D2.A4D73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.1.7.bb => zchunk_1.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.7.bb => zchunk_1.1.8.bb} (90%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb
similarity index 90%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb
index df75a6e81..ee2d8801e 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
 
-SRCREV = "45720028e69f09d1bec3c6a2af802ae2b06feb6e"
+SRCREV = "5715157da35898a7cb3293b7a5394ba23715b5a4"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.25.1



