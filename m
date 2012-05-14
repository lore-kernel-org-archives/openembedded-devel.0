Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxzJ-00072I-O0
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:19:16 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG9ALY026218
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:10 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG9AM0009921
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:09:10 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:09:10 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIi028612;
	Mon, 14 May 2012 11:09:08 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:31 -0500
Message-ID: <1337011834-24879-67-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 66/69] python-pycairo: Update LICENSE field version
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



