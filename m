Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4156E7E7D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:18:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628Fgib001817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:18:14 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:17:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:16 +0800
Message-ID: <1d23cbdb6949ffc3d2c7b182a6e85a0383ce08ec.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/8] python3-blivet: 3.1.2 -> 3.1.4
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
X-List-Received-Date: Tue, 02 Jul 2019 08:18:33 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python-blivet/{python3-blivet_3.1.2.bb => python3-blivet_3.1.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.1.2.bb => python3-blivet_3.1.4.bb} (96%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
similarity index 96%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
index 45565ba..817ef9b 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "878f794a38120a652cab0026b77175b099bf1f9d"
+SRCREV = "9b5ad2d5b5df159963e1c6c24523e1dfe1f71435"
 SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0001-comment-out-selinux.patch \
            file://0002-run_program-support-timeout.patch \
-- 
2.7.4


