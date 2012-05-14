Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxxY-0003Ka-0b
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:20 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7K1w024598
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:20 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7KKd008218
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:20 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AI3028612;
	Mon, 14 May 2012 11:07:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:50 -0500
Message-ID: <1337011834-24879-26-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 25/69] libical: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:20 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2v.1
  or MPL-1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libical/libical_0.44.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libical/libical_0.44.bb b/recipes/libical/libical_0.44.bb
index 272e07e..87e6c0c 100644
--- a/recipes/libical/libical_0.44.bb
+++ b/recipes/libical/libical_0.44.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 HOMEPAGE = "http://www.softwarestudio.org/softwarestudio/app.php/libical"
 SECTION = "libs"
-LICENSE = "LGPL / MPL"
-PR = "r0"
+LICENSE = "LGPLv2.1 | MPL-1"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${P}.tar.gz \
 	  "
-- 
1.7.0.4



