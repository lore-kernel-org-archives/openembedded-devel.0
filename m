Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxxa-0003Mx-Nw
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:23 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7NTg027467
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:23 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7N4O008274
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:23 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:23 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AI4028612;
	Mon, 14 May 2012 11:07:21 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:51 -0500
Message-ID: <1337011834-24879-27-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 26/69] libid3tag: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:23 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libid3tag/libid3tag_0.15.1b.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libid3tag/libid3tag_0.15.1b.bb b/recipes/libid3tag/libid3tag_0.15.1b.bb
index c7869da..23f60e0 100644
--- a/recipes/libid3tag/libid3tag_0.15.1b.bb
+++ b/recipes/libid3tag/libid3tag_0.15.1b.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Library for interacting with ID3 tags"
 SECTION = "libs/multimedia"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 DEPENDS = "zlib"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
            file://libid3tag-pkg-config.patch"
-- 
1.7.0.4



