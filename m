Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D99B7EAB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:18:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x628IMS0013529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:18:22 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:18:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:19 +0800
Message-ID: <4e3aa81b711f65fefc8838a6ba950bc12273e6a8.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/8] libblockdev: 2.20 -> 2.22
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
X-List-Received-Date: Tue, 02 Jul 2019 08:18:25 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libblockdev/{libblockdev_2.20.bb => libblockdev_2.22.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.20.bb => libblockdev_2.22.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
index 54a188d..c5fc928 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools python3native gobject-introspection
 
-SRCREV = "cb308566c3c5222b8422f78997a1742713b265a9"
+SRCREV = "f6e4538485d0442b3674e182c01ffe5a0f258ad4"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
 "
-- 
2.7.4


