Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFC766B076
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9Mc09027679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:22:54 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:22:28 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:09 -0400
Message-ID: <20190813092118.113213-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 07/16] thunar-volman: 0.9.3 -> 0.9.5
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_0.9.3.bb => thunar-volman_0.9.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.3.bb => thunar-volman_0.9.5.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
index 93489d881..fff7c0302 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "699a0534a0899e31366018a9e9e2aeb0"
-SRC_URI[sha256sum] = "29309091db8b0f08c5a727625cc470673134977d7966cae0392f131300f9d5e9"
+SRC_URI[md5sum] = "f9ef39ed4bbff05eb74058dfff24dd84"
+SRC_URI[sha256sum] = "7ea7c6693334f2248cf399586af8974dfb7db9aad685ee31ac100e62e19a1837"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


