Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1BC97F8B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:30:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943157"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:30:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 117874B6EC73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:22:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:30:46 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:10:32 +0800
Message-ID: <1573042232-43237-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 117874B6EC73.A6143
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dialog: upgrade 1.3-20190728 -> 1.3-20190808
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
X-List-Received-Date: Wed, 06 Nov 2019 08:30:49 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20190728.bb => dialog_1.3-20190808.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20190728.bb => dialog_1.3-20190808.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
index d414bc6..a1acfcd 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "e9d7f8b5e7b17183b0fb9297c0f57840"
-SRC_URI[sha256sum] = "e5eb0eaaef9cae8c822887bd998e33c2c3b94ebadd37b4f6aba018c0194a2a87"
+SRC_URI[md5sum] = "f48b597251a26c522002736652e0300c"
+SRC_URI[sha256sum] = "886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.7.4




