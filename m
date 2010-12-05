Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPJrb-00048W-AW
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 20:03:12 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 693DB1B40D;
	Sun,  5 Dec 2010 20:03:08 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 20:01:46 +0100
Message-Id: <1291575706-12198-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opie-scummvm_1.0.1: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 19:03:12 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/scummvm/opie-scummvm_1.0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/scummvm/opie-scummvm_1.0.1.bb b/recipes/scummvm/opie-scummvm_1.0.1.bb
index e2b41d4..8142ee3 100644
--- a/recipes/scummvm/opie-scummvm_1.0.1.bb
+++ b/recipes/scummvm/opie-scummvm_1.0.1.bb
@@ -8,7 +8,7 @@ APPDESKTOP = "${S}"
 
 RDEPENDS_${PN} = "scummvm-qpe"
 PR = "r1"
-SRC_URI = "http://sickpeople.wmc-allstars.com/law/files/scummvm/opie-scummvm-${PV}-r0_arm.tar.bz2"
+SRC_URI = "http://www.openzaurus.org/download/3.5.4/sources/opie-scummvm-${PV}-r0_arm.tar.bz2"
 
 SRC_URI[md5sum] = "a71902804ea20314b7336a3d566f1977"
 SRC_URI[sha256sum] = "9c20af44cc1b9d78f79adf7745716b73adaea0ff28208504f110e7c7520d354a"
-- 
1.7.0.4



