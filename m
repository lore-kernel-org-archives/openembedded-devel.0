Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy0Y-00084S-Bd
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:20:27 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6jeu025933
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:45 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6j1C007696
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:45 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:45 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHo028612;
	Mon, 14 May 2012 11:06:43 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:37 -0500
Message-ID: <1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 12/69] atk: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:20:28 -0000
Content-Type: text/plain

* Update LICENSE field version from generic LGPL to GPLv2+ and
  LGPLv2+ to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/atk/atk_1.30.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/atk/atk_1.30.0.bb b/recipes/atk/atk_1.30.0.bb
index b3505bf..23c6685 100644
--- a/recipes/atk/atk_1.30.0.bb
+++ b/recipes/atk/atk_1.30.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "An accessibility toolkit for GNOME."
 SECTION = "x11/libs"
 PRIORITY = "optional"
-LICENSE = "LGPL"
+LICENSE = "GPLv2+ LGPLv2+"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 
-- 
1.7.0.4



