Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTfw-0000RW-Mi
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:33:32 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENOC6031325
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:24 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENO4q029728
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:24 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:24 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAoa008382;
	Mon, 21 May 2012 09:23:22 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:03 -0500
Message-ID: <1337610609-1173-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 04/70] bonnie: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:33:33 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was back-ported from oe-core.
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/bonnie/bonnie++.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/bonnie/bonnie++.inc b/recipes/bonnie/bonnie++.inc
index fa24fcd..1d5867d 100644
--- a/recipes/bonnie/bonnie++.inc
+++ b/recipes/bonnie/bonnie++.inc
@@ -3,8 +3,9 @@
 # Released under the MIT license (see packages/COPYING)
 
 DESCRIPTION="Tests large file IO and creation/deletion of small files."
-LICENSE="GPL"
+LICENSE="GPLv2"
 
+PR = "r1"
 
 SRC_URI="http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
 	 file://gcc-4.3-fixes.patch"
-- 
1.7.0.4



