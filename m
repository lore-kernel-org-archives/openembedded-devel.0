Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8A6576E01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R9HDDa010280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:17:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 02:17:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Aug 2015 17:12:48 +0800
Message-ID: <1440666768-28737-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] sg3-utils: upgrade to 1.41
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
X-List-Received-Date: Thu, 27 Aug 2015 09:17:17 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../sg3-utils/{sg3-utils_1.40.bb => sg3-utils_1.41.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.40.bb => sg3-utils_1.41.bb} (77%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb
similarity index 77%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb
index 754e03f..61250fa 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 
-SRC_URI[md5sum] = "4a74ed491b0891fc60cd91d2b5d68331"
-SRC_URI[sha256sum] = "44a9ecfd3af018fa9f3586067a8fa5f4874451c3d773d74436d262a7e530ee83"
+SRC_URI[md5sum] = "86ebe3881535ee5c48f81be5be44b362"
+SRC_URI[sha256sum] = "c4e2893c36df1ee5b07840ab7c22129544f5dc8a55f7cc8815c9cd8e44ec31c0"
 
 inherit autotools-brokensep
 
-- 
1.9.1


