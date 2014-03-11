Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07E7D6F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 09:48:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2014 02:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,629,1389772800"; d="scan'208";a="470091081"
Received: from sleopold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.85])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2014 02:48:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 09:48:37 +0000
Message-Id: <f1bd0f2a59ee40750581ad95488394e4c653596b.1394531274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394531274.git.paul.eggleton@linux.intel.com>
References: <cover.1394531274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394531274.git.paul.eggleton@linux.intel.com>
References: <cover.1394531274.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/2] phpmyadmin: update to 4.1.9
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
X-List-Received-Date: Tue, 11 Mar 2014 09:48:48 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_4.1.8.bb => phpmyadmin_4.1.9.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.1.8.bb => phpmyadmin_4.1.9.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb
index 388f188..cd15889 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.9.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "14fd2f6d2f92a8dfb3954513da1c1687"
-SRC_URI[sha256sum] = "857f133911eddcec16824f3ecc7a68f93288ab2a2f1943bfce3b06b58b625cd6"
+SRC_URI[md5sum] = "420c836228ceab8df5557c92e56021d7"
+SRC_URI[sha256sum] = "efc5bd669324cd094cc1912afee9c91fd052fe9f226f767f7ec7b31a1796ce2c"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.8.5.3


