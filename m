Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 425037E921
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x621TG4C024119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:29:41 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:29:36 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:03 -0400
Message-ID: <20190702012913.7163-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 01/11] thunar: 1.8.6 -> 1.8.7
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.6.bb => thunar_1.8.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.6.bb => thunar_1.8.7.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb
index 4375ce065..3a59f1080 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3cb40548d7c642176eab8b97a5ba6d29"
-SRC_URI[sha256sum] = "c0e5fb828e3d036941dfeb7ed7f9f2b17b729fc044c2bf7c4218c1c91b38ef2a"
+SRC_URI[md5sum] = "9abdbc78cbf9957f9727c327476a08c2"
+SRC_URI[sha256sum] = "3e033af06751beee23e73cf16cbd97513d3c0adf358d8a42158af38a44b9d329"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.20.0


