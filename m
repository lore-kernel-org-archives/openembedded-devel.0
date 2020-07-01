Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.16186.1593586923921754378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 00:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616740"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:01:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 329B34CE5474
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2020 14:51:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 15:01:35 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest: upgrade 5.4.2 -> 5.4.3
Date: Wed, 1 Jul 2020 15:01:28 +0800
Message-ID: <1593586888-23124-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 329B34CE5474.A1B3E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-pytest_5.4.2.bb => python3-pytest_5.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.2.bb => python3-pytest_5.4.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
index 9258c21ca..ca67223db 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
@@ -3,7 +3,7 @@ SUMMARY = "Simple powerful testing with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[sha256sum] = "eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698"
+SRC_URI[sha256sum] = "7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-- 
2.17.1



