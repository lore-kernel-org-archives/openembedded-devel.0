Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28F5665D4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 16:40:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Oct 2014 09:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,776,1406617200"; d="scan'208";a="624095847"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2014 09:40:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2014 19:40:31 +0300
Message-Id: <1414082432-14111-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/3] mpg123: upgrade to 1.21.0
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
X-List-Received-Date: Thu, 23 Oct 2014 16:40:58 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-multimedia/mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
rename to meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index e669446..4efdeab 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -36,8 +36,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "87731f1437cfd8c50537a606d81130e4"
-SRC_URI[sha256sum] = "869024e01d7cb4dae1aea2f2a10420d4be7e1ac02a9c434d06d727599169b01b"
+SRC_URI[md5sum] = "13a9df5d4e7aa110e4ae27cf30128ce9"
+SRC_URI[sha256sum] = "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527ce9375fcfb15dcba"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


