Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyu-0005dv-1w
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:45 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8idN002839
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:44 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8ino009576
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:44 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:44 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIY028612;
	Mon, 14 May 2012 11:08:42 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:21 -0500
Message-ID: <1337011834-24879-57-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 56/69] gtk-doc: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:47 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2 to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gtk-doc/gtk-doc.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gtk-doc/gtk-doc.bb b/recipes/gtk-doc/gtk-doc.bb
index a7ab21e..c64d5dd 100644
--- a/recipes/gtk-doc/gtk-doc.bb
+++ b/recipes/gtk-doc/gtk-doc.bb
@@ -1,7 +1,7 @@
 SECTION = "x11/base"
 SRC_URI = "file://gtk-doc.m4"
-LICENSE = "LGPL"
-PR = "r3"
+LICENSE = "LGPLv2"
+PR = "r4"
 
 ALLOW_EMPTY_${PN} = "1"
 
-- 
1.7.0.4



