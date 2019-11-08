Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B99C77FC49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:30:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78051443"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 14:30:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E3134CE19F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 14:22:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 8 Nov 2019 14:30:15 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 18:10:00 +0800
Message-ID: <1573207800-79135-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9E3134CE19F6.A6C64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xterm: upgrade 349 -> 350
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
X-List-Received-Date: Fri, 08 Nov 2019 06:30:14 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_349.bb => xterm_350.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_349.bb => xterm_350.bb} (88%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_349.bb b/meta-oe/recipes-graphics/xorg-app/xterm_350.bb
similarity index 88%
rename from meta-oe/recipes-graphics/xorg-app/xterm_349.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_350.bb
index 137a165..d98ce47 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_349.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_350.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "194012229738f74bc44e7c0f5f6bf0c8"
-SRC_URI[sha256sum] = "39a6a3d3724f9a0a068f8cc353ab0c82831f0a43abb24470d933af299658475f"
+SRC_URI[md5sum] = "189b593841189da66bc1cea92df602a5"
+SRC_URI[sha256sum] = "aefb59eefd310268080d1a90a447368fb97a9a6737bfecfc3800bf6cc304104d"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.7.4




