Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBF7618CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:49:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="84597012"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 09:49:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8500849DF125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:39:58 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 09:49:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 28 Feb 2020 09:49:47 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2020 00:31:43 -0800
Message-ID: <1582878704-30686-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 8500849DF125.A3896
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libuv: upgrade 1.34.0 -> 1.34.2
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
X-List-Received-Date: Fri, 28 Feb 2020 01:49:45 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libuv/{libuv_1.34.0.bb => libuv_1.34.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.34.0.bb => libuv_1.34.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
index b842bbda7..234cec37b 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
+SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1




