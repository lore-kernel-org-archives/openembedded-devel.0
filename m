Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.8419.1607047346239048673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,390,1599494400"; 
   d="scan'208";a="102046134"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:02:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EF8034CE5CF8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:02:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:02:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 7.1.2 -> 7.1.3
Date: Fri, 4 Dec 2020 10:02:20 +0800
Message-ID: <1607047340-62431-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EF8034CE5CF8.A3A00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.1.2.bb => fmt_7.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.1.2.bb => fmt_7.1.3.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.2.bb b/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_7.1.2.bb
rename to meta-oe/recipes-support/fmt/fmt_7.1.3.bb
index 70b39bed9..9820b8647 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.1.2.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "cc09f1a6798c085c325569ef466bcdcffdc266d4"
+SRCREV = "7bdf0628b1276379886c7f6dda2cef2b3b374f0b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



