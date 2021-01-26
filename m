Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5848.1611623625893068383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 17:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
   d="scan'208";a="103824476"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 09:13:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C7C44CE6014
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 09:13:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 09:13:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-djangorestframework: upgrade 3.12.1 -> 3.12.2
Date: Tue, 26 Jan 2021 09:13:28 +0800
Message-ID: <1611623608-94159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7C7C44CE6014.A493B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...mework_3.12.1.bb => python3-djangorestframework_3.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.1.bb => python3-djangorestframework_3.12.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
index 60bdbaa9e..6742b87b2 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[md5sum] = "47d5ea46923a131c5fbefeb610c6ce2c"
-SRC_URI[sha256sum] = "d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249"
+SRC_URI[md5sum] = "e70d58ee2f83f11d4efe33162bb8af3b"
+SRC_URI[sha256sum] = "0898182b4737a7b584a2c73735d89816343369f259fea932d90dc78e35d8ac33"
 PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools3
-- 
2.25.1



