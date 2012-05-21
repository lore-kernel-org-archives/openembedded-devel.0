Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTga-0001cG-2j
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:12 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEO44s009179
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:04 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEO468030320
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:04 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:03 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAop008382;
	Mon, 21 May 2012 09:24:02 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:18 -0500
Message-ID: <1337610609-1173-20-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 19/70] esound: Update LICENSE field version to LGPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:34:13 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to LGPLv2 to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/esound/esound_0.2.36.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/esound/esound_0.2.36.bb b/recipes/esound/esound_0.2.36.bb
index eeb83e4..4322a8c 100644
--- a/recipes/esound/esound_0.2.36.bb
+++ b/recipes/esound/esound_0.2.36.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Enlightened Sound Daemon"
 SECTION = "gpe/base"
-LICENSE = "GPL"
+LICENSE = "LGPLv2"
 DEPENDS = "audiofile"
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 inherit gnome binconfig
 
-- 
1.7.0.4



