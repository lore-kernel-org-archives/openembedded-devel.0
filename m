Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFDCD78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w717BYLx004304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:34 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:27 +0800
Message-ID: <8fece073d5de62ceaea4c7915ec785daacb172af.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/16] libgnomekbd: 3.22.0 -> 3.26.0
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:33 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgnome/{libgnomekbd_3.22.0.bb => libgnomekbd_3.26.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgnome/{libgnomekbd_3.22.0.bb => libgnomekbd_3.26.0.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
rename to meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb
index 40249fd..456a744 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "7b1ebf99f4254c99922163c262c7ff04"
-SRC_URI[archive.sha256sum] = "340b30dabfebbd4e0e6c0fe34a378966dd5640b5d44595ab8a19b0be255d77df"
+SRC_URI[archive.md5sum] = "8b9d13d46255cde910b3db5a6ebb4727"
+SRC_URI[archive.sha256sum] = "ea3b418c57c30615f7ee5b6f718def7c9d09ce34637324361150744258968875"
 
 EXTRA_OECONF_remove = "--disable-schemas-install"
 
-- 
2.7.4


