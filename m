Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 379A37ED41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9NTUj010556
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:29 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:28 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:14 -0400
Message-ID: <20190813092118.113213-13-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 12/16] xfce4-power-manager: 1.6.3 -> 1.6.5
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-power-manager_1.6.3.bb => xfce4-power-manager_1.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.3.bb => xfce4-power-manager_1.6.5.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
index b03adc46b..284a29ba2 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "b5ed83dd7f30a54f95d1fae1c84fa33c"
-SRC_URI[sha256sum] = "debd8ac2409b5ac230593894b8bb668298f78bd12891623edbfc32ac87c64011"
+SRC_URI[md5sum] = "709efbc2de9ed84b4831847ff70bcd7f"
+SRC_URI[sha256sum] = "10adb67899b181ca5fc577fc9bb7a698fb94e42073585f7e2be642c7db127a74"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.20.0


