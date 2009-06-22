Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgP8-0000Av-6r
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:34 +0200
Received: (qmail 27663 invoked by uid 813007); 22 Jun 2009 09:54:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:37 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:45 +0200
Message-Id: <1245664435-30183-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 025/125] alsa-lib: This is LGPL not GPL
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:34 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/alsa/alsa-lib_1.0.11.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.13.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.14.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.15.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.17.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.18.bb |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/alsa/alsa-lib_1.0.11.bb b/recipes/alsa/alsa-lib_1.0.11.bb
index b9169e6..4d7c2e8 100644
--- a/recipes/alsa/alsa-lib_1.0.11.bb
+++ b/recipes/alsa/alsa-lib_1.0.11.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 PR = "r4"
 
 # configure.in sets -D__arm__ on the command line for any arm system
diff --git a/recipes/alsa/alsa-lib_1.0.13.bb b/recipes/alsa/alsa-lib_1.0.13.bb
index 860ef11..03ab74f 100644
--- a/recipes/alsa/alsa-lib_1.0.13.bb
+++ b/recipes/alsa/alsa-lib_1.0.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 PR = "r4"
 
 # configure.in sets -D__arm__ on the command line for any arm system
diff --git a/recipes/alsa/alsa-lib_1.0.14.bb b/recipes/alsa/alsa-lib_1.0.14.bb
index ba46342..284ddd9 100644
--- a/recipes/alsa/alsa-lib_1.0.14.bb
+++ b/recipes/alsa/alsa-lib_1.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 
 PR = "r2"
 
diff --git a/recipes/alsa/alsa-lib_1.0.15.bb b/recipes/alsa/alsa-lib_1.0.15.bb
index 4cf3938..b502adb 100644
--- a/recipes/alsa/alsa-lib_1.0.15.bb
+++ b/recipes/alsa/alsa-lib_1.0.15.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 PR = "r1"
 
 # configure.in sets -D__arm__ on the command line for any arm system
diff --git a/recipes/alsa/alsa-lib_1.0.17.bb b/recipes/alsa/alsa-lib_1.0.17.bb
index f4ae21b..eff114d 100644
--- a/recipes/alsa/alsa-lib_1.0.17.bb
+++ b/recipes/alsa/alsa-lib_1.0.17.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 
 # configure.in sets -D__arm__ on the command line for any arm system
 # (not just those with the ARM instruction set), this should be removed,
diff --git a/recipes/alsa/alsa-lib_1.0.18.bb b/recipes/alsa/alsa-lib_1.0.18.bb
index f4ae21b..eff114d 100644
--- a/recipes/alsa/alsa-lib_1.0.18.bb
+++ b/recipes/alsa/alsa-lib_1.0.18.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Alsa sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "libs/multimedia"
-LICENSE = "GPL"
+LICENSE = "LGPL"
 
 # configure.in sets -D__arm__ on the command line for any arm system
 # (not just those with the ARM instruction set), this should be removed,
-- 
1.6.3.1





