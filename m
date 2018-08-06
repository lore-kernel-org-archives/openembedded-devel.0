Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A59AE74F9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:22 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sNHi011189
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:23 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:23 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:03 -0700
Message-Id: <20180806085408.44739-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 05/10] xfce4-eyes-plugin: 4.4.5 -> 4.5.0
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:22 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../eyes/{xfce4-eyes-plugin_4.4.5.bb => xfce4-eyes-plugin_4.5.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.5.bb => xfce4-eyes-plugin_4.5.0.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb
index 4e4c41096..e5c21a1ac 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "b2881924fdcc1230d9fa82c10f1a6afe"
-SRC_URI[sha256sum] = "648f7a1738d852af9482d11330b8ab33901f05256984de73d8cea4d7d7311937"
+SRC_URI[md5sum] = "6e274ceda37c7a8ae0821d9d49e965e9"
+SRC_URI[sha256sum] = "fdae00036383105a15d12e9809abd5945a8f2152b17e16ccdfbfe5bd9733f29d"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
2.11.0


