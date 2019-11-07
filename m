Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B88607F80E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:25:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,277,1569254400"; d="scan'208";a="77996069"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 16:25:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EAA4C4CE20D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:17:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:25:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 20:04:49 +0800
Message-ID: <1573128289-61799-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EAA4C4CE20D1.A95A9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mcelog: upgrade 164 -> 165
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
X-List-Received-Date: Thu, 07 Nov 2019 08:25:23 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_164.bb => mcelog_165.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_164.bb => mcelog_165.bb} (95%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_164.bb b/meta-oe/recipes-support/mcelog/mcelog_165.bb
similarity index 95%
rename from meta-oe/recipes-support/mcelog/mcelog_164.bb
rename to meta-oe/recipes-support/mcelog/mcelog_165.bb
index af309d1..8af919f 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_164.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_165.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
     file://run-ptest \
 "
 
-SRCREV = "e53631f84a181be371c08e0b961180bff77fd2ab"
+SRCREV = "6b6a8a571b5b0967cadbee770bf444f4e8634cca"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
-- 
2.7.4




