Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id CEF997F8DA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:52:25 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 665E0BE0AC6; Sun, 10 Nov 2019 15:52:24 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 15:52:24 +0100
Message-Id: <20191110145224.7593-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] pugixml: Update to version 1.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Nov 2019 14:52:26 -0000

Licence checksum changed due to updated copyright statement.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../pugixml/{pugixml_1.9.bb => pugixml_1.10.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.9.bb => pugixml_1.10.bb} (79%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
similarity index 79%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
index ad45f87ecd..d48ad37512 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.9.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
@@ -7,11 +7,11 @@ data-driven tree queries."
 HOMPAGE = "https://pugixml.org/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=1d569c2ed59c94ddd9586051f8c67da6"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d5ee91fb74cbb64223b3693fd64eb169"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "7286ee2ed11376b6b780ced19fae0b64"
-SRC_URI[sha256sum] = "d156d35b83f680e40fd6412c4455fdd03544339779134617b9b28d19e11fdba6"
+SRC_URI[md5sum] = "f97237e9908201c6d8536210747b66af"
+SRC_URI[sha256sum] = "55f399fbb470942410d348584dc953bcaec926415d3462f471ef350f29b5870a"
 
 inherit cmake
 
-- 
2.17.1


