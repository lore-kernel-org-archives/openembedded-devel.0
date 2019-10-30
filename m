Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 021EE7F87C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:08:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,246,1569254400"; d="scan'208";a="77681423"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 17:08:34 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 16C7D4B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 17:00:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 17:08:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 01:02:49 +0800
Message-ID: <1572454969-33428-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 16C7D4B6EC86.A6A8A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] babeld: upgrade 1.8.4 -> 1.9.1
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
X-List-Received-Date: Wed, 30 Oct 2019 09:08:36 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-protocols/babeld/{babeld_1.8.4.bb => babeld_1.9.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.8.4.bb => babeld_1.9.1.bb} (93%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb b/meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb
similarity index 93%
rename from meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb
index 550e126..27e7b43 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
-SRCREV = "8627b6fcd4992f2e7992ecec97a4a4aa2d7ff099"
+SRCREV = "0835d5d894ea016ab7b81562466cade2c51a12d4"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




