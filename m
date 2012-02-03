Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RtHAa-0005f2-Ld
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 12:19:08 +0100
Received: by localhost (Postfix, from userid 1000)
	id 86AF6443CE0; Fri,  3 Feb 2012 12:11:11 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2012 12:11:09 +0100
Message-Id: <1328267469-29276-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] bluez4: fix checksums for bluez-4.95.tar.gz
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
X-List-Received-Date: Fri, 03 Feb 2012 11:19:08 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/bluez/bluez4_4.95.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb
index 290dff6..23275e4 100644
--- a/recipes/bluez/bluez4_4.95.bb
+++ b/recipes/bluez/bluez4_4.95.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
   ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
   file://bluetooth.conf \
 "
-SRC_URI[md5sum] = "341294b2849a04a4afff5c96bfbf30b2"
-SRC_URI[sha256sum] = "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6"
+SRC_URI[md5sum] = "3e6e77ae06aad73bbedbabed3f0d508e"
+SRC_URI[sha256sum] = "795dc8eb45e07c7848c58e2f2d730a404179ecce3dd1cd7b822cdec5ea7b69c8"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
-- 
1.7.7



