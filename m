Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA1775972
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 08:25:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98765239"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 16:29:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N8NjXE022074
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:23:45 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 16:25:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 16:25:27 +0800
Message-ID: <1437639927-4635-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libxaw: upgrade 1.0.10 -> 1.0.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2015 08:25:38 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-lib/{libxaw_1.0.10.bb => libxaw_1.0.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.10.bb => libxaw_1.0.13.bb} (83%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
similarity index 83%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
index 6963f5e..8ba5ac3 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 PE = "1"
 PR = "r2"
 
-SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
-SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
+SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
+SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
 
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
1.8.4.2


