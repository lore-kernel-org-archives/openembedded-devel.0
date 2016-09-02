Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8B48F73166
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 09:01:05 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u82915vV015579
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Sep 2016 11:01:05 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.136])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u82915EP009798;
	Fri, 2 Sep 2016 11:01:05 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Sep 2016 11:01:00 +0200
Message-Id: <1472806860-24330-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] p7zip: update to version 16.02
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
X-List-Received-Date: Fri, 02 Sep 2016 09:01:07 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-extended/p7zip/{p7zip_15.14.1.bb => p7zip_16.02.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/p7zip/{p7zip_15.14.1.bb => p7zip_16.02.bb} (89%)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
similarity index 89%
rename from meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
rename to meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 8e2e241..12be02c 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c
 
 SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
           file://do_not_override_compiler_and_do_not_strip.patch"
-SRC_URI[md5sum] = "92cca093312b5a71a7be7dc7d1d32509"
-SRC_URI[sha256sum] = "699db4da3621904113e040703220abb1148dfef477b55305e2f14a4f1f8f25d4"
+
+SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
+SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
 
 S = "${WORKDIR}/${BPN}_${PV}"
 
-- 
2.1.4


