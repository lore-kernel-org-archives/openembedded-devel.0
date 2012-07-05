Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003ba-9l
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 74288EA04B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 9E16D60C4E; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:26 +0200
Message-Id: <1ffff2fd0731add51aa0fe19dc670179e1c32afe.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 08/14] bluez4_4.42: update checksum values
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

This patch updates the md5 and sha256 checksum values reported in
recipes/bluez/bluez4_4.42.bb to match the ones of the source package
actually.
This commit is the result of rebasing my patch a2a3f3 from master.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/bluez/bluez4_4.42.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/bluez/bluez4_4.42.bb b/recipes/bluez/bluez4_4.42.bb
index 0573d7a..5a73215 100644
--- a/recipes/bluez/bluez4_4.42.bb
+++ b/recipes/bluez/bluez4_4.42.bb
@@ -4,5 +4,5 @@ DEPENDS += "libsndfile1"
 PR = "${INC_PR}.1"
 
 
-SRC_URI[md5sum] = "d24dfd3ca42847123e29f58b29af6948"
-SRC_URI[sha256sum] = "ed7631a6d22b456eb26b881bdbe46ea47f93d2f192da420408bad4bbc245f796"
+SRC_URI[md5sum] = "a44181c8cf79796a99b792a5372e602d"
+SRC_URI[sha256sum] = "a834f3a961449c6ae83ad26aa5d0b82a6cdd7e49f608aa71a2454a33c62cfb99"
-- 
1.7.10



