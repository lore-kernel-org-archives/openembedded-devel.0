Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id DCD2760234
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2018 08:44:02 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F065000529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f06:5000:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 96C14220523;
	Wed, 24 Oct 2018 10:44:03 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Oct 2018 10:43:58 +0200
Message-Id: <20181024084359.26705-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] mpc: update to 0.31
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
X-List-Received-Date: Wed, 24 Oct 2018 08:44:03 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

---
 .../recipes-multimedia/musicpd/{mpc_0.30.bb => mpc_0.31.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpc_0.30.bb => mpc_0.31.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb
index 6fac5b2e7..41abe7108 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb
@@ -12,5 +12,5 @@ DEPENDS += " \
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/mpc \
 "
-SRCREV = "6fc4e639152daeebb19e0fdfb277252acc734fc5"
+SRCREV = "59875acdf34e5f0eac0c11453c49daef54f78413"
 S = "${WORKDIR}/git"
-- 
2.19.1


