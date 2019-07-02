Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7417EA97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x621UeaA010221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:30:40 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:30:39 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:11 -0400
Message-ID: <20190702012913.7163-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 09/11] xfdesktop: 4.13.4 -> 4.13.5
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
index f02a6bffe..ef603ca1d 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "d1174af12148141a07b62cc051c43c84"
-SRC_URI[sha256sum] = "f4f7fa5162512971c25066eb04ef78f0d075656da79b6f7425ffb619a5119ca0"
+SRC_URI[md5sum] = "6a58fe3119b9fb3eb6bb563e14689739"
+SRC_URI[sha256sum] = "b7d273d36f5f39a446c4d0303148bc595ed7b0f36269619c91526edd1d1caeb6"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


