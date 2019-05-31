Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5B27E562
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:46:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8jfQ9026460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:51 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:30 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:19 -0400
Message-ID: <20190531084423.172617-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 06/10] libxfce4util: 4.13.2 -> 4.13.3
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
X-List-Received-Date: Fri, 31 May 2019 08:46:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb
index 21cc1dbfc..89a385989 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "e3e8b9dd7e12028d3e642345b85d6ef1"
-SRC_URI[sha256sum] = "c58275ff650080369e742695862c811cb78402c85f243ea0b5aec186027be361"
+SRC_URI[md5sum] = "f39185afe5f612bd2c9b3dfbaf50b4d2"
+SRC_URI[sha256sum] = "724b523a4a9ec8cada727950ab2173be30f256fa332a891ccd28b46f4b91b67e"
-- 
2.20.0


