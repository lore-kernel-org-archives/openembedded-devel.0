Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9162D615FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 03:02:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="83668389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 11:02:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A902450A9977
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 10:52:25 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 11:02:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 11:02:06 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 02:10:04 -0800
Message-ID: <1582279804-21302-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A902450A9977.A092C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libzip: upgrade 1.6.0 -> 1.6.1
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
X-List-Received-Date: Fri, 21 Feb 2020 03:02:07 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libzip/{libzip_1.6.0.bb => libzip_1.6.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.6.0.bb => libzip_1.6.1.bb} (77%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.6.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.6.1.bb
similarity index 77%
rename from meta-oe/recipes-extended/libzip/libzip_1.6.0.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.6.1.bb
index e4c282fe0..41ad55298 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.6.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.6.1.bb
@@ -15,5 +15,5 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c0245c3e68e472d75d9f8572e24eb5d0"
-SRC_URI[sha256sum] = "a6cd804b4b3cffd997bd563fec693eb7eb052c225909a98a620689c2befb699b"
+SRC_URI[md5sum] = "f9a228619aab2446addc9c9e0e2de149"
+SRC_URI[sha256sum] = "705dac7a671b3f440181481e607b0908129a9cf1ddfcba75d66436c0e7d33641"
-- 
2.17.1




