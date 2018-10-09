Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id C2D9071BB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 08:55:24 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 28D3522066D;
	Tue,  9 Oct 2018 10:55:25 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 10:55:20 +0200
Message-Id: <20181009085521.5771-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] libmpdclient: update to 2.16
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
X-List-Received-Date: Tue, 09 Oct 2018 08:55:25 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../musicpd/{libmpdclient_2.15.bb => libmpdclient_2.16.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.15.bb => libmpdclient_2.16.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
index c78344c66..a51dc865b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
@@ -8,7 +8,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient \
 "
-SRCREV = "7754ffdfb9371cd398371cb2670a54e9e1e623e2"
+SRCREV = "4e8d990eb5239566ee948f1cd79b7248e008620a"
 S = "${WORKDIR}/git"
 
 do_install_append() {
-- 
2.19.1


