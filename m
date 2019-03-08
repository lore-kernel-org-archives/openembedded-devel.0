Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8C7CF35
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:33:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x281Ws3i002139
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:33:04 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:32:43 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:33 -0500
Message-ID: <20190308013237.194105-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308013237.194105-1-kai.kang@windriver.com>
References: <20190308013237.194105-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/5] thunar: 1.8.2 -> 1.8.4
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
X-List-Received-Date: Fri, 08 Mar 2019 01:33:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.2.bb => thunar_1.8.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.2.bb => thunar_1.8.4.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb
index d2a0e30c5..57667102c 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "51a0988625a7e2c944377e75d3effc71"
-SRC_URI[sha256sum] = "75f91045541eb5983e772a564d97f23e5995256bfb9863e0f4a015393421d428"
+SRC_URI[md5sum] = "6a5d0f4ddcc653c4791e555f0dc63828"
+SRC_URI[sha256sum] = "c2bf51da8ddec8f642d67818184ada2ca6e143151e6a45563991db73387a93b0"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.20.0


