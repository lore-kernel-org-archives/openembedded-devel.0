Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 813B86600B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:06:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 04:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="431437191"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 04:06:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 12:05:55 +0100
Message-Id: <0065398fa5867f48c5764abb72a706a316c3ffc9.1399979085.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/4] phpmyadmin: update to 4.2.0
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
X-List-Received-Date: Tue, 13 May 2014 11:06:39 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_4.1.9.bb => phpmyadmin_4.2.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.1.9.bb => phpmyadmin_4.2.0.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb
index cd15889..0298f6b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "420c836228ceab8df5557c92e56021d7"
-SRC_URI[sha256sum] = "efc5bd669324cd094cc1912afee9c91fd052fe9f226f767f7ec7b31a1796ce2c"
+SRC_URI[md5sum] = "f787bcf5c98a1702d9c8c653e72eb689"
+SRC_URI[sha256sum] = "fef460aa493f696b8536c273ef126bb142b88dd15c7ef584aca90d2ea07d3bbc"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.9.0


