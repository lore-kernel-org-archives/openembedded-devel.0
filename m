Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 013607F265
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:22:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA8AMgfB014418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2019 02:22:42 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 8 Nov 2019 02:22:41 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 8 Nov 2019 18:22:34 +0800
Message-ID: <20191108102237.34824-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108102237.34824-1-kai.kang@windriver.com>
References: <20191108102237.34824-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 1/4] xfce4-genmon-plugin: 4.0.1 -> 4.0.2
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
X-List-Received-Date: Fri, 08 Nov 2019 10:22:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Bug fixes and i18n update release.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.1.bb => xfce4-genmon-plugin_4.0.2.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb
index 002e93da4..3108a7760 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "9dd0681c179302d56d92bbda5765bd09"
-SRC_URI[sha256sum] = "4c6ce37fbe71094548b44862587c2813da991aeaaecff8e572724dbbec83ab86"
+SRC_URI[md5sum] = "d808fe77a438c95b97ec6feda6162d22"
+SRC_URI[sha256sum] = "256c22526f61aabf43b91b903b976c13e56198657667df443cdb06b31fbf23aa"
-- 
2.17.1


