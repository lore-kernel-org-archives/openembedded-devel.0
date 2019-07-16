Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE347ECB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:12:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GECaLx015349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:12:37 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:12:36 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:17 -0400
Message-ID: <20190716141231.77957-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 01/15] libxfce4util: 4.13.3 -> 4.13.4
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
X-List-Received-Date: Tue, 16 Jul 2019 14:12:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4util_4.13.3.bb => libxfce4util_4.13.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.3.bb => libxfce4util_4.13.4.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb
index 89a385989..8a68a6578 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "f39185afe5f612bd2c9b3dfbaf50b4d2"
-SRC_URI[sha256sum] = "724b523a4a9ec8cada727950ab2173be30f256fa332a891ccd28b46f4b91b67e"
+SRC_URI[md5sum] = "ebb1d229a7a7f86a969a72b8d97c8531"
+SRC_URI[sha256sum] = "57dd4ba226432afdf98cea4700a4679bb1b57ce80713167f99fde50ad87d0863"
-- 
2.20.0


