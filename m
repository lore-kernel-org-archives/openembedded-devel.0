Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF267E427
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:46:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8kAgf026506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:46:20 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:59 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:22 -0400
Message-ID: <20190531084423.172617-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 09/10] libxfce4ui: 4.13.4 -> 4.13.5
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
X-List-Received-Date: Fri, 31 May 2019 08:46:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxfce4ui/{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb
index df4b25c52..2bea5f0f6 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
 "
-SRC_URI[md5sum] = "b407cdab73ebd5c33c90db6bdb3ec5ff"
-SRC_URI[sha256sum] = "d63fcdb8e5acb6f0d26075ea17d320dbfbec2058567cd67cb99824c7402a1f79"
+SRC_URI[md5sum] = "692520f2a2cccaaafb0357c3dcbb015b"
+SRC_URI[sha256sum] = "3c38b065796a1cb2c2f2e9a28edaa6b37a3728c1c0b7a4297af9ecd82a8ab66d"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
-- 
2.20.0


