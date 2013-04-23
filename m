Received: from mo1.mail-out.ovh.net ([178.32.228.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UUZt0-0002FV-IE
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 11:51:47 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id B7FB6FF903C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 10:55:44 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Apr 2013 10:55:44 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 23 Apr 2013 10:55:41 +0200
Received: from b5-vm-mint0.betafive.co.uk (b5-vm-mint0.betafive.co.uk
	[192.168.0.100])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 116F316009F;
	Tue, 23 Apr 2013 09:55:36 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Tue, 23 Apr 2013 09:55:35 +0100
Message-Id: <1366707335-53174-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 5516065119629314377
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH] ttf-inconsolata: fix license name
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
X-List-Received-Date: Tue, 23 Apr 2013 09:51:48 -0000

We have "SIL Open Font License" 1.1 in common-licenses as OFL-1.1.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 129e137..5e86180 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 DESCRIPTION = "Inconsolata font - TTF Version"
 HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
-LICENSE = "SIL Open Font License"
+LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
 PR = "r0"
 
-- 
1.7.10.4



