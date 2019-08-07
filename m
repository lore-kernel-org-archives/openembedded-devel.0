Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 52B1D7F445
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:04:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73132256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 15:04:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D1EE94CDFCDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 15:04:13 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 15:04:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Aug 2019 15:03:31 +0800
Message-ID: <20190807070331.30385-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D1EE94CDFCDE.AD661
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] protobuf: upgrade 3.9.0 -> 3.9.1
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
X-List-Received-Date: Wed, 07 Aug 2019 07:04:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/protobuf/{protobuf_3.9.0.bb => protobuf_3.9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.9.0.bb => protobuf_3.9.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.9.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.9.1.bb
index 38e2286..94d8def 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
+SRCREV = "655310ca192a6e3a050e0ca0b7084a2968072260"
 
 SRC_URI = "git://github.com/google/protobuf.git;branch=3.9.x \
            file://run-ptest \
-- 
2.7.4




