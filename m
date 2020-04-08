Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.3960.1586311020761657731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653267"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:57:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 218CC49DF14A
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:57:05 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:57:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-aws-iot-device-sdk-python: upgrade 1.4.7 -> 1.4.8
Date: Wed, 8 Apr 2020 02:04:10 -0700
Message-ID: <1586336650-19326-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 218CC49DF14A.A1F95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...on_1.4.7.bb => python3-aws-iot-device-sdk-python_1.4.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.4.7.bb => python3-aws-iot-device-sdk-python_1.4.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
index 78e024bd1..f763067cf 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "\
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
 
-SRC_URI[md5sum] = "2b3df629827d8bc18ca4d927b4885a17"
-SRC_URI[sha256sum] = "7e67c8cfeee8a1c8fd251bcc418de9d4dca697753565c9a9e614525179d9555d"
+SRC_URI[md5sum] = "d05596f02774ea39517765c5dced874a"
+SRC_URI[sha256sum] = "bcd68cb7fdb044dbd5e5d3a02c311b25717c0376168e7c992982130f19c51b03"
 
 inherit pypi setuptools3
 
-- 
2.17.1



