Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S7mbt-0002OJ-86
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 12:43:17 +0100
Received: by localhost (Postfix, from userid 1000)
	id 3DC36444020; Wed, 14 Mar 2012 12:34:31 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 12:34:26 +0100
Message-Id: <12ed0fbc0d1ea00f4d120b2eac527e3c7456abc4.1331724547.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
References: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1331724547.git.sledz@dresearch-fe.de>
References: <cover.1331724547.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 4/7] bluez4: fix checksums for bluez-4.95.tar.gz
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
X-List-Received-Date: Wed, 14 Mar 2012 11:43:17 -0000

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



