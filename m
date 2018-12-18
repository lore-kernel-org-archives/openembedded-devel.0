Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08E917C042
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI7dU1p014818
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:40 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:38 +0800
Message-ID: <de8bb09af0fa90308e24b3e17270cdc363fa5521.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/8] python3-blivetgui: 2.1.9 -> 2.1.10
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
X-List-Received-Date: Tue, 18 Dec 2018 07:40:05 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-blivetgui_2.1.9.bb => python3-blivetgui_2.1.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.9.bb => python3-blivetgui_2.1.10.bb} (92%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
similarity index 92%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
index 1c61182..2ea8103 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "393c139c09dc44167b64f47771650ce9aa9d469f"
+SRCREV = "67ec0b7a0e065ba24ab87963409bfb21b2aac6dd"
 SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
 "
 
-- 
2.7.4


