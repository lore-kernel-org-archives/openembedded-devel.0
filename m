Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.15297.1612661350898004580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="104284759"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 09:29:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2210A4CE6033
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Feb 2021 09:29:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 09:29:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.1.8 -> 1.1.9
Date: Sun, 7 Feb 2021 21:29:03 +0800
Message-ID: <1612704543-4923-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2210A4CE6033.AFAF5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.1.8.bb => zchunk_1.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.8.bb => zchunk_1.1.9.bb} (90%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb
similarity index 90%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb
index ee2d8801e..ab7b71ef7 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.8.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
 
-SRCREV = "5715157da35898a7cb3293b7a5394ba23715b5a4"
+SRCREV = "fe3e3af49fd30b68c21a9fcaac340ad8e7f91055"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.25.1



