Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPHSa-0006pe-4U
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 17:29:12 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 3CCDF1B40D;
	Sun,  5 Dec 2010 17:29:09 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 17:27:47 +0100
Message-Id: <1291566467-9468-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mathomatic_12.4.2: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 16:29:12 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/mathomatic/mathomatic_12.4.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/mathomatic/mathomatic_12.4.2.bb b/recipes/mathomatic/mathomatic_12.4.2.bb
index b12efab..641c1e5 100644
--- a/recipes/mathomatic/mathomatic_12.4.2.bb
+++ b/recipes/mathomatic/mathomatic_12.4.2.bb
@@ -1,5 +1,5 @@
 require mathomatic.inc
 
-SRC_URI = "http://www.panix.com/~gesslein/mathomatic-${PV}.tgz"
+SRC_URI = "http://ftp.vim.org/ftp/os/OpenBSD/distfiles/mathomatic-${PV}.tgz"
 SRC_URI[md5sum] = "ad0df739c64a3db1733f2e290b0549ae"
 SRC_URI[sha256sum] = "cf04ec6b5d16ab70335a08aef483ff357ed454fd7b972f1c424ce0855973cee3"
-- 
1.7.0.4



