Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id AC2607199E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (pd95c9a6f.dip0.t-ipconnect.de
	[217.92.154.111])
	by mail.bugwerft.de (Postfix) with ESMTPSA id EDA79280417;
	Tue, 23 May 2017 12:34:31 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 14:34:48 +0200
Message-Id: <20170523123448.5051-1-daniel@zonque.org>
X-Mailer: git-send-email 2.9.4
Subject: [meta-oe][PATCH] meson: update to version 0.40.1
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
X-List-Received-Date: Tue, 23 May 2017 12:34:58 -0000

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index a83af77..2ba2fc8 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/mesonbuild/meson.git"
 
-SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
+SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
 
 S = "${WORKDIR}/git"
 
-- 
2.9.4


