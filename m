Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgX-0001YS-0P
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:10 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEO1bD009168
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:01 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEO1RA030263
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:01 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAoo008382;
	Mon, 21 May 2012 09:23:59 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:17 -0500
Message-ID: <1337610609-1173-19-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 18/70] libcroco: Update LICENSE field version to LGPLv2 and LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:34:11 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2 and
  LGPLv2.1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libcroco/libcroco_0.6.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libcroco/libcroco_0.6.2.bb b/recipes/libcroco/libcroco_0.6.2.bb
index e502e95..07a224d 100644
--- a/recipes/libcroco/libcroco_0.6.2.bb
+++ b/recipes/libcroco/libcroco_0.6.2.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "The Libcroco project is an effort to build a generic Cascading Style Sheet (CSS) parsing and manipulation toolkit"
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2 LGPLv2.1"
+
+PR = "r1"
 
 inherit gnome
 
-- 
1.7.0.4



