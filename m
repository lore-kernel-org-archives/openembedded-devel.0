Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id C378277011
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 11:51:29 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u7JBpSMK020284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:51:28 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.45])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u7JBpR8I031007;
	Fri, 19 Aug 2016 13:51:28 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 13:51:13 +0200
Message-Id: <1471607473-32678-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.4
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
X-List-Received-Date: Fri, 19 Aug 2016 11:51:30 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.3.bb => poco_1.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.3.bb => poco_1.7.4.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.3.bb b/meta-oe/recipes-support/poco/poco_1.7.4.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.7.3.bb
rename to meta-oe/recipes-support/poco/poco_1.7.4.bb
index 32f56d4..e7a279f 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.4.bb
@@ -12,7 +12,7 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "abc4742ebe6718530a2503fcc3f2554a6296ef5a"
+SRCREV = "da66f2863aa02c11967862f2d9f0251574a5e9c2"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
-- 
2.1.4


