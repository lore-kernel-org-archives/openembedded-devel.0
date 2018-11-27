Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77DB46D120
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8G8ru020289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:16:08 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:37 +0800
Message-ID: <8ccc9d04f185d30e5cbe7ed8439cc3f075c3ee35.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/12] python3-blivetgui: 2.1.8 -> 2.1.9
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:07 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-blivetgui_2.1.8.bb => python3-blivetgui_2.1.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.8.bb => python3-blivetgui_2.1.9.bb} (92%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb
similarity index 92%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb
index 91f0dff..1c61182 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "a4fd427ee2acc5a8f5fb030bf7816917cee63bd8"
+SRCREV = "393c139c09dc44167b64f47771650ce9aa9d469f"
 SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
 "
 
-- 
2.7.4


