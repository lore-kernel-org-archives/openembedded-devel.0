Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6FF72F36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:35:33 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3O8ZYsi030658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 24 Apr 2017 10:35:34 +0200
Received: from dev.sbt.siemens.com ([139.16.73.49])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3O8ZYL6015052;
	Mon, 24 Apr 2017 10:35:34 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 10:35:31 +0200
Message-Id: <1493022931-20073-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-sqlalchemy, python3-sqlalchemy: update to 1.1.9
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
X-List-Received-Date: Mon, 24 Apr 2017 08:35:33 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../python/{python-sqlalchemy_1.1.6.bb => python-sqlalchemy_1.1.9.bb} | 0
 .../{python3-sqlalchemy_1.1.6.bb => python3-sqlalchemy_1.1.9.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.6.bb => python-sqlalchemy_1.1.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.6.bb => python3-sqlalchemy_1.1.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 80816bf..07e70d7 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "cdd2f57967c67e174dd99342111a7db1"
-SRC_URI[sha256sum] = "815924e3218d878ddd195d2f9f5bf3d2bb39fabaddb1ea27dace6ac27d9865e4"
+SRC_URI[md5sum] = "938b1e5ca2372c3ec9a586996a3b5653"
+SRC_URI[sha256sum] = "b65cdc73cd348448ef0164f6c77d45a9f27ca575d3c5d71ccc33adf684bc6ef0"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.6.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.6.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.6.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.6.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.9.bb
-- 
2.1.4


