Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5356.1585792215279524423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363932"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:50:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 121EF406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:39:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:50:10 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl][PATCH] libextutils-cppguess-perl: upgrade 0.20 -> 0.21
Date: Thu, 2 Apr 2020 18:50:07 +0800
Message-ID: <1585824607-15906-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 121EF406AB15.A8698
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ppguess-perl_0.20.bb => libextutils-cppguess-perl_0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.20.bb => libextutils-cppguess-perl_0.21.bb} (89%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb
similarity index 89%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb
index 594899b07..a11b4d2db 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb
@@ -12,8 +12,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[md5sum] = "d6ddd5568c84f4c7b11b996b65f2ea3b"
-SRC_URI[sha256sum] = "12bf914708885265b5c3b0b8bfb0a9294cf132d5ca30d54bda0e00335fb43e61"
+SRC_URI[md5sum] = "62bdf731bcbe988d07486836e11585f7"
+SRC_URI[sha256sum] = "ff629178321a1e591b83f809712593eae4408a413aa448654bce59b156f24153"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.17.1



