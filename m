Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pkdop-0001Ab-Tt
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 15:36:27 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pkdnv-00006v-3n by authid <stefan@sostec.de> with cram_md5;
	Wed, 02 Feb 2011 15:35:33 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Pkdns-0002ud-Uw; Wed, 02 Feb 2011 15:35:29 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Feb 2011 15:35:27 +0100
Message-Id: <1296657327-11166-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] angstrom-2008-preferred-versions: Bump wpa-supplicant version to 0.7.3
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
X-List-Received-Date: Wed, 02 Feb 2011 14:36:28 -0000

This allows the use of the new DBUS API which is needed by connman 0.68 and
higher.

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 .../include/angstrom-2008-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index c5e1a42..77e5e00 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -61,7 +61,7 @@ PREFERRED_VERSION_udev_libc-uclibc = "141"
 UDEV_GE_141 = "1"
 
 PREFERRED_VERSION_usbutils = "0.86"
-PREFERRED_VERSION_wpa-supplicant = "0.6.9"
+PREFERRED_VERSION_wpa-supplicant = "0.7.3"
 PREFERRED_VERSION_wget = "1.11.4"
 PREFERRED_VERSION_xserver-common = "1.33"
 PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
-- 
1.7.2.3



