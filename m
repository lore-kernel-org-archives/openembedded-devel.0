Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6674.1589433202445211599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2020 22:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
   d="scan'208";a="92037687"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 May 2020 13:13:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8D34650A999D
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 13:13:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 13:13:20 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python][PATCH] python3-pyroute2: upgrade 0.5.11 -> 0.5.12
Date: Thu, 14 May 2020 22:13:41 +0800
Message-ID: <1589465621-3319-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 8D34650A999D.A4A36
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
index a4b8aa3988..440f8993c9 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "7005db01604663fc2ecc089925980e05"
-SRC_URI[sha256sum] = "05e959f1a89d715158b91fe83b67946a4441e5e098cc225f4df78a3765ac4af2"
+SRC_URI[md5sum] = "4370e9a5875486a1223705ea9b001eff"
+SRC_URI[sha256sum] = "0157801c5496177856c3296b590065e691b041a3adde6fb8ffad2a8d05013ed3"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1



