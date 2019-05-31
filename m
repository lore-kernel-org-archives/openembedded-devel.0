Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E170B7D2B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8j15B025936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:02 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:44:56 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:15 -0400
Message-ID: <20190531084423.172617-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 02/10] xfdesktop: 4.13.3 -> 4.13.4
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
X-List-Received-Date: Fri, 31 May 2019 08:45:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
index 2c70a9c31..f02a6bffe 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "f08944f1b69ce1c6e1fbb9d7f4cb1da7"
-SRC_URI[sha256sum] = "80f7f28ef17638fe1cf4481db694731c208785a56b6c840005202f9c2db238f5"
+SRC_URI[md5sum] = "d1174af12148141a07b62cc051c43c84"
+SRC_URI[sha256sum] = "f4f7fa5162512971c25066eb04ef78f0d075656da79b6f7425ffb619a5119ca0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


