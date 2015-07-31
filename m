Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 48AE976576
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105255"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3igiL018158
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:42 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:17 +0800
Message-ID: <1438314380-3834-5-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 5/8] xlsatoms: upgrade 1.1.1 -> 1.1.2
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:38 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xlsatoms_1.1.1.bb => xlsatoms_1.1.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsatoms_1.1.1.bb => xlsatoms_1.1.2.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.1.bb b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.1.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb
index dd43213..723d4e2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "9d0e16d116d1c89e6b668c1b2672eb57"
-SRC_URI[sha256sum] = "3b8bd98c1ca9789178db80bca75556b0c76e5092403014995d5ddaa3117536f9"
+SRC_URI[md5sum] = "5dcb6e6c4b28c8d7aeb45257f5a72a7d"
+SRC_URI[sha256sum] = "47e5dc7c3dbda6db2cf8c00cedac1722835c1550aa21cfdbc9ba83906694dea4"
-- 
1.8.4.2


