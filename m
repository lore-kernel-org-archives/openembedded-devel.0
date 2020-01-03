Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 818017F944
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 01:39:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; d="scan'208";a="81257289"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:39:41 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D468406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 09:30:44 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:39:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:39:41 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 22:09:28 -0800
Message-ID: <1578031770-88411-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578031770-88411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2D468406AB15.A0AFB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-waitress: upgrade 1.3.1 -> 1.4.1
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
X-List-Received-Date: Fri, 03 Jan 2020 01:39:41 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-waitress.inc       | 4 ++--
 .../{python-waitress_1.3.1.bb => python-waitress_1.4.1.bb}    | 0
 .../{python3-waitress_1.3.1.bb => python3-waitress_1.4.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-waitress_1.3.1.bb => python-waitress_1.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.3.1.bb => python3-waitress_1.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b/meta-python/recipes-devtools/python/python-waitress.inc
index 732c31dbd..a8d337fd5 100644
--- a/meta-python/recipes-devtools/python/python-waitress.inc
+++ b/meta-python/recipes-devtools/python/python-waitress.inc
@@ -6,5 +6,5 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
-SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
+SRC_URI[md5sum] = "e6b9f0406cb4e6fedcc3add96411786d"
+SRC_URI[sha256sum] = "f4118cbce75985fd60aeb4f0d781aba8dc7ae28c18e50753e913d7a7dee76b62"
diff --git a/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/python-waitress_1.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-waitress_1.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-waitress_1.4.1.bb
-- 
2.17.1




