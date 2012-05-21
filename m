Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTie-0004uM-6q
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:20 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEQCPD005872
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:12 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEQCPD032411
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:26:12 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:26:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApd008382;
	Mon, 21 May 2012 09:26:10 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:30:06 -0500
Message-ID: <1337610609-1173-68-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 67/70] python-pycairo: Update LICENSE field version to LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:36:20 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL/MPL to LGPLv2.1
  and MPL-1.1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/python/python-pycairo_1.8.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-pycairo_1.8.0.bb b/recipes/python/python-pycairo_1.8.0.bb
index 6f96ea8..9706f60 100644
--- a/recipes/python/python-pycairo_1.8.0.bb
+++ b/recipes/python/python-pycairo_1.8.0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Python Bindings for the Cairo canvas library"
 SECTION = "devel/python"
 HOMEPAGE = "http://cairographics.org/pycairo"
-LICENSE = "LGPL MPL"
+LICENSE = "LGPLv2.1 MPL-1.1"
 # cairo >= 1.8.0
 DEPENDS = "cairo"
-PR = "ml4"
+PR = "ml5"
 
 SRC_URI = "http://cairographics.org/releases/pycairo-${PV}.tar.gz \
            file://fix-setup-py.patch"
-- 
1.7.0.4



