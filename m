Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB0DA757A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 04:14:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99183320"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 12:18:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t734Cxhn003844
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Aug 2015 12:12:59 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 12:14:52 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Aug 2015 12:14:34 +0800
Message-ID: <1438575274-1636-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438575274-1636-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438575274-1636-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 2/2] ttf-dejavu: upgrade 2.23 -> 2.35
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
X-List-Received-Date: Mon, 03 Aug 2015 04:14:53 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../ttf-fonts/{ttf-dejavu_2.23.bb => ttf-dejavu_2.35.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-dejavu_2.23.bb => ttf-dejavu_2.35.bb} (92%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
similarity index 92%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
index 2b73b1e..3ce791b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
@@ -40,5 +40,5 @@ FILES_${PN}-serif           = "${datadir}/fonts/truetype/DejaVuSerif.ttf ${datad
 FILES_${PN}-serif-condensed = "${datadir}/fonts/truetype/DejaVuSerifCondensed*.ttf"
 FILES_${PN}-common          = "${sysconfdir}"
 
-SRC_URI[md5sum] = "ff871dff0b3e8a11cd5c54478f11073f"
-SRC_URI[sha256sum] = "243642a1c3f4b6fd00125f5772ac5c8e4d0bb6586f5abb05829ead4b83ad5233"
+SRC_URI[md5sum] = "59eaca5acf5c7c8212e92778e3e01f32"
+SRC_URI[sha256sum] = "f6d7965586101ff3a8a5c3ec503e082bb6a9604ff53413e10702e5917c194d88"
-- 
1.8.4.2


