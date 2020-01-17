Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 68E3B7FA40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:10:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82108196"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 15:10:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B57C4CE26C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 15:00:51 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 15:09:58 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 15:09:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 15:11:28 +0800
Message-ID: <20200117071128.23575-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5B57C4CE26C7.A9F9C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-websockets: upgrade 8.0.2 -> 8.1
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
X-List-Received-Date: Fri, 17 Jan 2020 07:10:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python3-websockets_8.0.2.bb => python3-websockets_8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_8.0.2.bb => python3-websockets_8.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb b/meta-python/recipes-devtools/python/python3-websockets_8.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb
rename to meta-python/recipes-devtools/python/python3-websockets_8.1.bb
index 6da73ce35..b09e978af 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_8.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ad5c6d36b3d0098b2f33a5ab69a9e750"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a37f0e22c3aa5f1cf12a6a3ae22b36ca"
-SRC_URI[sha256sum] = "882a7266fa867a2ebb2c0baaa0f9159cabf131cf18c1b4270d79ad42f9208dc5"
+SRC_URI[md5sum] = "f12d7f31fe8d0b3e65c12f845bcd0ad8"
+SRC_URI[sha256sum] = "5c65d2da8c6bce0fca2528f69f44b2f977e06954c8512a952222cea50dad430f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1




