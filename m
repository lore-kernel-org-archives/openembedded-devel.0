Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60FDE7BFC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI7dIJC016780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:19 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:37 +0800
Message-ID: <113778486f25bba1544d80994d49e9a061c9f4c9.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/8] python3-blivet: 3.1.1 -> 3.1.2
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:19 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python-blivet/{python3-blivet_3.1.1.bb => python3-blivet_3.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.1.1.bb => python3-blivet_3.1.2.bb} (96%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb
similarity index 96%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb
index df8cc07..45565ba 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "0a1f8374197f5a5fb368de90a7f1c1258b7cd2b9"
+SRCREV = "878f794a38120a652cab0026b77175b099bf1f9d"
 SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0001-comment-out-selinux.patch \
            file://0002-run_program-support-timeout.patch \
-- 
2.7.4


