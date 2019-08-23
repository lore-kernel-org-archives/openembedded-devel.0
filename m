Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6B987F344
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 07:45:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N7iU1n010975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 00:45:17 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 00:44:50 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 03:43:35 -0400
Message-ID: <20190823074335.162124-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190823074335.162124-1-kai.kang@windriver.com>
References: <20190823074335.162124-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 3/3] xfce4-weather-plugin: 0.9.1 -> 0.10.0
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
X-List-Received-Date: Fri, 23 Aug 2019 07:45:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Translation update only release.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...weather-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.9.1.bb => xfce4-weather-plugin_0.10.0.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb
index c53ca13c8..96c2048be 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "e0bde3ba6a7e863022a86a23c7871255"
-SRC_URI[sha256sum] = "7cdc18b8df759dee4ceaaf6ce303eff7fda48e247dbc26b78142929213506cfd"
+SRC_URI[md5sum] = "7ff4ab636f93addba0817bf6436d2964"
+SRC_URI[sha256sum] = "4423a0c27830fd1f08e063aaefbf70f31d89235d75549ca841d677ab2e409572"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.20.0


