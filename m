Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBF487E552
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8jDVj026454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:23 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:02 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:16 -0400
Message-ID: <20190531084423.172617-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 03/10] xfce4-panel: 4.13.4 -> 4.13.5
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
X-List-Received-Date: Fri, 31 May 2019 08:45:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
index 18e054c9d..a4b200a7e 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c0f132fed2110d37f351aadc9e80a034"
-SRC_URI[sha256sum] = "36ffd26ef7f5867c01ba310475b4358ff0e588cfd5599a266f0037a6c20052a1"
+SRC_URI[md5sum] = "376e360fb87095edaea7df8ca34fe6a7"
+SRC_URI[sha256sum] = "0d05b6dd8c91c154a364a3e31583c5f423c33e26d44d43cc409165f7d578ca15"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
-- 
2.20.0


