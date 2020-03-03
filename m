Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6E760B3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:31:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488924"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:31:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EFBB350A9980
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:21:23 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:31:07 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:31:16 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:58 -0800
Message-ID: <1583236320-114088-8-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EFBB350A9980.A3E98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] protobuf-c: upgrade 1.3.2 -> 1.3.3
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
X-List-Received-Date: Tue, 03 Mar 2020 05:31:19 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../protobuf/{protobuf-c_1.3.2.bb => protobuf-c_1.3.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.2.bb => protobuf-c_1.3.3.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
index b92f82dec..94c389357 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRCREV = "1390409f4ee4e26d0635310995b516eb702c3f9e"
+SRCREV = "f20a3fa131c275a0e795d99a28f94b4dbbb5af26"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
            file://0001-avoid-race-condition.patch \
-- 
2.17.1




