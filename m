Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6747.1586915485047325970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89044001"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:51:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B0EC649DF12A
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:51:15 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:51:23 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cheetah: upgrade 3.2.4 -> 3.2.5b1
Date: Wed, 15 Apr 2020 01:31:41 -0700
Message-ID: <1586939501-29659-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B0EC649DF12A.A53D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5b1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5b1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
index 05882d087..289b70298 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
@@ -10,5 +10,5 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "8c0ac643263ffc3454fb321342284d0a"
-SRC_URI[sha256sum] = "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
+SRC_URI[md5sum] = "5c07ebe4a31edf605a5ab2172bfc411c"
+SRC_URI[sha256sum] = "52f4abe6cb862fbc6047ac17dc3d7b4bb0faf82621fe911fefbb04b7a5d5a7ee"
-- 
2.17.1



