Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 17C2377AB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:15:17 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8FBFIUH014007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:15:18 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.177])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v8FBFIpu004101;
	Fri, 15 Sep 2017 13:15:18 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 13:15:14 +0200
Message-Id: <1505474114-22566-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.9
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
X-List-Received-Date: Fri, 15 Sep 2017 11:15:18 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.8.bb => poco_1.7.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.8.bb => poco_1.7.9.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.8.bb b/meta-oe/recipes-support/poco/poco_1.7.9.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.7.8.bb
rename to meta-oe/recipes-support/poco/poco_1.7.9.bb
index 1b83735..ac65735 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.8.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.9.bb
@@ -12,9 +12,9 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "aae9c2e0f64caf019d31ba8f97635d5656b25ba5"
+SRCREV = "bfbe6a328744eaa84cb443b93ee20947aa0be91f"
 SRC_URI = " \
-    git://github.com/pocoproject/poco.git;branch=poco-${PV} \
+    git://github.com/pocoproject/poco.git;branch=master \
     file://run-ptest \
    "
 
-- 
2.1.4


