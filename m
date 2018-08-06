Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 808F674F9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:21 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sLkf011174
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:21 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:21 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:02 -0700
Message-Id: <20180806085408.44739-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 04/10] xfce4-embed-plugin: 1.0.0 -> 1.6.0
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:21 -0000

Upgrade xfce4-embed-plugin from 1.0.0 to 1.6.0
* update md5sum of license file that its text has been updated

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/embed/{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb} (57%)

diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
similarity index 57%
rename from meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
rename to meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
index cab3ea754..387b183f1 100644
--- a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
+++ b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "A panel plugin that embeds arbitrary windows (or GtkPlug widgets)
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
 # DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[md5sum] = "c5b86cbc1c54ee7c1d2e95a4502fed8e"
-SRC_URI[sha256sum] = "35d4c6c56dd6468c0e5afe66f657c1526f2d830a577105a51da43657651832e3"
+SRC_URI[md5sum] = "6870b116b85e4fa68d1b9ef76bd1d279"
+SRC_URI[sha256sum] = "c767df6360e8194b32bc24823dd000975edba0cafe525c23d7854029359ee228"
-- 
2.11.0


