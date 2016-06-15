Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 5A09A601A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:10:47 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u5FEAiV5002964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 16:10:44 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u5FEAfrY006139;
	Wed, 15 Jun 2016 16:10:44 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 16:10:21 +0200
Message-Id: <1465999821-29203-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.3
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
X-List-Received-Date: Wed, 15 Jun 2016 14:10:50 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} (96%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.1.bb b/meta-oe/recipes-support/poco/poco_1.7.3.bb
similarity index 96%
rename from meta-oe/recipes-support/poco/poco_1.7.1.bb
rename to meta-oe/recipes-support/poco/poco_1.7.3.bb
index 135d2aa..75e0997 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.3.bb
@@ -17,8 +17,8 @@ SRC_URI = " \
     file://run-ptest \
    "
 
-SRC_URI[md5sum] = "a4b755d47303b20a0e2586f281d05a36"
-SRC_URI[sha256sum] = "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd04d8e9a2b2d15c05"
+SRC_URI[md5sum] = "6b979d7d9c1751c2e063338cb5ea8977"
+SRC_URI[sha256sum] = "af75f279c9eac35b39fc998d8d20dc45d5bef91eb75851ff99d948ca128c7740"
 
 S = "${WORKDIR}/poco-poco-${PV}-release"
 
-- 
2.1.4


