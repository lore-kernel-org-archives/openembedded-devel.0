Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PhhKp-0000Hq-0f
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 12:45:19 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PhhK3-0000gD-Uu by authid <stefan@sostec.de> with cram_md5;
	Tue, 25 Jan 2011 12:44:34 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1PhhK2-0007EP-4O; Tue, 25 Jan 2011 12:44:30 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2011 12:44:28 +0100
Message-Id: <1295955868-27758-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] angstrom-jalimo.conf: Bump icedtea6-native version to 1.7.6
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
X-List-Received-Date: Tue, 25 Jan 2011 11:45:19 -0000

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/distro/include/angstrom-jalimo.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index e66d0b9..76cd5f1 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
 PREFERRED_PROVIDER_classpath = "classpath"
 
 PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
-PREFERRED_VERSION_icedtea6-native = "1.7.5"
+PREFERRED_VERSION_icedtea6-native = "1.7.6"
 
 # Stage JAR files not into ARCH related dirs
 STAGING_DIR_JAVA = "${STAGING_DIR}/java"
-- 
1.7.2.3



