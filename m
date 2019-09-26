Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A3E127E7BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 05:42:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,550,1559491200"; d="scan'208";a="76046336"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2019 13:42:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B454C4CE14F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 13:42:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 26 Sep 2019 13:42:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Sep 2019 13:41:55 +0800
Message-ID: <20190926054155.29515-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: B454C4CE14F5.A9844
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.2.0 -> 3.2.1
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
X-List-Received-Date: Thu, 26 Sep 2019 05:42:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.2.0.bb => python-paste_3.2.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.2.0.bb => python-paste_3.2.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.2.0.bb b/meta-python/recipes-devtools/python/python-paste_3.2.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.2.0.bb
rename to meta-python/recipes-devtools/python/python-paste_3.2.1.bb
index 92a97d1..6c78598 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.2.1.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "9225991c1c37a81e0aaac2fb046f3602"
-SRC_URI[sha256sum] = "2153da2f1b09a69bce7633d7e3f9aaa802572e85f9ac1ed09ad93ef8599d31b6"
+SRC_URI[md5sum] = "4ec8ac6032270daf91ff9621bda019d0"
+SRC_URI[sha256sum] = "3d9c9e96a8408777b01976dfce900049e9e8c970e02198534f2c8c1b2cca5dee"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.7.4




