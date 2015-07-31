Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2737476549
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105245"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3idO4018150
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:39 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:31 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:16 +0800
Message-ID: <1438314380-3834-4-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 4/8] xkbprint: upgrade 1.0.3 -> 1.0.4
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:32 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xkbprint_1.0.3.bb => xkbprint_1.0.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbprint_1.0.3.bb => xkbprint_1.0.4.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb
index 64b54dd..26977be 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "526b5ba87cccd05aa700fa628bcfda3e"
-SRC_URI[sha256sum] = "fa846db8e588018134bd550f80eb129e4ddfdb96f3b157603a57ae2cdf5892c0"
+SRC_URI[md5sum] = "3c25b40de530112c08bf7d229c5c6a28"
+SRC_URI[sha256sum] = "0b3faab8fefad03dfb7e866f634cf859822801de6b5fc6cf5e0a62857ed93e12"
-- 
1.8.4.2


