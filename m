Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3673.1599787443634525947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:24:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C409248990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:23:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:23:57 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] jasper: upgrade 2.0.19 -> 2.0.20
Date: Fri, 11 Sep 2020 21:23:58 +0800
Message-ID: <1599830638-15111-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C409248990D3.A43AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../jasper/{jasper_2.0.19.bb => jasper_2.0.20.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.19.bb => jasper_2.0.20.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
index e2bc9645f..356c78c0d 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https"
-SRCREV = "7d8cfd8ac16d1af9b51e5ccd781e898f0fbf57cc"
+SRCREV = "d10a710f31da3d079a984d35ff6cc82a853d25d7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



