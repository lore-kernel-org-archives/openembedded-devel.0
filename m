Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyA-0004A3-8h
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:58 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7wDA026086
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:58 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7wto008752
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:58 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:59 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIH028612;
	Mon, 14 May 2012 11:07:57 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:04 -0500
Message-ID: <1337011834-24879-40-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 39/69] libsidplay: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:59 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was based on code inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libsidplay/libsidplay_1.36.59.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libsidplay/libsidplay_1.36.59.bb b/recipes/libsidplay/libsidplay_1.36.59.bb
index 898a9c5..079bc62 100644
--- a/recipes/libsidplay/libsidplay_1.36.59.bb
+++ b/recipes/libsidplay/libsidplay_1.36.59.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "A library for replaying C64 SID music"
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "GPL"
-PR = "r1"
+LICENSE = "GPLv2"
+PR = "r2"
 
 SRC_URI = "\
   ftp://ftp.uni-frankfurt.de/pub/Mirrors2/gentoo.org/distfiles/libsidplay-1.36.59.tgz;name=archive \
-- 
1.7.0.4



