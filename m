Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTiT-0004ix-Hc
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEQ1s5000517
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:01 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEQ14J032188
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:01 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:26:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApZ008382;
	Mon, 21 May 2012 09:25:59 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:02 -0500
Message-ID: <1337610609-1173-64-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 63/70] libmikmod: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:10 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1 to
  reflect the real license version.
* This change was back-ported from oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libmikmod/libmikmod_3.1.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libmikmod/libmikmod_3.1.12.bb b/recipes/libmikmod/libmikmod_3.1.12.bb
index cf7b0f0..ad09219 100644
--- a/recipes/libmikmod/libmikmod_3.1.12.bb
+++ b/recipes/libmikmod/libmikmod_3.1.12.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "libmikmod is a module player library supporting many formats, including mod, s3m, it, and xm."
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "LGPL"
-PR = "r4"
+LICENSE = "LGPLv2.1"
+PR = "r5"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \
-- 
1.7.0.4



