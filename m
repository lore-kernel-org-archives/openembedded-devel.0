Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E69E17BFDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI7cYh1014805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:14 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:35 +0800
Message-ID: <079403678a6de5c9616fffa7069b57b9ca12cce5.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/8] efivar: 36 -> 37
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:34 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/efivar/{efivar_36.bb => efivar_37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/efivar/{efivar_36.bb => efivar_37.bb} (96%)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_36.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
similarity index 96%
rename from meta-oe/recipes-bsp/efivar/efivar_36.bb
rename to meta-oe/recipes-bsp/efivar/efivar_37.bb
index 20588ee..a038716 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_36.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_37.bb
@@ -12,7 +12,7 @@ inherit pkgconfig
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "ef3449223ecd1e7b1098c523d66b2f960fe839ea"
+SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
            file://allow-multi-definitions-for-native.patch \
            "
-- 
2.7.4


