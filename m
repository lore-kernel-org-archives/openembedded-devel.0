Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Ltmd3-0005Bn-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 19:41:03 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id CD158E80A5; Tue, 14 Apr 2009 19:40:38 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 19:40:38 +0200
Message-Id: <1239730838-15689-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] sato-icon-theme: I doubt sato-icon-theme.inc including sato-icon-theme.inc is helpful.
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
X-List-Received-Date: Tue, 14 Apr 2009 17:41:03 -0000

From: Chris Larson <clarson@kergoth.com>

Signed-off-by: Chris Larson <clarson@kergoth.com>
Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/sato-icon-theme/sato-icon-theme.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/sato-icon-theme/sato-icon-theme.inc b/recipes/sato-icon-theme/sato-icon-theme.inc
index 3c3699d..30d0017 100644
--- a/recipes/sato-icon-theme/sato-icon-theme.inc
+++ b/recipes/sato-icon-theme/sato-icon-theme.inc
@@ -1,5 +1,3 @@
-require sato-icon-theme.inc
-
 SECTION = "x11"
 DESCRIPTION = "Sato Icon Theme"
 LICENSE = "CC-BY-SA3"
-- 
1.5.6.5



