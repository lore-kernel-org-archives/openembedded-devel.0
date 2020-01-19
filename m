Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8EAA7D208
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 02:58:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,336,1574092800"; d="scan'208";a="82243696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 10:58:03 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 199B7406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 10:48:50 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 10:58:01 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 10:57:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 10:59:26 +0800
Message-ID: <20200119025926.18728-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 199B7406AB15.A601C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-sentry-sdk: upgrade 0.7.14 -> 0.14.0
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
X-List-Received-Date: Sun, 19 Jan 2020 02:58:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-sentry-sdk.inc     | 4 ++--
 ...hon3-sentry-sdk_0.7.14.bb => python3-sentry-sdk_0.14.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.7.14.bb => python3-sentry-sdk_0.14.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sentry-sdk.inc b/meta-python/recipes-devtools/python/python-sentry-sdk.inc
index 0c123cef4..3714cd0ff 100644
--- a/meta-python/recipes-devtools/python/python-sentry-sdk.inc
+++ b/meta-python/recipes-devtools/python/python-sentry-sdk.inc
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "fef016d075137c4fb8724559cad28b86"
-SRC_URI[sha256sum] = "5818289868755cfea74e61e532b4b0d11d523901041338d473277db91d4d8173"
+SRC_URI[md5sum] = "2d5cc43c8a178134b739c77439d1f26b"
+SRC_URI[sha256sum] = "8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
-- 
2.20.1




