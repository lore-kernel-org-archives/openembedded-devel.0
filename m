Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4749.1603432788153543119
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 22:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 13:59:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 37EB94CE1A08
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 13:59:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 13:59:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libpwquality: upgrade 1.4.2 -> 1.4.4
Date: Fri, 23 Oct 2020 13:59:43 +0800
Message-ID: <1603432783-100418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 37EB94CE1A08.A3484
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libpwquality_1.4.2.bb => libpwquality_1.4.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libpwquality/{libpwquality_1.4.2.bb => libpwquality_1.4.4.bb} (90%)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
similarity index 90%
rename from meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb
rename to meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
index 24d2f7ec1e..ee75a9847c 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/${SRCNAME}
            file://add-missing-python-include-dir-for-cross.patch \
 "
 
-SRC_URI[md5sum] = "ae6e61fc33f5dac0de5e847eb7520d71"
-SRC_URI[sha256sum] = "5263e09ee62269c092f790ac159112aed3e66826a795e3afec85fdeac4281c8e"
+SRC_URI[md5sum] = "1fe43f6641dbf1e1766e2a02cf68a9c3"
+SRC_URI[sha256sum] = "d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545"
 
 UPSTREAM_CHECK_URI = "https://github.com/libpwquality/libpwquality/releases"
 
-- 
2.25.1



