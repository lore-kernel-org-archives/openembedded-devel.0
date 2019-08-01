Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 82A3F7D39C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 07:52:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,333,1559491200"; d="scan'208";a="72655258"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Aug 2019 15:52:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 00AA04CDDD3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 15:52:14 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 15:52:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2019 15:51:32 +0800
Message-ID: <20190801075132.9760-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 00AA04CDDD3F.A0B27
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libsodium: upgrade 1.0.17 -> 1.0.18
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
X-List-Received-Date: Thu, 01 Aug 2019 07:52:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libsodium/{libsodium_1.0.17.bb => libsodium_1.0.18.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.17.bb => libsodium_1.0.18.bb} (71%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
similarity index 71%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
index 8d9302f..53b3ddc 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47203c753972e855179dfffe15188bee"
 
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "0f71e2680187a1558b5461e6879342c5"
-SRC_URI[sha256sum] = "0cc3dae33e642cc187b5ceb467e0ad0e1b51dcba577de1190e9ffa17766ac2b1"
+SRC_URI[md5sum] = "3ca9ebc13b6b4735acae0a6a4c4f9a95"
+SRC_URI[sha256sum] = "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
 
 inherit autotools
 
-- 
2.7.4




