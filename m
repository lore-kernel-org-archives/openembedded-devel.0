Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7898.1608613381898171895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 21:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,438,1599494400"; 
   d="scan'208";a="102806890"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Dec 2020 13:02:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 138A34CE601B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 13:02:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Dec 2020 13:02:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-aenum: upgrade 2.2.4 -> 2.2.6
Date: Tue, 22 Dec 2020 13:02:28 +0800
Message-ID: <1608613348-66835-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 138A34CE601B.AFF03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-aenum_2.2.4.bb => python3-aenum_2.2.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.4.bb => python3-aenum_2.2.6.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
rename to meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
index da77a5c75..061770a93 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[md5sum] = "8983562361efe5be865617341dadbb9b"
-SRC_URI[sha256sum] = "81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864"
+SRC_URI[md5sum] = "52ec17f5efdfa13952657fe954cd6d99"
+SRC_URI[sha256sum] = "260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae"
 
 inherit pypi setuptools3
 
-- 
2.25.1



