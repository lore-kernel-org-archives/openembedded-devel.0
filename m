Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 128B97CF39
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x281X6j2006716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:33:06 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:33:05 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:35 -0500
Message-ID: <20190308013237.194105-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308013237.194105-1-kai.kang@windriver.com>
References: <20190308013237.194105-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 3/5] gvfs: 1.39.1 -> 1.39.92
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
X-List-Received-Date: Fri, 08 Mar 2019 01:33:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.39.1.bb => gvfs_1.39.92.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.39.1.bb => gvfs_1.39.92.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
index ca1eb6aa7..fef5d68e3 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "4c68899cfd80d57a153771534193bb9a"
-SRC_URI[archive.sha256sum] = "6e7213570389b17b67433695f515f3b17705ba976168a4c8828fc177cce50223"
+SRC_URI[archive.md5sum] = "5b60e70ea5a6421bc72eb339059b1175"
+SRC_URI[archive.sha256sum] = "ae44307c127268b6c8cbe5a93bb4a248fb8a6df430d29726e8aeb2ba40bd5513"
 
 
 EXTRA_OEMESON = " \
-- 
2.20.0


