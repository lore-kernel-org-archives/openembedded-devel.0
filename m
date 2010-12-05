Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPGZ4-0005BF-Le
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 16:31:55 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id D85381B40D;
	Sun,  5 Dec 2010 16:31:47 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 16:30:26 +0100
Message-Id: <1291563026-7987-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO,
	URIBL_RHS_DOB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] hibernate-script_1.12: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 15:31:55 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/hibernate-script/hibernate-script_1.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/hibernate-script/hibernate-script_1.12.bb b/recipes/hibernate-script/hibernate-script_1.12.bb
index 0d10095..703f0d6 100644
--- a/recipes/hibernate-script/hibernate-script_1.12.bb
+++ b/recipes/hibernate-script/hibernate-script_1.12.bb
@@ -4,9 +4,9 @@
 
 DESCRIPTION="Hibernate script supporting multiple suspend methods"
 LICENSE="GPL"
-HOMEPAGE="http://www.suspend2.net"
+HOMEPAGE="http://tuxonice.net/"
 
-SRC_URI="http://www.suspend2.net/downloads/all/${PN}-${PV}.tar.gz \
+SRC_URI="http://tuxonice.net/files/${PN}-${PV}.tar.gz \
 	file://hibernate.conf \
 	file://standby.conf \
 	file://ram.conf"
-- 
1.7.0.4



