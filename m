Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgPB-0000Bn-Cf
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:37 +0200
Received: (qmail 28011 invoked by uid 813007); 22 Jun 2009 09:54:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:55 +0200
Message-Id: <1245664435-30183-12-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [STABLE][PATCH 035/125] atd: fix spelling of LICENSE
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:37 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/atd/atd_0.70.bb |    4 ++--
 recipes/atd/atd_0.80.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/atd/atd_0.70.bb b/recipes/atd/atd_0.70.bb
index 9862fac..7f2193d 100644
--- a/recipes/atd/atd_0.70.bb
+++ b/recipes/atd/atd_0.70.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Lightweight At Daemon"
 SECTION = "base"
-LICENSE = "GPLV2"
+LICENSE = "GPLv2"
 RCONFLICTS = "at"
 RREPLACES = "at"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${HANDHELDS_CVS};module=apps/atd;tag=ATD-0_70 \
 			file://atd-startup.patch;patch=1;pnum=0"
diff --git a/recipes/atd/atd_0.80.bb b/recipes/atd/atd_0.80.bb
index f3adbd7..23cf7c4 100644
--- a/recipes/atd/atd_0.80.bb
+++ b/recipes/atd/atd_0.80.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Lightweight At Daemon"
 SECTION = "base"
-LICENSE = "GPLV2"
+LICENSE = "GPLv2"
 RCONFLICTS = "at"
 RREPLACES = "at"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://projects.linuxtogo.org/frs/download.php/222/${P}.tar.gz"
 
-- 
1.6.3.1





