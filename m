Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web09.2380.1609832419178500403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:40:16 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AA1454CE601E
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 Jan 2021 15:40:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:40:15 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyephem: upgrade 3.7.7.0 -> 3.7.7.1
Date: Tue, 5 Jan 2021 15:40:13 +0800
Message-ID: <1609832413-108299-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AA1454CE601E.A752E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} (69%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
similarity index 69%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
index 38b3c0a4f..969b9377a 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
 
-SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
-SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436"
+SRC_URI[md5sum] = "554bcc4f2354b7d0b2a8be7f58d5e71b"
+SRC_URI[sha256sum] = "36b51a8dc7cfdeb456dd6b8ab811accab8341b2d562ee3c6f4c86f6d3dbb984e"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.25.1



