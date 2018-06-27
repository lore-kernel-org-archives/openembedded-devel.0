Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC067487E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5R9oUmC021426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:50:45 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:50:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:19 -0700
Message-ID: <20180627094922.109996-9-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/13] libgphoto2: Upgrade to 2.5.17
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:54 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../gphoto2/{libgphoto2_2.5.16.bb => libgphoto2_2.5.17.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.16.bb => libgphoto2_2.5.17.bb} (92%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb
similarity index 92%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb
index 7a691c611..91c5ed211 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "084d220d078d28c0c7a3ba13f4476128"
-SRC_URI[libgphoto2.sha256sum] = "e757416d1623e01a9d0d294b2e790162e434c0964f50d3b7ff1a3424b62a2906"
+SRC_URI[libgphoto2.md5sum] = "ae78e7a7936a6962c3a22b256bee1869"
+SRC_URI[libgphoto2.sha256sum] = "417464f0a313fa937e8a71cdf18a371cf01e750830195cd63ae31da0d092b555"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.17.1


