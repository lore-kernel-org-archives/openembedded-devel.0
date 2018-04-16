Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC16744CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 02:24:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38894541"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Apr 2018 10:24:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A0D904D0EFF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 10:24:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 16 Apr 2018 10:24:17 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2018 19:23:59 +0800
Message-ID: <1523877839-28714-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: A0D904D0EFF5.AB048
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xwud: 1.0.4 -> 1.0.5
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
X-List-Received-Date: Mon, 16 Apr 2018 02:24:16 -0000
Content-Type: text/plain

Upgrade xwud from 1.0.4 to 1.0.5.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xwud_1.0.4.bb => xwud_1.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwud_1.0.4.bb => xwud_1.0.5.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xwud_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb
index 33bd7f0..7cb550d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb
@@ -8,5 +8,5 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31e8892c80b7a0c1c5f37c8e8ae6d794"
 
-SRC_URI[md5sum] = "3025b152b4f13fdffd0c46d0be587be6"
-SRC_URI[sha256sum] = "d6b3a09ccfe750868e26bd2384900ab5ff0d434f7f40cd272a50eda8aaa1f8bd"
+SRC_URI[md5sum] = "79972093bb0766fcd0223b2bd6d11932"
+SRC_URI[sha256sum] = "99997051f8a892313f22edf41dab45864e86e7062ee9012d5dbb6a40fc6b10a9"
-- 
2.7.4




