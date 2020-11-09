Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5415.1604885245850906584
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 17:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101066310"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 09:27:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 971684CE3A51
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 09:27:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 09:27:24 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 7.1.0 -> 7.1.1
Date: Mon, 9 Nov 2020 09:27:22 +0800
Message-ID: <1604885242-58627-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 971684CE3A51.A18C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.1.0.bb => fmt_7.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.1.0.bb => fmt_7.1.1.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.0.bb b/meta-oe/recipes-support/fmt/fmt_7.1.1.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_7.1.0.bb
rename to meta-oe/recipes-support/fmt/fmt_7.1.1.bb
index 8add37aa6..61e965dbe 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.1.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.1.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "4fe0b11195b7cd71f39253c44db2c9dddf6b82d4"
+SRCREV = "5f7f7b954d0e958f3d94f3d906177c6a1090f079"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



