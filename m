Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.127425.1597988057060953749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 22:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98374601"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 13:34:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id ABE3348990E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:34:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 13:34:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] links: upgrade 2.20.2 -> 2.21
Date: Sat, 22 Aug 2020 01:33:56 +0800
Message-ID: <1598031241-3582-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ABE3348990E6.A52DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/links/{links_2.20.2.bb => links_2.21.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/links/{links_2.20.2.bb => links_2.21.bb} (77%)

diff --git a/meta-oe/recipes-support/links/links_2.20.2.bb b/meta-oe/recipes-support/links/links_2.21.bb
similarity index 77%
rename from meta-oe/recipes-support/links/links_2.20.2.bb
rename to meta-oe/recipes-support/links/links_2.21.bb
index 1a36291e5..b6048c1d3 100644
--- a/meta-oe/recipes-support/links/links_2.20.2.bb
+++ b/meta-oe/recipes-support/links/links_2.21.bb
@@ -9,7 +9,7 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
 
-SRC_URI[md5sum] = "ee39e612249440d0497535d0dafc3c0e"
-SRC_URI[sha256sum] = "4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424"
+SRC_URI[md5sum] = "b88a46733d6932442ed8a6b751aac6b4"
+SRC_URI[sha256sum] = "285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63"
 SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
-- 
2.25.1



