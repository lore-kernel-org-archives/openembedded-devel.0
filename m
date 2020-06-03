Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.13118.1591188816663221566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 05:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93762382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 20:53:34 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 23A6B46B5FAD
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2020 20:53:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 20:53:30 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-pycodestyle: upgrade 2.5.0 -> 2.6.0
Date: Wed, 3 Jun 2020 20:53:13 +0800
Message-ID: <1591188793-15698-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 23A6B46B5FAD.A52D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...n3-pycodestyle_2.5.0.bb => python3-pycodestyle_2.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.5.0.bb => python3-pycodestyle_2.6.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
index 7f00ab629..4ad1f5493 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python style guide checker (formly called pep8)"
 HOMEPAGE = "https://pypi.org/project/pycodestyle"
 LICENSE = "MIT"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[md5sum] = "40e7a76f364a18f531aaba11a4476e21"
-SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
+SRC_URI[md5sum] = "e2fcdace728267d5fa3aa98e08ee40db"
+SRC_URI[sha256sum] = "c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e"
 
 inherit pypi setuptools3
 
-- 
2.17.1



