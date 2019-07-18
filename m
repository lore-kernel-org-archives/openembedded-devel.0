Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAD706BF37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 10:03:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6IA3Pvu015158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 03:03:26 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 18 Jul 2019 03:03:25 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jul 2019 06:03:22 -0400
Message-ID: <20190718100322.88945-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-verve-plugin: 1.1.0 -> 2.0.0
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
X-List-Received-Date: Thu, 18 Jul 2019 10:03:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

xfce4-verve-plugin 2.0.0 is first GTK+ 3 release.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-verve-plugin_1.1.0.bb => xfce4-verve-plugin_2.0.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_1.1.0.bb => xfce4-verve-plugin_2.0.0.bb} (62%)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
similarity index 62%
rename from meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
index 57951608f..36e04a438 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
@@ -5,7 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "dbus-glib-native"
-
-SRC_URI[md5sum] = "ddd0190ae56f6117dbcf9ff2bf5a8cbf"
-SRC_URI[sha256sum] = "a3196f818c7ad57d19cd6581e168fd2b9f96de070246aea70c35ce2e5f9d9c84"
+SRC_URI[md5sum] = "94429b1be9d66ba9b31e4aafb726a8c7"
+SRC_URI[sha256sum] = "9e6510ba6c48fcfc60d1c6ab14613dd7b6ff095cabbf4746f82bf788d8ab4cd2"
-- 
2.20.0


