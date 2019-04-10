Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0027D3D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 08:35:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549900800"; d="scan'208";a="58933927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Apr 2019 16:35:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D27BD4CD81BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:35:56 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 10 Apr 2019 16:35:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Apr 2019 16:36:34 +0800
Message-ID: <20190410083634.7715-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: D27BD4CD81BB.AC605
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-beautifulsoup4: upgrade 4.6.0 -> 4.7.1
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
X-List-Received-Date: Wed, 10 Apr 2019 08:35:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-beautifulsoup4_4.6.0.bb to python-beautifulsoup4_4.7.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 4 ++--
 ...beautifulsoup4_4.6.0.bb => python-beautifulsoup4_4.7.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-beautifulsoup4_4.6.0.bb => python-beautifulsoup4_4.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index d60d987ca..a33d8f4be 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "c17714d0f91a23b708a592cb3c697728"
-SRC_URI[sha256sum] = "808b6ac932dccb0a4126558f7dfdcf41710dd44a4ef497a0bb59a77f9f078e89"
+SRC_URI[md5sum] = "c71f53fcb2580c376ab7b010a9178983"
+SRC_URI[sha256sum] = "945065979fb8529dd2f37dbb58f00b661bdbcbebf954f93b32fdf5263ef35348"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
rename to meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb
-- 
2.20.1




