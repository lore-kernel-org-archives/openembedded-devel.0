Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPGGE-0004qQ-UM
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 16:12:24 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 252D91B40D;
	Sun,  5 Dec 2010 16:12:20 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 16:10:58 +0100
Message-Id: <1291561858-7559-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gtk2-ssh-askpass_0.3: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 15:12:24 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb b/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb
index 9c03a50..df1c19c 100644
--- a/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb
+++ b/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE="http://www.cgabriel.org/sw/gtk2-ssh-askpass/"
 LICENSE = "GPL"
 SECTION = "network/misc"
 
-SRC_URI="http://src.gentoo.pl/distfiles/gtk2-ssh-askpass-${PV}.tar.gz \
+SRC_URI="http://www.cgabriel.org/download/ssh-askpass-fullscreen/gtk2-ssh-askpass-${PV}.tar.gz \
 	file://makefile.patch"
 
 DEPENDS="gtk+"
-- 
1.7.0.4



