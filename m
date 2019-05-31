Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06F067E56C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8jT5t007250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:29 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:28 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:17 -0400
Message-ID: <20190531084423.172617-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 04/10] thunar-volman: 0.9.1 -> 0.9.2
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
X-List-Received-Date: Fri, 31 May 2019 08:45:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
index 712453a39..3139625ac 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "4992a18f422918c33b562d6e66045754"
-SRC_URI[sha256sum] = "cd87291a427e8a561c566dca3aa7e93b56fdce4caefc755dde0f59198f6db359"
+SRC_URI[md5sum] = "af216d5b60820e7cd39aae1b5ad869a3"
+SRC_URI[sha256sum] = "b944b4299b73d2ca79184922dfea49782e4849f5960e209def71ac700a92ff27"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


