Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3045.1596768208107280924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 19:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,443,1589212800"; 
   d="scan'208";a="97744118"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Aug 2020 10:43:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A136C4CE34E7
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Aug 2020 10:43:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 Aug 2020 10:43:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gsoap: upgrade 2.8.103 -> 2.8.105
Date: Fri, 7 Aug 2020 22:43:17 +0800
Message-ID: <1596811399-7392-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A136C4CE34E7.A5DC2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gsoap/{gsoap_2.8.103.bb => gsoap_2.8.105.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.103.bb => gsoap_2.8.105.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb
index 8543c6f484..70807de2a1 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.105.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "3207ece9fc8ceb787091de93838f5952"
-SRC_URI[sha256sum] = "afe2ba08d2fa56adc3c774b6741587203a72140a255346e9947b8d2ee6c7d4b6"
+SRC_URI[md5sum] = "ce91e46d3abc1d720566b13298fbc367"
+SRC_URI[sha256sum] = "aa20c535cf08f1576bebad97cc6159ca57c68bc43acfc9a296e4e9faf041097e"
 
 inherit autotools
 
-- 
2.25.1



