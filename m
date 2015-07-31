Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F35547648B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105227"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:49:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3iYAH018128
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:34 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:26 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:13 +0800
Message-ID: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 1/8] xf86-input-void: upgrade 1.4.0 -> 1.4.1
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:27 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{xf86-input-void_1.4.0.bb => xf86-input-void_1.4.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-input-void_1.4.0.bb => xf86-input-void_1.4.1.bb} (58%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
similarity index 58%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
index fec64cb..ca0b486 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
@@ -4,5 +4,5 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
-SRC_URI[md5sum] = "93821f21e807260b05431c62437a8b32"
-SRC_URI[sha256sum] = "2ab95865252c64cc88050fa0089a74e063c357b71907bf9be7886047c4987505"
+SRC_URI[md5sum] = "5227013b52b3ca85d6b7ec8adea988d4"
+SRC_URI[sha256sum] = "f96e4f0a622821bf43a74bd419f2a18423343996c9d243c7e1430ba2d142339c"
-- 
1.8.4.2


