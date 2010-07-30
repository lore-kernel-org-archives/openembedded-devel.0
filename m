Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Oerb7-0007Ct-Ll
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:34:10 +0200
Received: from frbg-5f732973.pool.mediaways.net ([95.115.41.115])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1Oeran-0007Sq-S3
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:33:49 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 17:33:20 +0200
Message-Id: <1280504000-3595-2-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280504000-3595-1-git-send-email-betheg@bitcloner.org>
References: <1280504000-3595-1-git-send-email-betheg@bitcloner.org>
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] libfso-glib_git.bb: sync PV with upstream
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
X-List-Received-Date: Fri, 30 Jul 2010 15:34:11 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/freesmartphone/libfso-glib_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/freesmartphone/libfso-glib_git.bb b/recipes/freesmartphone/libfso-glib_git.bb
index 79da053..aa3e1ed 100644
--- a/recipes/freesmartphone/libfso-glib_git.bb
+++ b/recipes/freesmartphone/libfso-glib_git.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "vala-dbus-binding-tool-native dbus-glib glib-2.0 fso-specs"
 SRCREV = "9ab41751525d89d834d3d1011a6cde9b16c69a0d"
-PV = "2010.07.16.1+gitr${SRCPV}"
+PV = "2010.07.28.1+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-- 
1.7.1



