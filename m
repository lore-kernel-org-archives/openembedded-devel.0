Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5927723E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:03:45 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v0U83jXt005642
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 30 Jan 2017 09:03:45 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v0U83jEj004428;
	Mon, 30 Jan 2017 09:03:45 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 09:03:42 +0100
Message-Id: <1485763422-26643-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-pytz: update to 2016.10
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
X-List-Received-Date: Mon, 30 Jan 2017 08:03:45 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pytz.inc                   | 4 ++--
 .../python/{python-pytz_2016.7.bb => python-pytz_2016.10.bb}          | 0
 .../python/{python3-pytz_2016.7.bb => python3-pytz_2016.10.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2016.7.bb => python-pytz_2016.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2016.7.bb => python3-pytz_2016.10.bb} (100%)
 mode change 100644 => 100755

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 73106da..17ffbfd 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
 
 inherit pypi
 
-SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
-SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
+SRC_URI[md5sum] = "cc9f16ba436efabdcef3c4d32ae4919c"
+SRC_URI[sha256sum] = "9a43e20aa537cfad8fe7a1715165c91cb4a6935d40947f2d070e4c80f2dcd22b"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python-pytz_2016.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2016.7.bb
rename to meta-python/recipes-devtools/python/python-pytz_2016.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb
old mode 100644
new mode 100755
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2016.7.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2016.10.bb
-- 
2.1.4


