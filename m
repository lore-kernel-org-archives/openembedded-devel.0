Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.32014.1613977063634097846
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104716610"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:57:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CA95E4CE730B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 14:57:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:57:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.3 -> 2.2.4
Date: Tue, 23 Feb 2021 02:57:27 +0800
Message-ID: <1614020247-4799-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CA95E4CE730B.A3E8D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gensio/{gensio_2.2.3.bb => gensio_2.2.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.3.bb => gensio_2.2.4.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb
index 89d4549892..a02442862c 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "88fe56696b19ffff3e16be1d46d062e835879740"
+SRCREV = "95cfb8f6d8985e2fb8ba51c4887dd70aa7551a03"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
-- 
2.25.1



