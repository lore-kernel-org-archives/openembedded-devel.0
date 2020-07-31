Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.12449.1596173804938954081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199890"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:36:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C6A04CE506F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:36:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:36:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] jasper: upgrade 2.0.16 -> 2.0.19
Date: Sat, 1 Aug 2020 01:36:39 +0800
Message-ID: <1596216999-3834-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596216999-3834-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596216999-3834-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4C6A04CE506F.A10BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../jasper/{jasper_2.0.16.bb => jasper_2.0.19.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.16.bb => jasper_2.0.19.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
index 1d5a29438a..e121ae9469 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.19.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/mdadams/jasper.git;protocol=https"
-SRCREV = "9aef6d91a82a8a6aecb575cbee57f74470603cc2"
+SRCREV = "7d8cfd8ac16d1af9b51e5ccd781e898f0fbf57cc"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



