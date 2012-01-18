Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rnedc-0002r3-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 00:09:52 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D804895B77; Thu, 19 Jan 2012 00:02:13 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:02:07 +0100
Message-Id: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 0/3] zaurus-utils: Inhibit toolchain dependencies
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
X-List-Received-Date: Wed, 18 Jan 2012 23:09:52 -0000

* inhibit toolchain dependencies as there isn't anything to compile

Andrea Adami (3):
  zaurus-updater: Inhibit toolchain dependencies
  zaurus-legacy-tar.bb: Inhibit toolchain dependencies
  zaurus-installer: Inhibit toolchain dependencies

 recipes-bsp/zaurus-utils/zaurus-installer.bb  |    4 +++-
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb |    4 +++-
 recipes-bsp/zaurus-utils/zaurus-updater.bb    |    5 +++--
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.3.4



