Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1C0B605C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 10:18:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18736395"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2017 18:18:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 843C247C610C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 18:18:29 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 11 May 2017 18:18:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 May 2017 18:18:09 +0800
Message-ID: <1494497889-44237-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 843C247C610C.A64CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libssh2: 1.7.0 -> 1.8.0
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
X-List-Received-Date: Thu, 11 May 2017 10:18:35 -0000
Content-Type: text/plain

Upgrade libssh2 from 1.7.0 to 1.8.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/libssh2/{libssh2_1.7.0.bb => libssh2_1.8.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.7.0.bb => libssh2_1.8.0.bb} (84%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
similarity index 84%
rename from meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
index c62dab1..94bfb8f 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "b01662a210e94cccf2f76094db7dac5c"
-SRC_URI[sha256sum] = "e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584"
+SRC_URI[md5sum] = "3d1147cae66e2959ea5441b183de1b1c"
+SRC_URI[sha256sum] = "39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




