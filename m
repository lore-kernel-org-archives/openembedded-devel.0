Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJQg-0001Ku-Lm
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:42:34 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A63019A2BC6; Sat, 7 Jan 2012 00:35:10 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  7 Jan 2012 00:35:05 +0100
Message-Id: <1742db21cb7a0dbadf370f3cbcb1a29d3f5471c5.1325892485.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1325892485.git.andrea.adami@gmail.com>
References: <cover.1325892485.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1325892485.git.andrea.adami@gmail.com>
References: <cover.1325892485.git.andrea.adami@gmail.com>
Subject: [meta-oe] [PATCH 2/2] xf86-video-fbdev: remove, driver is now in oe-core
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
X-List-Received-Date: Fri, 06 Jan 2012 23:42:34 -0000

* as per commit id 4997e01cb051cc05348468707898798f9228613a

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
deleted file mode 100644
index 23da386..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
-
-DESCRIPTION = "X.Org X server -- fbdev display driver"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "53a533d9e0c2da50962282526bace074"
-SRC_URI[sha256sum] = "93b271b4b41d7e5ca108849a583b9523e96c51813d046282285355b7001f82d5"
-- 
1.7.3.4



