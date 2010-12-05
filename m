Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPEDC-0006Ss-6q
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 14:01:07 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 748C11B40D;
	Sun,  5 Dec 2010 14:01:03 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 13:59:41 +0100
Message-Id: <1291553981-4483-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,URIBL_RHS_DOB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qxmp_1.0: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 13:01:07 -0000

Homepage closed

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/qxmp/qxmp_1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qxmp/qxmp_1.0.bb b/recipes/qxmp/qxmp_1.0.bb
index a70d326..7434b59 100644
--- a/recipes/qxmp/qxmp_1.0.bb
+++ b/recipes/qxmp/qxmp_1.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xm1math.net/qxmp/index.html"
 RDEPENDS_${PN} = "mplayer"
 PR = "r1"
 
-SRC_URI = "http://www.xm1math.net/qxmp/qxmp-${PV}.tar.bz2"
+SRC_URI = "http://www.sourcefiles.org/Multimedia/Video/Players/qxmp-${PV}.tar.bz2"
 
 inherit qt4x11
 
-- 
1.7.0.4



