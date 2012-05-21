Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWThA-0002V0-SY
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:49 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEOfgK009764
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:41 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEOfTx030844
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:41 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:40 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAp5008382;
	Mon, 21 May 2012 09:24:39 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:32 -0500
Message-ID: <1337610609-1173-34-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 33/70] mysql5: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:34:49 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/mysql/mysql5_5.1.40.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/mysql/mysql5_5.1.40.inc b/recipes/mysql/mysql5_5.1.40.inc
index d7c1b72..8dc0739 100644
--- a/recipes/mysql/mysql5_5.1.40.inc
+++ b/recipes/mysql/mysql5_5.1.40.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "The MySQL Open Source Database System"
 HOMEPAGE = "http://www.mysql.com/"
 SECTION = "libs"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DEPENDS = "ncurses"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
-- 
1.7.0.4



