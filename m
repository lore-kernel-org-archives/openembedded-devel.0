Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 556D57586F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 09:19:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98672916"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2015 17:22:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6L9HP3f007818
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 17:17:25 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 21 Jul 2015 17:19:12 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 17:19:02 +0800
Message-ID: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] bdftopcf: upgrade 1.0.4 -> 1.0.5
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
X-List-Received-Date: Tue, 21 Jul 2015 09:19:14 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{bdftopcf_1.0.4.bb => bdftopcf_1.0.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{bdftopcf_1.0.4.bb => bdftopcf_1.0.5.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb
index 5009d54..35d5002 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
 DEPENDS = "libxfont"
 
-SRC_URI[md5sum] = "96a648a332160a7482885800f7a506fa"
-SRC_URI[sha256sum] = "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb3e16946e5ffd2798"
+SRC_URI[md5sum] = "53a48e1fdfec29ab2e89f86d4b7ca902"
+SRC_URI[sha256sum] = "38f447be0c61f94c473f128cf519dd0cff63b5d7775240a2e895a183a61e2026"
 
 BBCLASSEXTEND = "native"
-- 
1.8.4.2


