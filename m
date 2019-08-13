Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 515AF7ED76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9MRhM010550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:22:27 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:22:27 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:08 -0400
Message-ID: <20190813092118.113213-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 06/16] thunar: 1.8.7 -> 1.8.9
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.7.bb => thunar_1.8.9.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.7.bb => thunar_1.8.9.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
index 21430ba59..ff020d0c7 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.7.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "9abdbc78cbf9957f9727c327476a08c2"
-SRC_URI[sha256sum] = "3e033af06751beee23e73cf16cbd97513d3c0adf358d8a42158af38a44b9d329"
+SRC_URI[md5sum] = "fd1166e879294e4490d5fa9dccfdd9da"
+SRC_URI[sha256sum] = "7a758e7ac03501c520c304f8845353315c954d429b17d591b8eea8b14f1350b9"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.20.0


