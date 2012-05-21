Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTiM-0004Oq-93
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:02 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPseu000482
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:54 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPsgX032045
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:54 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:54 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApW008382;
	Mon, 21 May 2012 09:25:51 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:59 -0500
Message-ID: <1337610609-1173-61-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 60/70] libdaemon: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:04 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1+ to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libdaemon/libdaemon_0.13.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libdaemon/libdaemon_0.13.bb b/recipes/libdaemon/libdaemon_0.13.bb
index 3ad47dd..0ff13a4 100644
--- a/recipes/libdaemon/libdaemon_0.13.bb
+++ b/recipes/libdaemon/libdaemon_0.13.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "libdaemon is a lightweight C library that eases the writing of UN
 SECTION = "libs"
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
-LICENSE = "LGPL"
-PR = "r0"
+LICENSE = "LGPLv2.1+"
+PR = "r1"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
 
-- 
1.7.0.4



