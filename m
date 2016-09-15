Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 16F9677172
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:10:22 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u8FBAL79020408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:10:21 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.76.169])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u8FBAL4V030208;
	Thu, 15 Sep 2016 13:10:21 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2016 13:10:19 +0200
Message-Id: <1473937819-18533-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.5
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
X-List-Received-Date: Thu, 15 Sep 2016 11:10:23 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.4.bb => poco_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.4.bb => poco_1.7.5.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.4.bb b/meta-oe/recipes-support/poco/poco_1.7.5.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.7.4.bb
rename to meta-oe/recipes-support/poco/poco_1.7.5.bb
index e7a279f..0fc50e1 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.5.bb
@@ -12,7 +12,7 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "da66f2863aa02c11967862f2d9f0251574a5e9c2"
+SRCREV = "7dfdcfb70d75ccdaaf2b43fa0b23f82599aebec3"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
-- 
2.1.4


