Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE587450B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 01:48:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39008311"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2018 09:48:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 208824D0EFF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 09:48:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 17 Apr 2018 09:48:26 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 18:47:56 +0800
Message-ID: <1523962076-65749-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 208824D0EFF6.A5FD1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xlsclients: 1.1.3 -> 1.1.4
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
X-List-Received-Date: Tue, 17 Apr 2018 01:48:30 -0000
Content-Type: text/plain

Upgrade xlsclients from 1.1.3 to 1.1.4

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xlsclients_1.1.3.bb => xlsclients_1.1.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsclients_1.1.3.bb => xlsclients_1.1.4.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb
index 583a531..42bda7e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=350e1b718a56df39cfe8ca9345ea4575"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "9fbf6b174a5138a61738a42e707ad8f5"
-SRC_URI[sha256sum] = "5d9666fcc6c3de210fc70d5a841a404955af709a616fde530fe4e8f7723e3d3d"
+SRC_URI[md5sum] = "4fa92377e0ddc137cd226a7a87b6b29a"
+SRC_URI[sha256sum] = "773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1"
-- 
2.7.4




