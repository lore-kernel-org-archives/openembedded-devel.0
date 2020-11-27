Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13781.1606442951874187769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800999"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:09:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DE8224CE5CDD
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:09:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:09:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libsigc++-3: upgrade 3.0.3 -> 3.0.6
Date: Fri, 27 Nov 2020 10:09:05 +0800
Message-ID: <1606442945-117721-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DE8224CE5CDD.A50FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libsigc++-3_3.0.3.bb => libsigc++-3_3.0.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.3.bb => libsigc++-3_3.0.6.bb} (77%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb
similarity index 77%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb
index fc4f5d649..7471308e4 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "8dca4559e732f47710370baa8bc2e66f"
-SRC_URI[sha256sum] = "e4f4866a894bdbe053e4fb22ccc6bc4b6851fd31a4746fdd20b2cf6e87c6edb6"
+SRC_URI[md5sum] = "8cc0c1df6b7d9c466555f4a2963ab06a"
+SRC_URI[sha256sum] = "b70edcf4611651c54a426e109b17196e1fa17da090592a5000e2d134c03ac5ce"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.25.1



