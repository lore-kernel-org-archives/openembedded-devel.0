Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1OerbA-0007HS-5I
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:34:13 +0200
Received: from frbg-5f732973.pool.mediaways.net ([95.115.41.115])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1Oeran-0007Sp-RX
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:33:49 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 17:33:19 +0200
Message-Id: <1280504000-3595-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] fso-specs_git.bb: sync PV with upstream
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
X-List-Received-Date: Fri, 30 Jul 2010 15:34:13 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/freesmartphone/fso-specs_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/freesmartphone/fso-specs_git.bb b/recipes/freesmartphone/fso-specs_git.bb
index 030be7c..caf1ef1 100644
--- a/recipes/freesmartphone/fso-specs_git.bb
+++ b/recipes/freesmartphone/fso-specs_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 DEPENDS = "libxslt-native"
 SECTION = "devel/specifications"
 SRCREV = "4a26955b481be312c1ca64e87c5283a9a323cf83"
-PV = "2010.07.16.1+gitr${SRCPV}"
+PV = "2010.07.28.1+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-- 
1.7.1



