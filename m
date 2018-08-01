Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D919E78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w717Bh1H001827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:43 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:31 +0800
Message-ID: <789ce4b7f57b8321f5af7b3f7238552783be27bd.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/16] efibootmgr: 0.15 -> 0.16
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:43 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-bsp/efibootmgr/{efibootmgr_0.15.bb => efibootmgr_0.16.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/efibootmgr/{efibootmgr_0.15.bb => efibootmgr_0.16.bb} (93%)

diff --git a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.15.bb b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb
similarity index 93%
rename from meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.15.bb
rename to meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb
index 9cc62a9..6497e09 100644
--- a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.15.bb
+++ b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb
@@ -10,7 +10,7 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "5c14da22802576a99ebb854f7aa174f796f7b031"
+SRCREV = "a5103251a11663adddc85c86e0b8d3d3b73cbb4a"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.7.4


