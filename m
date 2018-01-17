Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jan 2018 14:48:34 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 69F7C78596
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:48:34 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w0HEgXUQ017637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:42:33 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.55.96])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w0HEgXp5000709;
	Wed, 17 Jan 2018 15:42:33 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2D0A110003F8;
	Wed, 17 Jan 2018 15:42:33 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:42:30 +0100
Message-Id: <20180117144230.6819-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] poco: update to 1.8.1
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
X-List-Received-Date: Wed, 17 Jan 2018 14:48:35 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb b/meta-oe/recipes-support/poco/poco_1.8.1.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.8.0.1.bb
rename to meta-oe/recipes-support/poco/poco_1.8.1.bb
index 160b4d391..e44ff4470 100644
--- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.8.1.bb
@@ -12,7 +12,7 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
+SRCREV = "2eca6c1813632fb779e07f1e1968afefa81e1dd0"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
-- 
2.11.0


