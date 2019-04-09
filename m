Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E326B6C0C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 02:16:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="58810673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2019 10:16:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4728B4CD5A17
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:16:55 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 9 Apr 2019 10:16:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 10:17:33 +0800
Message-ID: <20190409021733.3835-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 4728B4CD5A17.A7E5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xstdcmap: upgrade 1.0.3 -> 1.0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2019 02:16:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xstdcmap_1.0.3.bb to xstdcmap_1.0.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xstdcmap_1.0.3.bb => xstdcmap_1.0.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xstdcmap_1.0.3.bb => xstdcmap_1.0.4.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
index 99f70364b..9d523bd7b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "eb5473acaef15a5db9b50df29c6a7f90"
-SRC_URI[sha256sum] = "f648e2b0cf16aa29856de998e2c7204be39dc1f8daeda9464d32288e0b580fc1"
+SRC_URI[md5sum] = "da67142c128d18386ff145882e0afc66"
+SRC_URI[sha256sum] = "06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b"
 
-- 
2.20.1




