Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 801687E576
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8jUhP025939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:30 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:29 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:18 -0400
Message-ID: <20190531084423.172617-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 05/10] xfce4-appfinder: 4.13.2 -> 4.13.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 08:45:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb
index e9f6e28b4..309559646 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb
@@ -8,7 +8,7 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "8b4c2ab413748fcd0cc51444418d5af3"
-SRC_URI[sha256sum] = "fd774acbcab08dbb88bcbf28eecf73ec9f55b13e1f2058021b63f703c4989d97"
+SRC_URI[md5sum] = "c2069a14c85c8a3e537b2d4c552d36d2"
+SRC_URI[sha256sum] = "d738082a5fb01e42ea6333803012fd80258061f444afbbbd7b05a0f620a32ba6"
 
 FILES_${PN} += "${datadir}/metainfo"
-- 
2.20.0


