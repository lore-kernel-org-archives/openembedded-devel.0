Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWThI-0002iM-Sa
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:57 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEOm30009777
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:48 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEOmrx030928
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:48 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:48 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAp8008382;
	Mon, 21 May 2012 09:24:47 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:35 -0500
Message-ID: <1337610609-1173-37-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 36/70] librsvg: Update LICENSE field version to LGPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:34:57 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2+ to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/librsvg/librsvg_2.26.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/librsvg/librsvg_2.26.2.bb b/recipes/librsvg/librsvg_2.26.2.bb
index 02cc12b..14a53ef 100644
--- a/recipes/librsvg/librsvg_2.26.2.bb
+++ b/recipes/librsvg/librsvg_2.26.2.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Library for rendering SVG files"
 SECTION = "x11/utils"
 DEPENDS = "bzip2 gtk+ libcroco cairo libart-lgpl libxml2 popt xineramaproto"
-LICENSE = "LGPL"
-PR = "r1"
+LICENSE = "LGPLv2+"
+PR = "r2"
 
 inherit gnome
 
-- 
1.7.0.4



