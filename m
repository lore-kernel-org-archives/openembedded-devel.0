Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3662.1599787414250843029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114414"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:23:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A36AE48990E7
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:23:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:23:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gsoap: upgrade 2.0.105 -> 2.0.106
Date: Fri, 11 Sep 2020 21:23:29 +0800
Message-ID: <1599830609-15038-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A36AE48990E7.A54AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gsoap/{gsoap_2.8.105.bb => gsoap_2.8.106.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.105.bb => gsoap_2.8.106.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb
index 70807de2a..0249d09e4 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "ce91e46d3abc1d720566b13298fbc367"
-SRC_URI[sha256sum] = "aa20c535cf08f1576bebad97cc6159ca57c68bc43acfc9a296e4e9faf041097e"
+SRC_URI[md5sum] = "0925d25bc455047b01d4fe9814d30173"
+SRC_URI[sha256sum] = "4e74838baf5437e95ae17aa3efb48bd0621f483bff4424f6255fcf327ff80765"
 
 inherit autotools
 
-- 
2.25.1



