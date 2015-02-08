Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-07.prod.phx3.secureserver.net
	(p3plsmtpa08-07.prod.phx3.secureserver.net [173.201.193.108])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5C460089
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:54:50 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-07.prod.phx3.secureserver.net with 
	id punh1p0050BVjqb01unhpG; Sun, 08 Feb 2015 11:47:42 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:47:33 -0600
Message-Id: <cover.1423421017.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv3 0/3] bluez5 support updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Feb 2015 18:54:57 -0000

This is the meta-oe changes supporting the proposed fix for Yocto
5031, just refreshed as described at:

http://lists.openembedded.org/pipermail/openembedded-core/2015-February/101535.html

The following changes since commit 9c926ef2d463e643fb0dc87f6535a12e35d039ab:

  msr-tools: add recipe (2015-01-28 09:54:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib pabigot/bluez5
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=pabigot/bluez5

Peter A. Bigot (3):
  gnokii: refine selector for bluez4 package config
  gpsd: select distro preference for bluez provider
  packagegroup-basic: select distro preference for bluez provider

 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb     | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 3 ++-
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb             | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
1.9.1


