Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1C497FB5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 05:55:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="77570278"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 13:55:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 33D5B4CE1513
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:47:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 28 Oct 2019 13:55:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 13:55:27 +0800
Message-ID: <20191028055527.25754-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 33D5B4CE1513.A4AA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-daemonize: upgrade 2.4.7 -> 2.5.0
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
X-List-Received-Date: Mon, 28 Oct 2019 05:55:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-daemonize_2.4.7.bb => python-daemonize_2.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.7.bb => python-daemonize_2.5.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb b/meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
index 98f23aba1..e0f64fcf1 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
                python-resource \
 "
 
-SRC_URI[md5sum] = "6759005b12dfeea0d4305f8536b4b0c2"
-SRC_URI[sha256sum] = "c0194e861826be456c7c69985825ac7b79632d8ac7ad4cde8e12fee7971468c8"
+SRC_URI[md5sum] = "3d64e7a0219ad22e3fca62460f893b6a"
+SRC_URI[sha256sum] = "dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3"
-- 
2.20.1




