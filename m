Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTfz-0000Rm-69
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:33:35 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENRpQ031329
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:27 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENQqX029775
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:26 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAob008382;
	Mon, 21 May 2012 09:23:25 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:04 -0500
Message-ID: <1337610609-1173-6-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 05/70] canutils: Update LICENSE field version GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:33:35 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to GPLv2 to
  reflect the actual license and license version of the code.
* This change was back-ported from oe-core

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/socketcan/canutils.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/socketcan/canutils.inc b/recipes/socketcan/canutils.inc
index a4edeea..6ee6bbd 100644
--- a/recipes/socketcan/canutils.inc
+++ b/recipes/socketcan/canutils.inc
@@ -3,10 +3,10 @@ AUTHOR = "Luotao Fu"
 HOMEPAGE = "http://www.pengutronix.de"
 SECTION = "console/network"
 PRIORITY = "optional"
-LICENSE = "LGPL"
+LICENSE = "GPLv2"
 DEPENDS = "libsocketcan"
 RCONFLICTS_${PN} = "socketcan-utils-test"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
         "
-- 
1.7.0.4



