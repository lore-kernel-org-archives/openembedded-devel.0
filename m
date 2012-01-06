Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJTk-0001xN-73
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:45:44 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp206.alice.it
	(8.6.023.02) id 4ECA607906A4F8B6; Sat, 7 Jan 2012 00:32:31 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  7 Jan 2012 00:32:26 +0100
Message-Id: <cover.1325806595.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] xserver minor cleanings and commit of fbdev driver
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
X-List-Received-Date: Fri, 06 Jan 2012 23:45:44 -0000

Andrea Adami (2):
  x11-common: remove extraneous BSP customizations
  xorg-driver: add xf86-video-fbdev from meta-openembedded

 .../x11-common/x11-common/etc/X11/Xserver          |   24 --------------------
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 ++++++
 2 files changed, 8 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb

-- 
1.7.3.4



