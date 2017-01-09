Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4620E6071F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 16:18:15 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v09GIETE020432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jan 2017 17:18:14 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.145])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v09GI8re028018;
	Mon, 9 Jan 2017 17:18:08 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2017 17:18:01 +0100
Message-Id: <1483978681-22896-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.7
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
X-List-Received-Date: Mon, 09 Jan 2017 16:18:18 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.5.bb => poco_1.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.5.bb => poco_1.7.7.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.5.bb b/meta-oe/recipes-support/poco/poco_1.7.7.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.7.5.bb
rename to meta-oe/recipes-support/poco/poco_1.7.7.bb
index 2cab796..e2d3be8 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.5.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.7.bb
@@ -12,7 +12,7 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "7dfdcfb70d75ccdaaf2b43fa0b23f82599aebec3"
+SRCREV = "e98adba2c298b4179e77237873d3fbc53876c528"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
-- 
2.1.4


