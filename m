Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B57BF7452F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 01:49:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39008415"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2018 09:49:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EAECC4D0EFF6;
	Tue, 17 Apr 2018 09:49:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 17 Apr 2018 09:49:29 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 18:49:03 +0800
Message-ID: <1523962143-65861-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: EAECC4D0EFF6.AE902
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Zheng Ruoqin <zhrngrq.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] xlsfonts: 1.0.5 -> 1.0.6
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
X-List-Received-Date: Tue, 17 Apr 2018 01:49:30 -0000
Content-Type: text/plain

Upgrade xlsfonts from 1.0.5 to 1.0.6.

Signed-off-by: Zheng Ruoqin <zhrngrq.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xlsfonts_1.0.5.bb => xlsfonts_1.0.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsfonts_1.0.5.bb => xlsfonts_1.0.6.bb} (65%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb
similarity index 65%
rename from meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb
index 9feed75..76b76e4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb
@@ -6,5 +6,5 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
-SRC_URI[md5sum] = "6f5711bef8c765857a0887a91476283b"
-SRC_URI[sha256sum] = "40295bec35077cee93be2e4c26cc00268ed6ace779ae6e97766a866c1e3927fa"
+SRC_URI[md5sum] = "5774fd4f518b3f338f2b28f270e04bfc"
+SRC_URI[sha256sum] = "89b80b3a030006ab6cef717be286c12f2477894b227158b1e6133274f6ebd368"
-- 
2.7.4




