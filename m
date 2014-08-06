Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD9665E2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:21:40 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF19t-0003L6-V2 from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 06:21:37 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 06:21:36 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 6 Aug 2014 06:21:36 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Aug 2014 09:21:33 -0400
Message-ID: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Aug 2014 13:21:36.0814 (UTC)
	FILETIME=[5985E4E0:01CFB179]
Subject: [meta-oe][PATCH] evtest: Provide updated checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 13:21:46 -0000
Content-Type: text/plain

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta-oe/recipes-support/evtest/evtest_1.25.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
index 640cec0..ccaa0c6 100644
--- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
+++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2"
 
 SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"
-SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
-SRC_URI[archive.sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
+SRC_URI[archive.md5sum] = "0ef3fe5e20fa2dee8994827d48482902"
+SRC_URI[archive.sha256sum] = "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b"
 
 inherit autotools pkgconfig
-- 
1.9.1


