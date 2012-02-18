Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq7-0006I9-Sl
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:07 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 28D1C22325AB;
	Sat, 18 Feb 2012 22:20:54 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 409AB22325A8;
	Sat, 18 Feb 2012 22:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:51 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6159D3C4C4; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:21 +0100
Message-Id: <1329600022-8027-12-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 11/12][oe-classic] angstrom-jalimo.conf: prefer icedtea 1.11.1 for openjdk6
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:08 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 conf/distro/include/angstrom-jalimo.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index f2d2fa6..d715980 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -21,7 +21,7 @@ PREFERRED_VERSION_jamvm = "1.5.2"
 PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
 PREFERRED_PROVIDER_classpath = "classpath"
 
-PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8.5"
+PREFERRED_VERSION_openjdk-6-jre = "6b24-1.11.1"
 PREFERRED_VERSION_icedtea6-native = "1.7.10"
 
 # Stage JAR files not into ARCH related dirs
-- 
1.7.9


