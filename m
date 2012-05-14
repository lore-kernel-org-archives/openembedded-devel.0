Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyi-0005IU-LQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:32 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8XOE028102
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:33 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8Xf9009420
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:33 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:33 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIU028612;
	Mon, 14 May 2012 11:08:31 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:17 -0500
Message-ID: <1337011834-24879-53-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 52/69] wireless-tools: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:33 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 and
  LGPLv2.1 or MPL-1.1 or BSD to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/wireless-tools/wireless-tools.inc   |    2 +-
 recipes/wireless-tools/wireless-tools_29.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/wireless-tools/wireless-tools.inc b/recipes/wireless-tools/wireless-tools.inc
index a6bc6a8..685c222 100644
--- a/recipes/wireless-tools/wireless-tools.inc
+++ b/recipes/wireless-tools/wireless-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Tools for the Linux Standard Wireless Extension Subsystem"
 HOMEPAGE = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
 SECTION = "base"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2 LGPLv2.1 | MPL-1.1 | BSD"
 
 SRC_URI = "\
   http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${PV}.tar.gz \
diff --git a/recipes/wireless-tools/wireless-tools_29.bb b/recipes/wireless-tools/wireless-tools_29.bb
index 66626c7..258db1c 100644
--- a/recipes/wireless-tools/wireless-tools_29.bb
+++ b/recipes/wireless-tools/wireless-tools_29.bb
@@ -1,6 +1,6 @@
 require wireless-tools.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
 SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
-- 
1.7.0.4



