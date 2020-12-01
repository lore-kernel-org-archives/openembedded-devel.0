Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4351.1606789121505322013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914188"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:18:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FDB24CE5CFB
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:18:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:18:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.1.6 -> 1.1.7
Date: Tue, 1 Dec 2020 10:18:36 +0800
Message-ID: <1606789116-56835-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2FDB24CE5CFB.AC825
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.1.6.bb => zchunk_1.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.6.bb => zchunk_1.1.7.bb} (90%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb
similarity index 90%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb
index e041132b1..df75a6e81 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
 
-SRCREV = "f5593aa11584faa691c81b4898f0aaded47f8bf7"
+SRCREV = "45720028e69f09d1bec3c6a2af802ae2b06feb6e"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.25.1



