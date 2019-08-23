Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2BFA7F32F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 07:45:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N7iU1e010975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 00:45:06 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 00:44:19 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 03:43:34 -0400
Message-ID: <20190823074335.162124-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190823074335.162124-1-kai.kang@windriver.com>
References: <20190823074335.162124-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 2/3] xfce4-genmon-plugin: 4.0.1 -> 4.0.2
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
X-List-Received-Date: Fri, 23 Aug 2019 07:45:31 -0000
Content-Transfer-Encoding: 8bit
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
2.20.0


