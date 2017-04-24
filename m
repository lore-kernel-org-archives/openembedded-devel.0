Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2467671D9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:35:01 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3O8Z2DG029070
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 24 Apr 2017 10:35:02 +0200
Received: from dev.sbt.siemens.com ([139.16.73.49])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v3O8Z299012109;
	Mon, 24 Apr 2017 10:35:02 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 10:34:24 +0200
Message-Id: <1493022864-19917-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-chardet, python3-chardet: update to 3.0.2
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
X-List-Received-Date: Mon, 24 Apr 2017 08:35:02 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-chardet.inc                | 4 ++--
 .../python/{python-chardet_2.3.0.bb => python-chardet_3.0.2.bb}       | 0
 .../python/{python3-chardet_2.3.0.bb => python3-chardet_3.0.2.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-chardet_2.3.0.bb => python-chardet_3.0.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-chardet_2.3.0.bb => python3-chardet_3.0.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 60305e8..42b64a2 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 inherit pypi
 
-SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
-SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
+SRC_URI[md5sum] = "96e364abdbde20b5f6dbbe2ad9d54d04"
+SRC_URI[sha256sum] = "4f7832e7c583348a9eddd927ee8514b3bf717c061f57b21dbe7697211454d9bb"
diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python-chardet_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
rename to meta-python/recipes-devtools/python/python-chardet_3.0.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python3-chardet_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-chardet_3.0.2.bb
-- 
2.1.4


