Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UDynK-0001NJ-1b
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 16:01:20 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2013 14:44:30 +0000
Message-Id: <1362753870-23009-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.1.5
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] hiawatha: update to 8.8.1
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
X-List-Received-Date: Fri, 08 Mar 2013 15:01:23 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/{hiawatha_8.7.bb => hiawatha_8.8.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.7.bb => hiawatha_8.8.1.bb} (93%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
similarity index 93%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
index d8a0583..9e4f119 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
@@ -9,8 +9,8 @@ SECTION = "net"
 SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
            file://hiawatha-init "
 
-SRC_URI[md5sum] = "712b1822ef525153dc4347417252768d"
-SRC_URI[sha256sum] = "c35e1e975962e1105d7914f74901e304ba90681985c94236c113eaca502b5e34"
+SRC_URI[md5sum] = "5def93779bbc10a021796abd3609caf7"
+SRC_URI[sha256sum] = "2583d8e7f48ddc6cdedc27bb51d3e130679fc2f4411622bae9ddce3ef965d063"
 
 inherit cmake update-rc.d
 
-- 
1.8.1.5



