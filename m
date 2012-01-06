Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJQe-0001KX-MU
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:42:32 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A63019A2BAE; Sat, 7 Jan 2012 00:35:08 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  7 Jan 2012 00:35:03 +0100
Message-Id: <cover.1325892485.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] [PATCH 0/2] sync with oe-core
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
X-List-Received-Date: Fri, 06 Jan 2012 23:42:32 -0000

Andrea Adami (2):
  kernel.bbclass: fix pkg_postinst and pkg_postrm (from oe-core)
  xf86-video-fbdev: remove, driver is now in oe-core

 meta-oe/classes/kernel.bbclass                     |    4 ++--
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb

-- 
1.7.3.4



