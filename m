Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4481.1610680603556769754
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 19:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; 
   d="scan'208";a="103502041"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jan 2021 11:16:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AFB114CE1A08
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Jan 2021 11:16:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 11:16:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.3.0 -> 2.3.1
Date: Fri, 15 Jan 2021 23:16:28 +0800
Message-ID: <1610723788-7154-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AFB114CE1A08.A251D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../c-periphery/{c-periphery_2.3.0.bb => c-periphery_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.3.0.bb => c-periphery_2.3.1.bb} (90%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
similarity index 90%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
index a49d136924..effab9de90 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.3.0.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
-SRCREV = "8c9f87227b99ac74509b01602dc21d814fe91516"
+SRCREV = "23bfa4ab481edbad82a69ee385fc58ce03b63084"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



