Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id BEBAF601D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:42:16 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id vA3EgHQa018664
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 3 Nov 2017 15:42:17 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.78.191])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id vA3EgGKm020138;
	Fri, 3 Nov 2017 15:42:16 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Nov 2017 15:42:14 +0100
Message-Id: <1509720134-17426-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-pyasn1, python3-pyasn1: update to 0.3.7
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
X-List-Received-Date: Fri, 03 Nov 2017 14:42:17 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.6.bb => python-pyasn1_0.3.7.bb}         | 0
 .../python/{python3-pyasn1_0.3.6.bb => python3-pyasn1_0.3.7.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.6.bb => python-pyasn1_0.3.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.6.bb => python3-pyasn1_0.3.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index dedb191..aa375f6 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "a2d01c561d4996055641bbbb74eda58f"
-SRC_URI[sha256sum] = "f0380ea97db0ede095a0dd87ce3003d46c197191f924206e43f776fc77e51f09"
+SRC_URI[md5sum] = "d58ecd0d9ff07218073c5acb12974254"
+SRC_URI[sha256sum] = "187f2a66d617683f8e82d5c00033b7c8a0287e1da88a9d577aebec321cad4965"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
-- 
2.1.4


