Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3AFE78DF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:12:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w717C3jT001883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:12:03 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:12:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:40 +0800
Message-ID: <930ab77bf184f893823ac69134c24a537ac7fd90.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/16] python3-blivetgui: 2.1.5 -> 2.1.8
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
X-List-Received-Date: Wed, 01 Aug 2018 07:12:03 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-blivetgui_2.1.5.bb => python3-blivetgui_2.1.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.5.bb => python3-blivetgui_2.1.8.bb} (92%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
similarity index 92%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
index 28c2565..91f0dff 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "52ae8c000843c05abd1d8749f44bbe2e5d891d3d"
+SRCREV = "a4fd427ee2acc5a8f5fb030bf7816917cee63bd8"
 SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
 "
 
-- 
2.7.4


