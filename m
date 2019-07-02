Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8A67E773
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x621TtYv024134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:30:05 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:29:44 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:06 -0400
Message-ID: <20190702012913.7163-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 04/11] thunar-volman: 0.9.2 -> 0.9.3
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
index 3139625ac..7b5a90b77 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "af216d5b60820e7cd39aae1b5ad869a3"
-SRC_URI[sha256sum] = "b944b4299b73d2ca79184922dfea49782e4849f5960e209def71ac700a92ff27"
+SRC_URI[md5sum] = "699a0534a0899e31366018a9e9e2aeb0"
+SRC_URI[sha256sum] = "29309091db8b0f08c5a727625cc470673134977d7966cae0392f131300f9d5e9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


