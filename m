Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 089AE7ED40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:21:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9Lxnq010547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:21:59 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:21:58 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:05 -0400
Message-ID: <20190813092118.113213-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 03/16] libxfce4ui: 4.13.6 -> 4.14.1
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
X-List-Received-Date: Tue, 13 Aug 2019 09:21:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxfce4ui/{libxfce4ui_4.13.6.bb => libxfce4ui_4.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.6.bb => libxfce4ui_4.14.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
index 5c4ccda26..6b26200aa 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
 "
-SRC_URI[md5sum] = "9e5a805d2d557df79e571468978a2766"
-SRC_URI[sha256sum] = "3c5e505ce56a5993db473efed9962705dd255ffaee17009ed1b3e9f40b543969"
+SRC_URI[md5sum] = "50eae4bab5eeced186bce16fb5f802ac"
+SRC_URI[sha256sum] = "c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada9b770325bed87f2da"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
-- 
2.20.0


