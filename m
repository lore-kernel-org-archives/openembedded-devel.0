Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D76774FAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:19 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sJm9011166
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:19 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:19 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:00 -0700
Message-Id: <20180806085408.44739-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 02/10] xfce4-mount-plugin: 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:19 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-mount-plugin_1.1.2.bb => xfce4-mount-plugin_1.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.2.bb => xfce4-mount-plugin_1.1.3.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
index 67009377e..4600104ad 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit xfce-panel-plugin
 
 SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch"
-SRC_URI[md5sum] = "7eba9696d82433a5577741214d34b588"
-SRC_URI[sha256sum] = "54578447abaf9da630a750d64acdc37d4fd20dda6460208d6d1ffaa9e43ee1a6"
+SRC_URI[md5sum] = "2f1f903d0bdf6ee6776afd8af73497ac"
+SRC_URI[sha256sum] = "aae5bd6b984bc78daf6b5fb9d15817a27253674a4264ad60f62ccb1aa194911e"
-- 
2.11.0


