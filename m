Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4187FCE3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:19:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,429,1571673600"; d="scan'208";a="81744410"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 21:19:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C10464CE20C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:22 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 21:19:30 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 21:19:31 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 09:09:38 -0800
Message-ID: <1578935381-39920-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C10464CE20C4.A0C0B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-bandit: 1.5.1 -> 1.6.2
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
X-List-Received-Date: Mon, 13 Jan 2020 13:19:27 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-bandit_1.5.1.bb => python3-bandit_1.6.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.5.1.bb => python3-bandit_1.6.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb b/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
index 3002d5aa5..fa28861e9 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "81ba3979ded1b421fa8d69e6faa06dcb"
-SRC_URI[sha256sum] = "9413facfe9de1e1bd291d525c784e1beb1a55c9916b51dae12979af63a69ba4c"
+SRC_URI[md5sum] = "c6a6772d7afa0af8828b3384e73b7085"
+SRC_URI[sha256sum] = "41e75315853507aa145d62a78a2a6c5e3240fe14ee7c601459d0df9418196065"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.17.1




