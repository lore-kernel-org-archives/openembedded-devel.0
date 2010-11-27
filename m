Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMNS4-0006O1-Ld
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 17:16:42 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id B9E1F1B421;
	Sat, 27 Nov 2010 17:16:42 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 17:15:24 +0100
Message-Id: <1290874524-20534-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] frotz: new homepage
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
X-List-Received-Date: Sat, 27 Nov 2010 16:16:43 -0000

new homepage and src_uri for frotz version 2.43 and 2.42
---
 recipes/frotz/frotz_2.42.bb |    4 ++--
 recipes/frotz/frotz_2.43.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/frotz/frotz_2.42.bb b/recipes/frotz/frotz_2.42.bb
index 6faf415..c74b132 100644
--- a/recipes/frotz/frotz_2.42.bb
+++ b/recipes/frotz/frotz_2.42.bb
@@ -1,12 +1,12 @@
 LICENSE = "GPL"
 DESCRIPTION = "Frotz is an interpreter for Infocom games and other Z-machine games."
-HOMEPAGE = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/"
+HOMEPAGE = "http://frotz.sourceforge.net/"
 SECTION = "console/games"
 PR = "r1"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/files/frotz-${PV}.tar.gz \
+SRC_URI = "http://downloads.sourceforge.net/project/frotz/frotz/2.42/frotz-${PV}.tar.gz \
 	file://Makefile.patch "
 
 do_configure() {
diff --git a/recipes/frotz/frotz_2.43.bb b/recipes/frotz/frotz_2.43.bb
index b59f708..645fb98 100644
--- a/recipes/frotz/frotz_2.43.bb
+++ b/recipes/frotz/frotz_2.43.bb
@@ -1,12 +1,12 @@
 LICENSE = "GPL"
 DESCRIPTION = "Frotz is an interpreter for Infocom games and other Z-machine games."
-HOMEPAGE = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/"
+HOMEPAGE = "http://frotz.sourceforge.net/"
 SECTION = "console/games"
 PR = "r1"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/files/frotz-${PV}.tar.gz \
+SRC_URI = "http://downloads.sourceforge.net/project/frotz/frotz/2.43/frotz-${PV}.tar.gz \
 	file://Makefile-${PV}.patch \
 	file://remove_root_restriction.patch "
 
-- 
1.7.0.4



