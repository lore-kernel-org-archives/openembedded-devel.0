Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.15999.1593586920215939664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 00:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616739"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:01:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E9C384CE5440
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2020 14:51:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 15:01:33 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-cryptography-vectors: upgrade 2.8 -> 2.9.2
Date: Wed, 1 Jul 2020 15:01:27 +0800
Message-ID: <1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E9C384CE5440.A44E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...y-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
index 948aab9e0..60316fc74 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
-SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
+SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
+SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1



