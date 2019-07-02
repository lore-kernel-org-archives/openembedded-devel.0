Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4975E7D32D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x621UC4l010218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:30:12 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:30:11 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:08 -0400
Message-ID: <20190702012913.7163-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 06/11] xfce4-panel: 4.13.5 -> 4.13.6
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
index a4b200a7e..62fb1caa3 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "376e360fb87095edaea7df8ca34fe6a7"
-SRC_URI[sha256sum] = "0d05b6dd8c91c154a364a3e31583c5f423c33e26d44d43cc409165f7d578ca15"
+SRC_URI[md5sum] = "bb18c10b44df2d9afc30abe6bd2f63df"
+SRC_URI[sha256sum] = "42411fee7675bb6fb3055395673dc925d43495df93b5e940a1ae3d0a3d2f63a8"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
-- 
2.20.0


