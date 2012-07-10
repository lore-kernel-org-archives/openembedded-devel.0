Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Soimk-0007Dk-9u
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2012 00:19:58 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id AAA63EA042;
	Wed, 11 Jul 2012 00:13:48 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id E5CEA60297; Wed, 11 Jul 2012 00:08:47 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2012 00:08:47 +0200
Message-Id: <1341958127-20262-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH] bluez4_4.84: update checksum values
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
X-List-Received-Date: Tue, 10 Jul 2012 22:19:58 -0000

Update the md5 and sha256 checksum values reported in bluez4_4.84.bb
to actually match the ones of the source package.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/bluez/bluez4_4.84.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/bluez/bluez4_4.84.bb b/recipes/bluez/bluez4_4.84.bb
index 729f38c..abfd39f 100644
--- a/recipes/bluez/bluez4_4.84.bb
+++ b/recipes/bluez/bluez4_4.84.bb
@@ -1,7 +1,7 @@
 require bluez4.inc
 
-SRC_URI[md5sum] = "95e66f26f69aa425d27718f487b6bc74"
-SRC_URI[sha256sum] = "2913b0b09738295547c1bfdcca9e1da456c9ad6950cc499b1ee83b330bf8a5b6"
+SRC_URI[md5sum] = "fd2586143e2d87ee5cb1474cf2d6a221"
+SRC_URI[sha256sum] = "7dac3fb1c6d92fd86e5d98923c4da48b14fffec7b327f9008cacd1ca7777f371"
 
 DEPENDS += "libsndfile1"
 
-- 
1.7.10.4



