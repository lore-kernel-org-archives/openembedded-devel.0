Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 80E3971DDA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:27:09 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3O8R8DW025898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:27:08 +0200
Received: from dev.sbt.siemens.com ([139.16.73.49])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3O8R8lX031056;
	Mon, 24 Apr 2017 10:27:08 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 10:11:00 +0200
Message-Id: <1493021460-13502-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] nodejs: update to 4.8.2
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
X-List-Received-Date: Mon, 24 Apr 2017 08:27:12 -0000

---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.7.3.bb => nodejs_4.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.7.3.bb => nodejs_4.8.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb
index d4166f5..ae84ad3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "80db1fad0224f6f44a630ef4abea333a"
-SRC_URI[sha256sum] = "7f35dc7adf0b348857b98e543a54c2b2cafb92c27d9d32799a81ac66cbf035f0"
+SRC_URI[md5sum] = "aea6139f952bb7e1d66f76afedee813c"
+SRC_URI[sha256sum] = "b961350b8490c791bdd3663925662ba0fbe01e004b43f1c2779baffcc816b930"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.1.4


