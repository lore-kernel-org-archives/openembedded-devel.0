Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RpqUl-000116-Jk
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 01:13:47 +0100
Received: from mizar.localdomain (79.24.249.251) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD00A454AC; Wed, 25 Jan 2012 01:06:01 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jan 2012 01:05:57 +0100
Message-Id: <1327449958-9778-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] [PATCH] xinput: remove, recipe is now in oe-core
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
X-List-Received-Date: Wed, 25 Jan 2012 00:13:47 -0000

* as per commit id 618da7f65d3f9e3a1a5ee0b35371ae036a219a9a

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
deleted file mode 100644
index 3480185..0000000
--- a/meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
-DESCRIPTION = "a utility to configure and test XInput devices"
-DEPENDS += " libxi"
-PR = "r6"
-
-SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
-SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
-- 
1.7.3.4



