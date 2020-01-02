Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 392977FC1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 07:34:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81232622"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 15:34:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 11507406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 15:25:07 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 15:34:01 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 15:33:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 15:35:17 +0800
Message-ID: <20200102073517.1949-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 11507406AB15.AAC3B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyperf: upgrade 1.6.1 -> 1.7.0
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
X-List-Received-Date: Thu, 02 Jan 2020 07:34:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyperf.inc         | 4 ++--
 .../python/{python-pyperf_1.6.1.bb => python-pyperf_1.7.0.bb} | 0
 .../{python3-pyperf_1.6.1.bb => python3-pyperf_1.7.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyperf_1.6.1.bb => python-pyperf_1.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyperf_1.6.1.bb => python3-pyperf_1.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyperf.inc b/meta-python/recipes-devtools/python/python-pyperf.inc
index 81837f300..2e6304b99 100644
--- a/meta-python/recipes-devtools/python/python-pyperf.inc
+++ b/meta-python/recipes-devtools/python/python-pyperf.inc
@@ -13,8 +13,8 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[md5sum] = "d67fe5f447963da8873f3e9923f76de1"
-SRC_URI[sha256sum] = "8d0143a22a13ee10c997a648f30b82cdc40175d5a20b11055ae058a82e45d371"
+SRC_URI[md5sum] = "e30b67b62a4e30e4504352d0778c622c"
+SRC_URI[sha256sum] = "0d214aa65e085d3e4108a36152cb12f7cd0f4e7fda93b5134b43a9687c975786"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb b/meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb
rename to meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_1.7.0.bb
-- 
2.20.1




