Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxxT-0003Gk-2w
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:15 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7FEs024583
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:15 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7FjD008148
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:15 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:15 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AI1028612;
	Mon, 14 May 2012 11:07:13 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:48 -0500
Message-ID: <1337011834-24879-24-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 23/69] gdbm: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:16 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gdbm/gdbm_1.8.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gdbm/gdbm_1.8.3.bb b/recipes/gdbm/gdbm_1.8.3.bb
index 24c541a..20cd441 100644
--- a/recipes/gdbm/gdbm_1.8.3.bb
+++ b/recipes/gdbm/gdbm_1.8.3.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "GNU dbm is a set of database routines that use extensible hashing
 HOMEPAGE = "http://www.gnu.org/software/gdbm/gdbm.html"
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 	   file://makefile.patch \
-- 
1.7.0.4



