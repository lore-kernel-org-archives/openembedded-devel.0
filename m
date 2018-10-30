Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57E4979C7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:50:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U1oX8n001990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:50:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 18:50:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 09:07:48 +0800
Message-ID: <20181030010748.3266-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030010748.3266-1-kai.kang@windriver.com>
References: <20181030010748.3266-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 4/4] thunar: 1.8.1 -> 1.8.2
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
X-List-Received-Date: Tue, 30 Oct 2018 01:50:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb
index 726ce91bd..d2a0e30c5 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.2.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "f0681eccff31c027097a3e1e7db85218"
-SRC_URI[sha256sum] = "96fabaa68db32f513e9bcb34fa2a26c1462127727fad0bc25a8a5ba9aab4c12c"
+SRC_URI[md5sum] = "51a0988625a7e2c944377e75d3effc71"
+SRC_URI[sha256sum] = "75f91045541eb5983e772a564d97f23e5995256bfb9863e0f4a015393421d428"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.18.0


