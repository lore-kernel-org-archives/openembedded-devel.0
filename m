Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DB19E7F9C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:28:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889254"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D8E4E4CE20F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:19:54 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:00 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:19 -0800
Message-ID: <1579093951-77460-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D8E4E4CE20F0.A7EF7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-keras-applications: upgrade 1.0.6 -> 1.0.8
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:00 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...pplications_1.0.6.bb => python3-keras-applications_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-keras-applications_1.0.6.bb => python3-keras-applications_1.0.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
index d38b992d0..4293a63c1 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=366e2fd3c9714f162d3663b6f97cfe41"
 
 SRC_URI = "git://github.com/keras-team/keras-applications.git"
-SRCREV ?= "61de21815728aa66377ebb2a7b4c2f5492a34dd2"
+SRCREV ?= "3b180cb10eda683dda7913ecee2e6487288d292d"
 
 
 inherit setuptools3
-- 
2.17.1




