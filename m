Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1E1865CE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:09:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2I29BiE027175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Mar 2019 19:09:11 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 17 Mar 2019 19:09:10 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 17 Mar 2019 22:08:29 -0400
Message-ID: <20190318020829.35542-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190318020829.35542-1-kai.kang@windriver.com>
References: <20190318020829.35542-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v3 2/2] gvfs: 1.39.92 -> 1.40.0
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
X-List-Received-Date: Mon, 18 Mar 2019 02:09:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index c7cdd5557..7f239c413 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "5b60e70ea5a6421bc72eb339059b1175"
-SRC_URI[archive.sha256sum] = "ae44307c127268b6c8cbe5a93bb4a248fb8a6df430d29726e8aeb2ba40bd5513"
+SRC_URI[archive.md5sum] = "96ef53ed613e4d223e0db3a7acea44f0"
+SRC_URI[archive.sha256sum] = "3739d64b79c95a9f0f9faf2c5f9e5298b4b2ebdd6431435ce656ecd19b31e2f2"
 
 
 EXTRA_OEMESON = " \
-- 
2.20.0


