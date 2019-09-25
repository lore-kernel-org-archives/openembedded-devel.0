Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFEB6C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 06:44:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,546,1559491200"; d="scan'208";a="75984131"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Sep 2019 14:44:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0B7C34CE14FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:44:17 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 25 Sep 2019 14:44:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 14:44:11 +0800
Message-ID: <20190925064411.21536-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 0B7C34CE14FD.AEC8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xterm: upgrade 348 -> 349
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
X-List-Received-Date: Wed, 25 Sep 2019 06:44:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_348.bb => xterm_349.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_348.bb => xterm_349.bb} (88%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_348.bb b/meta-oe/recipes-graphics/xorg-app/xterm_349.bb
similarity index 88%
rename from meta-oe/recipes-graphics/xorg-app/xterm_348.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_349.bb
index 2dd8322..137a165 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_348.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_349.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "05340ef6eabb96826953346c64b35225"
-SRC_URI[sha256sum] = "8b1f5121dbf3690de9d85a3b9329e3357021705dd7c21da192e47542769275be"
+SRC_URI[md5sum] = "194012229738f74bc44e7c0f5f6bf0c8"
+SRC_URI[sha256sum] = "39a6a3d3724f9a0a068f8cc353ab0c82831f0a43abb24470d933af299658475f"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.7.4




