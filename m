Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7925F7E98C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 03:34:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75336988"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 11:34:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3954D4CE0C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 11:33:45 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 11:33:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Sep 2019 11:33:44 +0800
Message-ID: <20190912033344.31174-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3954D4CE0C9C.A9355
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-certifi: upgrade 2019.6.16 -> 2019.9.11
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
X-List-Received-Date: Thu, 12 Sep 2019 03:34:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2019.6.16.bb => python-certifi_2019.9.11.bb}      | 0
 .../{python3-certifi_2019.6.16.bb => python3-certifi_2019.9.11.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2019.6.16.bb => python-certifi_2019.9.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2019.6.16.bb => python3-certifi_2019.9.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 23e1856..de02d9a 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "af8fea5f3df6f7f81e9c6cbc6dd7c1e8"
-SRC_URI[sha256sum] = "945e3ba63a0b9f577b1395204e13c3a231f9bc0223888be653286534e5873695"
+SRC_URI[md5sum] = "cadd4e373fc08f649fa39b82aed9ad96"
+SRC_URI[sha256sum] = "e4f3620cfea4f83eedc95b24abd9cd56f3c4b146dd0177e83a21b4eb49e21e50"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2019.6.16.bb b/meta-python/recipes-devtools/python/python-certifi_2019.9.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2019.6.16.bb
rename to meta-python/recipes-devtools/python/python-certifi_2019.9.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.6.16.bb b/meta-python/recipes-devtools/python/python3-certifi_2019.9.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2019.6.16.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2019.9.11.bb
-- 
2.7.4




