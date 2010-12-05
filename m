Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPJyP-0004IP-Sf
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 20:10:14 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id EF7A51B40D;
	Sun,  5 Dec 2010 20:10:10 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 20:08:49 +0100
Message-Id: <1291576129-12425-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sidplay-base_1.0.9: fixed SRC:URI
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
X-List-Received-Date: Sun, 05 Dec 2010 19:10:14 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/sidplay-base/sidplay-base_1.0.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/sidplay-base/sidplay-base_1.0.9.bb b/recipes/sidplay-base/sidplay-base_1.0.9.bb
index bffcab9..1ae9043 100644
--- a/recipes/sidplay-base/sidplay-base_1.0.9.bb
+++ b/recipes/sidplay-base/sidplay-base_1.0.9.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.geocities.com/SiliconValley/Lakes/5147/sidplay/linux.html"
 DEPENDS = "libsidplay"
 
-SRC_URI = "http://www.geocities.com/SiliconValley/Lakes/5147/sidplay/packages/sidplay-base-${PV}.tgz"
+SRC_URI = "ftp://ftp.eenet.ee/pub/FreeBSD/distfiles/sidplay-base-${PV}.tgz"
 SRC_URI[md5sum] = "633506d1225ce9713106fc8d851b0750"
 SRC_URI[sha256sum] = "2d0e4966d28525b6c6e644b53f9366e9431cdb5ea62e5dbda5a30004977d2055"
 
-- 
1.7.0.4



