Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 13CB97FA13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889273"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 751E24CE1CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:01 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:05 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:16 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:21 -0800
Message-ID: <1579093951-77460-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 751E24CE1CB3.A3BE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-more-itertools: 7.2.0 -> 8.1.0
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:12 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-more-itertools_7.2.0.bb  | 5 -----
 .../recipes-devtools/python/python3-more-itertools_8.1.0.bb  | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
deleted file mode 100644
index 06d45ce54..000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit pypi setuptools3
-require python-more-itertools.inc
-
-SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
-SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb
new file mode 100644
index 000000000..9a09c10b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.1.0.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools3
+require python-more-itertools.inc
+
+SRC_URI[md5sum] = "a552b06cec1bdf01d60f952dbcc9a021"
+SRC_URI[sha256sum] = "c468adec578380b6281a114cb8a5db34eb1116277da92d7c46f904f0b52d3288"
-- 
2.17.1




