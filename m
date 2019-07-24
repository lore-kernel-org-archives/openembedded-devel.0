Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B43627D9D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:12:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,300,1559491200"; d="scan'208";a="72067302"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2019 13:12:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 81B874CDCCC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:12:07 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Jul 2019 13:12:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Jul 2019 13:11:22 +0800
Message-ID: <20190724051122.6117-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 81B874CDCCC4.AACEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-beautifulsoup4: upgrade 4.7.1 -> 4.8.0
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
X-List-Received-Date: Wed, 24 Jul 2019 05:12:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 4 ++--
 ...beautifulsoup4_4.7.1.bb => python-beautifulsoup4_4.8.0.bb} | 0
 ...eautifulsoup4_4.7.1.bb => python3-beautifulsoup4_4.8.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-beautifulsoup4_4.7.1.bb => python-beautifulsoup4_4.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.7.1.bb => python3-beautifulsoup4_4.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index a33d8f4be..a7fa081e4 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "c71f53fcb2580c376ab7b010a9178983"
-SRC_URI[sha256sum] = "945065979fb8529dd2f37dbb58f00b661bdbcbebf954f93b32fdf5263ef35348"
+SRC_URI[md5sum] = "2b34208b26b5c49d4c84a4b9cf78656a"
+SRC_URI[sha256sum] = "25288c9e176f354bf277c0a10aa96c782a6a18a17122dba2e8cec4a97e03343b"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb
rename to meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.7.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.0.bb
-- 
2.20.1




