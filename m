Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTiH-0004J9-Uq
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:35:58 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPoat000461
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPoqi031990
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:50 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:49 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApV008382;
	Mon, 21 May 2012 09:25:48 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:58 -0500
Message-ID: <1337610609-1173-60-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 59/70] libart-lgpl: Update LICENSE field version to LGPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:35:58 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2 to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/libart-lgpl.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/libart-lgpl.inc b/recipes/gnome/libart-lgpl.inc
index aa06237..5208275 100644
--- a/recipes/gnome/libart-lgpl.inc
+++ b/recipes/gnome/libart-lgpl.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Library of functions for 2D graphics"
 SECTION = "x11/gnome"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2"
 
 ART_CONFIG = "${HOST_ARCH}/art_config.h"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 # can't use gnome.bbclass due to _ in filename
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
-- 
1.7.0.4



