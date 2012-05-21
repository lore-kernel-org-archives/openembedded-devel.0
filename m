Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWThY-00038U-MQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:35:14 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEP4wr009848
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:04 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEP4WH031258
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:04 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:04 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApE008382;
	Mon, 21 May 2012 09:25:03 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:41 -0500
Message-ID: <1337610609-1173-43-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 42/70] libsocketcan: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:35:15 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1 to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/socketcan/libsocketcan.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/socketcan/libsocketcan.inc b/recipes/socketcan/libsocketcan.inc
index e52cc08..d518924 100644
--- a/recipes/socketcan/libsocketcan.inc
+++ b/recipes/socketcan/libsocketcan.inc
@@ -3,10 +3,10 @@ AUTHOR = "Luotao Fu"
 HOMEPAGE = "http://www.pengutronix.de"
 SECTION = "libs/network"
 PRIORITY = "optional"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
 
 TAG = "v${PV}"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=${TAG} \
 	"
-- 
1.7.0.4



