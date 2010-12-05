Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPEJz-0006f5-MZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 14:08:08 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id EE28E1B40D;
	Sun,  5 Dec 2010 14:08:04 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 14:06:43 +0100
Message-Id: <1291554403-4732-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,URIBL_RHS_DOB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] redfang: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 13:08:08 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/redfang/redfang.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/redfang/redfang.bb b/recipes/redfang/redfang.bb
index 65a0d5c..49385ed 100644
--- a/recipes/redfang/redfang.bb
+++ b/recipes/redfang/redfang.bb
@@ -1,5 +1,5 @@
 SECTION = "unknown"
-SRC_URI = "http://packetstormsecurity.org/wireless/redfang.2.5.tar.gz \
+SRC_URI = "http://dl.packetstormsecurity.net/wireless/redfang.2.5.tar.gz \
     	   file://Makefile.patch;striplevel=0"
 
 DEFAULT_PREFERENCE="-1"
-- 
1.7.0.4



