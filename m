Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgu-0002CU-Tj
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:33 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEOPlT009734
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:25 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEOPuo030651
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:25 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:25 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAox008382;
	Mon, 21 May 2012 09:24:23 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:26 -0500
Message-ID: <1337610609-1173-28-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 27/70] libid3tag: Update LICENSE field version to GPLv2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 14:34:33 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libid3tag/libid3tag_0.15.1b.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libid3tag/libid3tag_0.15.1b.bb b/recipes/libid3tag/libid3tag_0.15.1b.bb
index c7869da..23f60e0 100644
--- a/recipes/libid3tag/libid3tag_0.15.1b.bb
+++ b/recipes/libid3tag/libid3tag_0.15.1b.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Library for interacting with ID3 tags"
 SECTION = "libs/multimedia"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 DEPENDS = "zlib"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
            file://libid3tag-pkg-config.patch"
-- 
1.7.0.4



