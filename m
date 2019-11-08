Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5927FC49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:30:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78051435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 14:30:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AEBC34B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 14:21:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 8 Nov 2019 14:29:57 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 18:09:44 +0800
Message-ID: <1573207784-79071-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AEBC34B6EC6D.A8F4F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xkbprint: upgrade 1.0.4 -> 1.0.5
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
X-List-Received-Date: Fri, 08 Nov 2019 06:30:01 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xkbprint_1.0.4.bb => xkbprint_1.0.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbprint_1.0.4.bb => xkbprint_1.0.5.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb
index 26977be..7b6ef96 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "3c25b40de530112c08bf7d229c5c6a28"
-SRC_URI[sha256sum] = "0b3faab8fefad03dfb7e866f634cf859822801de6b5fc6cf5e0a62857ed93e12"
+SRC_URI[md5sum] = "9c34da77363dc3d0f616980da87244bf"
+SRC_URI[sha256sum] = "5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa"
-- 
2.7.4




