Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2886473212
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 06:56:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10500147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 14:56:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 000E8403C868
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 14:56:55 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 14:56:55 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 02:56:50 -0400
Message-ID: <1472713010-1957-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 000E8403C868.A3BC2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] sg3-utils: 1.41 -> 1.42
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
X-List-Received-Date: Thu, 01 Sep 2016 06:57:00 -0000
Content-Type: text/plain

Upgrade sg3-utils from 1.41 to 1.42.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../sg3-utils/{sg3-utils_1.41.bb => sg3-utils_1.42.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.41.bb => sg3-utils_1.42.bb} (77%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
similarity index 77%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
index 61250fa..a11bd77 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.41.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 
-SRC_URI[md5sum] = "86ebe3881535ee5c48f81be5be44b362"
-SRC_URI[sha256sum] = "c4e2893c36df1ee5b07840ab7c22129544f5dc8a55f7cc8815c9cd8e44ec31c0"
+SRC_URI[md5sum] = "28080de5bf2222f8b55a29093bec8aea"
+SRC_URI[sha256sum] = "1dcb7a0309bd0ba3d4a83acb526973b80106ee26cd9f7398186cd3f0633c9ef3"
 
 inherit autotools-brokensep
 
-- 
2.7.4




