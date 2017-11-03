Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 650D178321
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:42:32 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id vA3EgX0F023723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 3 Nov 2017 15:42:33 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.78.191])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id vA3EgXwb025222;
	Fri, 3 Nov 2017 15:42:33 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Nov 2017 15:42:26 +0100
Message-Id: <1509720146-17487-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-psutil, python3-psutil: update to 5.4.0
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
X-List-Received-Date: Fri, 03 Nov 2017 14:42:33 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.3.1.bb => python-psutil_5.4.0.bb}         | 0
 .../python/{python3-psutil_5.3.1.bb => python3-psutil_5.4.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.3.1.bb => python-psutil_5.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.3.1.bb => python3-psutil_5.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index c9a7f6d..4170ea4 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "529244aea5d32fb0c2ea46d80ce54abc"
-SRC_URI[sha256sum] = "12dd9c8abbad15f055e9579130035b38617020ce176f4a498b7870e6321ffa67"
+SRC_URI[md5sum] = "01af6219b1e8fcfd53603023967713bf"
+SRC_URI[sha256sum] = "8e6397ec24a2ec09751447d9f169486b68b37ac7a8d794dca003ace4efaafc6a"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.3.1.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
-- 
2.1.4


