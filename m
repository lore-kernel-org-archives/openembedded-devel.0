Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 26CB17656E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105257"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3ii1c018162
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:44 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:35 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:18 +0800
Message-ID: <1438314380-3834-6-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 6/8] xlsfonts: upgrade 1.0.4 -> 1.0.5
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:39 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xlsfonts_1.0.4.bb => xlsfonts_1.0.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsfonts_1.0.4.bb => xlsfonts_1.0.5.bb} (65%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb
similarity index 65%
rename from meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb
index e6985d0..9feed75 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.5.bb
@@ -6,5 +6,5 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
-SRC_URI[md5sum] = "5a2b476c2d84759529f01e0cd06145fe"
-SRC_URI[sha256sum] = "28179185ec2bf81dfe13652d65bdb2a4ae74e2775df591a62d66a70f80e90cd2"
+SRC_URI[md5sum] = "6f5711bef8c765857a0887a91476283b"
+SRC_URI[sha256sum] = "40295bec35077cee93be2e4c26cc00268ed6ace779ae6e97766a866c1e3927fa"
-- 
1.8.4.2


