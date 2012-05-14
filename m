Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxzE-00070m-Jf
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:19:14 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG95ms028430
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:05 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG9595009845
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:05 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:09:05 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIg028612;
	Mon, 14 May 2012 11:09:03 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:29 -0500
Message-ID: <1337011834-24879-65-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 64/69] neon: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:19:21 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2+ to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/neon/neon_0.25.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/neon/neon_0.25.5.bb b/recipes/neon/neon_0.25.5.bb
index e67132f..a2db6a6 100644
--- a/recipes/neon/neon_0.25.5.bb
+++ b/recipes/neon/neon_0.25.5.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "neon is an HTTP and WebDAV client library, with a C interface."
 HOMEPAGE = "http://www.webdav.org/neon"
 SECTION = "libs"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 DEPENDS = "zlib libxml2 expat time gnutls"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz \
            file://gnutls-force-and-detect.patch \
-- 
1.7.0.4



