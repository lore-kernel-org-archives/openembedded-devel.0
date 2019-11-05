Return-Path: <zhengrq.fnst@cn.fujitsu.com>
X-Greylist: delayed 607 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Nov 2019 04:26:30 UTC
Received: from song.cn.fujitsu.com (song.cn.fujitsu.com [218.97.8.244])
	by mail.openembedded.org (Postfix) with ESMTP id DCDFF7F961
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 04:26:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,269,1569254400"; 
   d="scan'208";a="3778679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by song.cn.fujitsu.com with ESMTP; 05 Nov 2019 12:16:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3ECE14CE167C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:08:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 5 Nov 2019 12:16:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 15:55:57 +0800
Message-ID: <1572940557-21647-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3ECE14CE167C.A98CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] ledmon: Modify the Upstream-Status to Submitted.
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
X-List-Received-Date: Tue, 05 Nov 2019 04:26:31 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
index b65f1a7..09f4993 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
@@ -5,7 +5,8 @@ Subject: [PATCH] Don't build with -Werror to fix compile error.
 | amd_sgpio.c: In function '_write_amd_register':
 | amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
+https://github.com/intel/ledmon/pull/48/commits
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
-- 
2.7.4




