Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 881707F93D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:21:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77731080"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 15:21:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D0C4C4CE1515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:13:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 15:21:02 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 23:15:29 +0800
Message-ID: <1572534929-51240-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D0C4C4CE1515.A6FA1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] phoronix-test-suite: upgrade 8.8.1 -> 9.0.1
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
X-List-Received-Date: Thu, 31 Oct 2019 07:21:03 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{phoronix-test-suite_8.8.1.bb => phoronix-test-suite_9.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.8.1.bb => phoronix-test-suite_9.0.1.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.0.1.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.0.1.bb
index c4df1a9..89050e4 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.0.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "08fc81d25a1c24c7b091ac78ef145da6"
-SRC_URI[sha256sum] = "d6feeeafb6d636667480b6fbfd2a6537e3b354b2c7c72305784d14d38ab4bcd0"
+SRC_URI[md5sum] = "58023c8136a0206909552942660fe28a"
+SRC_URI[sha256sum] = "a117a4350774e67989d90bf0b5e82a8072652f8caa60a62c3e5f64adc317ce14"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4




