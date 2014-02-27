Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B05416F309
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 19:01:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2014 11:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,556,1389772800"; d="scan'208";a="489424579"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.24])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2014 11:00:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 19:00:35 +0000
Message-Id: <c3c092013cfead58b7b120d9f89fdc25d1464d63.1393527452.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v3 3/3] phpmyadmin: update to 4.1.8
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
X-List-Received-Date: Thu, 27 Feb 2014 19:01:33 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.8.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.8.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb
index f97dc91..388f188 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.0.5.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.1.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "5cc493908d09df1760c7cdcd1622ebf7"
-SRC_URI[sha256sum] = "f4df1190441ce5e094183cfadf8aec4af3a4f131339599e6380a1c6ac0a11fe4"
+SRC_URI[md5sum] = "14fd2f6d2f92a8dfb3954513da1c1687"
+SRC_URI[sha256sum] = "857f133911eddcec16824f3ecc7a68f93288ab2a2f1943bfce3b06b58b625cd6"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.8.5.3


