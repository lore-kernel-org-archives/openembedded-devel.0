Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PuR0I-0000r1-Gh
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 15:56:46 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PuQyt-0007dI-MY by authid <stefan@sostec.de> with cram_md5;
	Tue, 01 Mar 2011 15:55:22 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>)
	id 1PuQyq-0002t2-9a; Tue, 01 Mar 2011 15:55:16 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 15:55:14 +0100
Message-Id: <1298991314-11065-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] angstrom-jalimo.conf: Bump openjdk version to include security and build fixes
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
X-List-Received-Date: Tue, 01 Mar 2011 14:56:46 -0000


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/distro/include/angstrom-jalimo.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index 76cd5f1..9ba4c70 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -22,7 +22,7 @@ PREFERRED_VERSION_jamvm = "1.5.2"
 PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
 PREFERRED_PROVIDER_classpath = "classpath"
 
-PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
+PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8.5"
 PREFERRED_VERSION_icedtea6-native = "1.7.6"
 
 # Stage JAR files not into ARCH related dirs
-- 
1.7.4.1



