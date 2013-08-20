Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A878A6B8CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:02:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 16:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="284568339"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 16:02:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:01:50 +0100
Message-Id: <2240cb5e0f4aacd1b1061d5240f9469c704a3fc1.1377039620.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe, meta-webserver][PATCH 3/4] phpmyadmin: update to 4.0.5
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
X-List-Received-Date: Tue, 20 Aug 2013 23:02:20 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_3.5.8.1.bb => phpmyadmin_4.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_3.5.8.1.bb => phpmyadmin_4.0.5.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
index e48e515..f97dc91 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "76976c227041ac7109506b29aec3083a"
-SRC_URI[sha256sum] = "c66737ff55369b1c9e4b116e68f3c517faf7c4bc17e289d008d74fde6c8260f6"
+SRC_URI[md5sum] = "5cc493908d09df1760c7cdcd1622ebf7"
+SRC_URI[sha256sum] = "f4df1190441ce5e094183cfadf8aec4af3a4f131339599e6380a1c6ac0a11fe4"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.8.1.2


