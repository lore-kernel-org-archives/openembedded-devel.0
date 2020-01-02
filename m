Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C575E7F441
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 03:19:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81227088"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 11:19:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AA98D406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 11:10:23 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 11:19:17 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 11:19:17 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 11:20:31 +0800
Message-ID: <20200102032031.27344-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AA98D406AB15.AA392
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-beautifulsoup4: upgrade 4.8.1 -> 4.8.2
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
X-List-Received-Date: Thu, 02 Jan 2020 03:19:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 4 ++--
 ...beautifulsoup4_4.8.1.bb => python-beautifulsoup4_4.8.2.bb} | 0
 ...eautifulsoup4_4.8.1.bb => python3-beautifulsoup4_4.8.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-beautifulsoup4_4.8.1.bb => python-beautifulsoup4_4.8.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.8.1.bb => python3-beautifulsoup4_4.8.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index 8c9dbfc68..3e95bb7f2 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "be03d778cf61cf6734a480e2010d6657"
-SRC_URI[sha256sum] = "6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09789931"
+SRC_URI[md5sum] = "5dbdb56c009e4632bae7bed1b385804b"
+SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
rename to meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.1.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
-- 
2.20.1




