Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E6AB36041E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2013 14:15:19 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jun 2013 15:15:15 +0100
Message-Id: <1372256115-29853-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.3.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] Hiawatha: update to 9.2
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
X-List-Received-Date: Wed, 26 Jun 2013 14:15:20 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/{hiawatha_9.1.bb => hiawatha_9.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_9.1.bb => hiawatha_9.2.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
index ece4c2f..2c9fe80 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "833ffc295310cb30694e2b6a2c7ffc9c"
-SRC_URI[sha256sum] = "699958c178757be0a5074093c15a136cd4387403e60911d29520d362f345ab48"
+SRC_URI[md5sum] = "a77f044634884c4cc5d21dab44e822a3"
+SRC_URI[sha256sum] = "5d9cdec51c618bb3efab747030e593d9bd49dfaf3236254c8e0cb60715716dbf"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
1.8.3.1


