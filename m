Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8230B6F3A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:22:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1R3MUqR026843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Feb 2014 19:22:30 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 26 Feb 2014 19:22:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2014 11:22:09 +0800
Message-ID: <940b3fe73867ebe201ab3bdad1515279edbfe912.1393470790.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393470790.git.hongxu.jia@windriver.com>
References: <cover.1393470790.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/4][meta-webserver] phpmyadmin: update to 4.1.4
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
X-List-Received-Date: Thu, 27 Feb 2014 03:22:30 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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


