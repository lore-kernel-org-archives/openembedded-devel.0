Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1286 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Jul 2017 15:54:11 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id C8DCC782EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:54:11 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v6JFX4GC032248
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 19 Jul 2017 17:33:04 +0200
Received: from dev.sbt.siemens.com ([139.16.24.9])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v6JFX3XI030501;
	Wed, 19 Jul 2017 17:33:04 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:32:59 +0200
Message-Id: <1500478379-18247-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-oe][PATCH] python-sqlalchemy, python3-sqlalchemy: update to 1.1.11
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
X-List-Received-Date: Wed, 19 Jul 2017 15:54:12 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../{python-sqlalchemy_1.1.10.bb => python-sqlalchemy_1.1.11.bb}      | 0
 .../{python3-sqlalchemy_1.1.10.bb => python3-sqlalchemy_1.1.11.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.10.bb => python-sqlalchemy_1.1.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.10.bb => python3-sqlalchemy_1.1.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index d2a7be5..0a93dc4 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "64b9a3bf34e17944f844cbf460bd14e6"
-SRC_URI[sha256sum] = "dbd92b8af2306d600efa98ed36262d73aad227440a758c8dc3a067ca30096bd3"
+SRC_URI[md5sum] = "3de387eddb4012083a4562928c511e43"
+SRC_URI[sha256sum] = "76f76965e9a968ba3aecd2a8bc0d991cea04fd9a182e6c95c81f1551487b0211"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.10.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.10.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.10.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.10.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.11.bb
-- 
2.1.4


