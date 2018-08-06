Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1D36755AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:23 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sOOM011194
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:24 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:24 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:04 -0700
Message-Id: <20180806085408.44739-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 06/10] xfce4-genmon-plugin: 4.0.0 -> 4.0.1
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:24 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-genmon-plugin_4.0.0.bb => xfce4-genmon-plugin_4.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.0.bb => xfce4-genmon-plugin_4.0.1.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb
index 0624fe96d..002e93da4 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "f28cfbf9c82e758a236c1f5fcbcb8a35"
-SRC_URI[sha256sum] = "a7db4f786166643076323dcde99ad12e92383cc29b4b806862d5483ec468c3e3"
+SRC_URI[md5sum] = "9dd0681c179302d56d92bbda5765bd09"
+SRC_URI[sha256sum] = "4c6ce37fbe71094548b44862587c2813da991aeaaecff8e572724dbbec83ab86"
-- 
2.11.0


