Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9D22C7FDCC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:10:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81429014"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:10:08 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 76E8A49E932C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:01:07 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:10:05 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:10:13 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:17 -0800
Message-ID: <1578403399-45535-8-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 76E8A49E932C.A5571
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libuv: upgrade 1.33.1 -> 1.34.0
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
X-List-Received-Date: Tue, 07 Jan 2020 09:10:08 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libuv/{libuv_1.33.1.bb => libuv_1.34.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.33.1.bb => libuv_1.34.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
index 604568e62..b842bbda7 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "07ad32138f4d2285ba2226b5e20462b27b091a59"
+SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1




