Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA35D7E569
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:44:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8itRn007159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:44:55 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:44:54 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:14 -0400
Message-ID: <20190531084423.172617-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 01/10] thunar: 1.8.4 -> 1.8.6
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
X-List-Received-Date: Fri, 31 May 2019 08:44:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb
index 57667102c..4375ce065 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.4.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.6.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6a5d0f4ddcc653c4791e555f0dc63828"
-SRC_URI[sha256sum] = "c2bf51da8ddec8f642d67818184ada2ca6e143151e6a45563991db73387a93b0"
+SRC_URI[md5sum] = "3cb40548d7c642176eab8b97a5ba6d29"
+SRC_URI[sha256sum] = "c0e5fb828e3d036941dfeb7ed7f9f2b17b729fc044c2bf7c4218c1c91b38ef2a"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.20.0


