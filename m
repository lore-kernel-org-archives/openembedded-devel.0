Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>)
	id 1NULQn-0003CM-6l; Mon, 11 Jan 2010 15:39:48 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o0BEa8F08320; 
	Mon, 11 Jan 2010 15:36:59 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 11 Jan 2010 15:19:38 +0100 (MET)
Received: from localhost.localdomain ([10.159.245.201])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o0BEZag24665; 
	Mon, 11 Jan 2010 15:35:36 +0100 (MET)
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: angstrom-distro-devel@linuxtogo.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jan 2010 16:45:31 +0100
Message-Id: <1263224731-2691-1-git-send-email-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] sane-feed.inc: adding some ATMEL boards
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
X-List-Received-Date: Mon, 11 Jan 2010 14:39:48 -0000

Add some armv5te entries for ATMEL -EK boards.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 conf/distro/include/sane-feed.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-feed.inc b/conf/distro/include/sane-feed.inc
index 5bc19a1..873972f 100644
--- a/conf/distro/include/sane-feed.inc
+++ b/conf/distro/include/sane-feed.inc
@@ -41,7 +41,13 @@ FEED_ARCH_a780 		= "armv5te"
 FEED_ARCH_akita 	= "armv5te"
 FEED_ARCH_asus620 	= "armv5te"
 FEED_ARCH_asus730 	= "armv5te"
+FEED_ARCH_at91sam9260ek = "armv5te"
+FEED_ARCH_at91sam9261ek = "armv5te"
 FEED_ARCH_at91sam9263ek = "armv5te"
+FEED_ARCH_at91sam9rlek 	= "armv5te"
+FEED_ARCH_at91sam9g10ek = "armv5te"
+FEED_ARCH_at91sam9g20ek = "armv5te"
+FEED_ARCH_at91sam9g45ekes = "armv5te"
 FEED_ARCH_aximx50 	= "armv5te"
 FEED_ARCH_aximx50v 	= "armv5te"
 FEED_ARCH_c7x0 		= "armv5te"
-- 
1.5.6.5



