Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A69337F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:28:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889248"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:28:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 15A1B4CE1C86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:19:46 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:28:51 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:01 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:16 -0800
Message-ID: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 15A1B4CE1C86.A85C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-cheetah: upgrade 3.2.3 -> 3.2.4
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
X-List-Received-Date: Wed, 15 Jan 2020 09:28:55 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-cheetah_3.2.3.bb => python3-cheetah_3.2.4.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.3.bb => python3-cheetah_3.2.4.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
index 52e8576ee..05882d087 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
@@ -10,6 +10,5 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "5629445e7fef9659da2b49e36aacdbff"
-SRC_URI[sha256sum] = "7c450bce04a82d34cf6d48992c736c2048246cbc00f7b4903a39cf9a8ea3990c"
-
+SRC_URI[md5sum] = "8c0ac643263ffc3454fb321342284d0a"
+SRC_URI[sha256sum] = "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
-- 
2.17.1




