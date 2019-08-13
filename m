Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB1B760017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9NvKo010560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:57 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:56 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:17 -0400
Message-ID: <20190813092118.113213-16-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 15/16] xfdesktop: 4.13.5 -> 4.14.1
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfdesktop/{xfdesktop_4.13.5.bb => xfdesktop_4.14.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.5.bb => xfdesktop_4.14.1.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
index c1aac7243..ec4f00f3d 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "6a58fe3119b9fb3eb6bb563e14689739"
-SRC_URI[sha256sum] = "b7d273d36f5f39a446c4d0303148bc595ed7b0f36269619c91526edd1d1caeb6"
+SRC_URI[md5sum] = "de4b8f6687862ad46dbe4e1ced453f4d"
+SRC_URI[sha256sum] = "f705a016246ec54ab0c688d1a0577f6c2b45a446690aa8d9e5a7ac23efebf882"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


