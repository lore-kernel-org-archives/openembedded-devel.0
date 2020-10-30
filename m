Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9365.1604036362934598720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749404"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:39:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A3374CE34CF
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:39:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:39:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 7.0.3 -> 7.1.0
Date: Fri, 30 Oct 2020 13:39:06 +0800
Message-ID: <1604036346-71022-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2A3374CE34CF.A22FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.0.3.bb => fmt_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.0.3.bb => fmt_7.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.0.3.bb b/meta-oe/recipes-support/fmt/fmt_7.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_7.0.3.bb
rename to meta-oe/recipes-support/fmt/fmt_7.1.0.bb
index d52731161..8add37aa6 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "cd4af11efc9c622896a3e4cb599fa28668ca3d05"
+SRCREV = "4fe0b11195b7cd71f39253c44db2c9dddf6b82d4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



