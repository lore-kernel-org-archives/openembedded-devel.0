Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SSxzF-0004Nn-Mt
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 00:06:58 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4BLn8Gd003852
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 16:49:08 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4BLn8KC002481
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 16:49:08 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 11 May 2012 16:49:08 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4BLn24V030037;
	Fri, 11 May 2012 16:49:06 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 May 2012 16:52:24 -0500
Message-ID: <1336773144-9706-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1336773144-9706-1-git-send-email-Chase.Maupin@ti.com>
References: <1336773144-9706-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [meta-oe][PATCH 2/2] orbit2: Update LICENSE field to contain GPL version
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
X-List-Received-Date: Fri, 11 May 2012 22:06:58 -0000
Content-Type: text/plain

* Updated the LICENSE field to contain the GPL version as
  indicated in the sources.  This is GPLv2+
* Bump the PRs to pickup the LICENSE change

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-gnome/recipes-gnome/orbit2/orbit2.inc        |    2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2.inc b/meta-gnome/recipes-gnome/orbit2/orbit2.inc
index 5197890..8fe62eb 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2.inc
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 DESCRIPTION = "CORBA ORB"
 SECTION = "x11/gnome/libs"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/ORBit2/2.14/ORBit2-${PV}.tar.bz2 \
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index 8709cc0..f12b561 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -1,6 +1,6 @@
 require orbit2.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
-- 
1.7.0.4



