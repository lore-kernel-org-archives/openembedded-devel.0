Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59A4A7848E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 08:39:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v818dJr9014258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2017 01:39:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Sep 2017 01:39:18 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Sep 2017 04:39:17 -0400
Message-ID: <1504255157-223110-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openjpeg: upgrade to 2.2.0
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
X-List-Received-Date: Fri, 01 Sep 2017 08:39:18 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../openjpeg/{openjpeg_2.1.1.bb => openjpeg_2.2.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.1.1.bb => openjpeg_2.2.0.bb} (79%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
similarity index 79%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index fa4f796..129aba7 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
 SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "0cc4b2aee0a9b6e9e21b7abcd201a3ec"
-SRC_URI[sha256sum] = "82c27f47fc7219e2ed5537ac69545bf15ed8c6ba8e6e1e529f89f7356506dbaa"
+SRC_URI[md5sum] = "269bb0b175476f3addcc0d03bd9a97b6"
+SRC_URI[sha256sum] = "6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b"
 
 inherit cmake
 
-- 
2.8.1


