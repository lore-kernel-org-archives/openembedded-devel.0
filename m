Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CAF097F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F63D4CE20DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:15 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:21 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:30 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:26 -0800
Message-ID: <1579093951-77460-11-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7F63D4CE20DF.A2E1E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-engineio: upgrade 3.11.1 -> 3.11.2
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:24 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-engineio.inc       | 4 ++--
 .../{python-engineio_3.11.1.bb => python-engineio_3.11.2.bb}  | 0
 ...{python3-engineio_3.11.1.bb => python3-engineio_3.11.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-engineio_3.11.1.bb => python-engineio_3.11.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.11.1.bb => python3-engineio_3.11.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index 57b7b186b..9c067c96d 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "327c16ca05e9b0cc4f994b9d35c7f7d7"
-SRC_URI[sha256sum] = "50d108fc7feb7f970e6ebc86733752ebd714545bb5622383e6135bdad45fc9fe"
+SRC_URI[md5sum] = "13345452be25c3b63d041f8f89e662d1"
+SRC_URI[sha256sum] = "47ae4a9b3b4f2e8a68929f37a518338838e119f24c9a9121af92c49f8bea55c3"
diff --git a/meta-python/recipes-devtools/python/python-engineio_3.11.1.bb b/meta-python/recipes-devtools/python/python-engineio_3.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-engineio_3.11.1.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.11.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.11.1.bb b/meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb
-- 
2.17.1




