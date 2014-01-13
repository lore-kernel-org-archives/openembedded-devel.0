Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 32F6B6DC13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:38:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2014 02:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,652,1384329600"; d="scan'208";a="457835856"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2014 02:38:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 10:38:28 +0000
Message-Id: <608e55d5a558a45c188fd0b3f810c4937201087e.1389609476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 3/3] phpmyadmin: update to 4.1.4
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
X-List-Received-Date: Mon, 13 Jan 2014 10:38:39 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.4.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.4.bb
index f97dc91..c2bc8bb 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "5cc493908d09df1760c7cdcd1622ebf7"
-SRC_URI[sha256sum] = "f4df1190441ce5e094183cfadf8aec4af3a4f131339599e6380a1c6ac0a11fe4"
+SRC_URI[md5sum] = "9802ba0a7ee6afd8941dc8d0af589913"
+SRC_URI[sha256sum] = "4bd23cda85b3ac4e44a1e472a461638230020af78bd03d7178f60d55b8bb1331"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.8.1.2


