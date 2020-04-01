Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.2747.1585704785349458333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,329,1580745600"; 
   d="scan'208";a="88306237"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Apr 2020 09:33:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DF1E49DF129
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2020 09:22:49 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 09:33:06 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Apr 2020 09:33:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] gsoap: update 2.8.99 -> 2.8.100
Date: Wed, 1 Apr 2020 02:06:41 -0700
Message-ID: <1585732005-8348-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9DF1E49DF129.A58CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gsoap/{gsoap_2.8.99.bb => gsoap_2.8.100.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.99.bb => gsoap_2.8.100.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
index a5535ee91..0b4eac889 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "9bba04cf88211762ee4cf35e03c65662"
-SRC_URI[sha256sum] = "c1c99a64eecf96cfd781a611171b58a39326f5811eb98c619aa7c54ec7bcc84b"
+SRC_URI[md5sum] = "f0fc5394286753eff657cf62b46d024b"
+SRC_URI[sha256sum] = "11b4f99d28392e3e1aeb29bfd006a4f1f40e7fdd7a3f3444ee69014d415f09f2"
 
 inherit autotools
 
-- 
2.17.1



