Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPHWQ-0006zv-Kn
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 17:33:11 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id BBC441B40D;
	Sun,  5 Dec 2010 17:33:07 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 17:31:45 +0100
Message-Id: <1291566705-9571-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] maxima_5.21.1: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 16:33:12 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/maxima/maxima_5.21.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/maxima/maxima_5.21.1.bb b/recipes/maxima/maxima_5.21.1.bb
index da5ccac..f84c5ee 100644
--- a/recipes/maxima/maxima_5.21.1.bb
+++ b/recipes/maxima/maxima_5.21.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Free computer algebra environment based on Macsyma"
 HOMEPAGE = "http://maxima.sourceforge.net/"
 LICENSE = "GPLv2"
 
-SRC_URI = "http://www.sfr-fresh.com/unix/misc/${P}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/maxima/Maxima-source/${PV}-source/${P}.tar.gz"
 SRC_URI[md5sum] = "e08ed533f3059cec52788ef35198bdcc"
 SRC_URI[sha256sum] = "1dae887e1787871437d699a6b1acc1c1f7428729487492a07c6a31e26bf53a1b"
 
-- 
1.7.0.4



