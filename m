Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75D5C79FDC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 349D318297
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ks8xagp7rvym
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A095D18293
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 898AF1E07C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A0351E07A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 6B42425FC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:39:07 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39d7ou012474
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:39:07 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39d7Tt012473
	for openembedded-devel@lists.openembedded.org;
	Sat, 3 Nov 2018 10:39:07 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:39:05 +0100
Message-Id: <20181103093905.12433-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
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
X-List-Received-Date: Sat, 03 Nov 2018 09:39:07 -0000

The library parts are actually LGPL-2.1, not LGPL-2.0.

License-Update: The correct license is LGPL-2.1, not LGPL-2.0.
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 75f4d89a0..4cb5eb138 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.sourceware.org/lvm2/"
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
-- 
2.12.0


