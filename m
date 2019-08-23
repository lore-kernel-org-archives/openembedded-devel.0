Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5A27F23C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 03:10:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,419,1559491200"; d="scan'208";a="74136710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 11:10:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DDA994CE0439
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 11:10:43 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 11:10:51 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Aug 2019 11:10:11 +0800
Message-ID: <20190823031011.28826-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: DDA994CE0439.A9FD2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] python-futures: upgrade 3.2.0 -> 3.3.0
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
X-List-Received-Date: Fri, 23 Aug 2019 03:10:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-futures_3.2.0.bb => python-futures_3.3.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-futures_3.2.0.bb => python-futures_3.3.0.bb} (72%)

diff --git a/meta-oe/recipes-devtools/python/python-futures_3.2.0.bb b/meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
similarity index 72%
rename from meta-oe/recipes-devtools/python/python-futures_3.2.0.bb
rename to meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
index 3ee945f..1636f73 100644
--- a/meta-oe/recipes-devtools/python/python-futures_3.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=834d982f973c48b6d662b5944c5ab567"
 HOMEPAGE = "https://github.com/agronholm/pythonfutures"
 DEPENDS = "python"
 
-SRC_URI[md5sum] = "d1b299a06b96ccb59f70324716dc0016"
-SRC_URI[sha256sum] = "9ec02aa7d674acb8618afb127e27fde7fc68994c0437ad759fa094a574adb265"
+SRC_URI[md5sum] = "b43a39ae1475e3fd6940f2b4f7214675"
+SRC_URI[sha256sum] = "7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794"
 
 inherit pypi setuptools
 
-- 
2.7.4




