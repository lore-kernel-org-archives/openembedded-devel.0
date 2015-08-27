Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8BEF76DB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:59:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R8xGB4018632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 01:59:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 01:59:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Aug 2015 16:54:46 +0800
Message-ID: <1440665686-19364-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] lcms: upgrade 2.6->2.7
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
X-List-Received-Date: Thu, 27 Aug 2015 08:59:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

2.7 is a maintenance release

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.6.bb => lcms_2.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.6.bb => lcms_2.7.bb} (70%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.6.bb b/meta-oe/recipes-support/lcms/lcms_2.7.bb
similarity index 70%
rename from meta-oe/recipes-support/lcms/lcms_2.6.bb
rename to meta-oe/recipes-support/lcms/lcms_2.7.bb
index ad727df..12ccb20 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.6.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.7.bb
@@ -3,8 +3,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[md5sum] = "f4c08d38ceade4a664ebff7228910a33"
-SRC_URI[sha256sum] = "5172528839647c54c3da211837225e221be93e4733f5b5e9f57668f7107e14b1"
+SRC_URI[md5sum] = "06c1626f625424a811fb4b5eb070839d"
+SRC_URI[sha256sum] = "4524234ae7de185e6b6da5d31d6875085b2198bc63b1211f7dde6e2d197d6a53"
 
 DEPENDS = "tiff"
 
-- 
1.9.1


