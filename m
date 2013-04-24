Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UUzkA-0008Nj-6n
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 15:28:30 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:10:31 +0100
Message-Id: <1366809031-31069-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] hiawatha: update to 9.1
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
X-List-Received-Date: Wed, 24 Apr 2013 13:28:36 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/{hiawatha_9.0.bb => hiawatha_9.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_9.0.bb => hiawatha_9.1.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
index ac21558..ece4c2f 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "8abc4f85dbb9a76ed66e7f35de520064"
-SRC_URI[sha256sum] = "5e40119afb050b11737250c08d89ac7ba7472645738a48c06aa79979a19729fc"
+SRC_URI[md5sum] = "833ffc295310cb30694e2b6a2c7ffc9c"
+SRC_URI[sha256sum] = "699958c178757be0a5074093c15a136cd4387403e60911d29520d362f345ab48"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
1.8.2.1



