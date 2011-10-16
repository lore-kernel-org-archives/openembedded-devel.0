Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFaCH-0007XZ-Ut
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:32:50 +0200
Received: from mizar.localdomain (82.60.186.164) by smtp208.alice.it
	(8.5.124.08) id 4DE64DF10C5F6E82; Mon, 17 Oct 2011 01:27:02 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Oct 2011 01:26:49 +0200
Message-Id: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/3] formfactor: initial commit of collie, poodle and tosa machconfig
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
X-List-Received-Date: Sun, 16 Oct 2011 23:32:50 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/collie/machconfig |   15 +++++++++++++++
 recipes-bsp/formfactor/files/poodle/machconfig |   15 +++++++++++++++
 recipes-bsp/formfactor/files/tosa/machconfig   |   15 +++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100755 recipes-bsp/formfactor/files/collie/machconfig
 create mode 100755 recipes-bsp/formfactor/files/poodle/machconfig
 create mode 100755 recipes-bsp/formfactor/files/tosa/machconfig

diff --git a/recipes-bsp/formfactor/files/collie/machconfig b/recipes-bsp/formfactor/files/collie/machconfig
new file mode 100755
index 0000000..c5b1aca
--- /dev/null
+++ b/recipes-bsp/formfactor/files/collie/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=270
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=71
+DISPLAY_BPP=16
+#DISPLAY_DPI=114
+DISPLAY_DPI=96
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/poodle/machconfig b/recipes-bsp/formfactor/files/poodle/machconfig
new file mode 100755
index 0000000..c5b1aca
--- /dev/null
+++ b/recipes-bsp/formfactor/files/poodle/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=270
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=71
+DISPLAY_BPP=16
+#DISPLAY_DPI=114
+DISPLAY_DPI=96
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/tosa/machconfig b/recipes-bsp/formfactor/files/tosa/machconfig
new file mode 100755
index 0000000..a7cf68d
--- /dev/null
+++ b/recipes-bsp/formfactor/files/tosa/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=480
+DISPLAY_WIDTH_MM=61
+DISPLAY_HEIGHT_PIXELS=640
+DISPLAY_HEIGHT_MM=80
+DISPLAY_BPP=16
+#DISPLAY_DPI=200
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.7.3.4



