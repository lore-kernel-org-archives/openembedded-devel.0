Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62F5D7F2D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 03:45:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,472,1559491200"; d="scan'208";a="74922761"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2019 11:45:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9AF034CE14E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:45:07 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019 11:45:11 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Sep 2019 11:44:36 +0800
Message-ID: <20190906034436.15665-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9AF034CE14E7.A8919
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.1.1 -> 3.2.0
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
X-List-Received-Date: Fri, 06 Sep 2019 03:45:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.1.1.bb => python-paste_3.2.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.1.1.bb => python-paste_3.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.1.1.bb b/meta-python/recipes-devtools/python/python-paste_3.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-paste_3.2.0.bb
index 90e7970..92a97d1 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.2.0.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "07132313bc62c7525402d31119161228"
-SRC_URI[sha256sum] = "baca402a089594db0cf1e9aae5c98bcf91588bbbaf848527257e246b960eb72f"
+SRC_URI[md5sum] = "9225991c1c37a81e0aaac2fb046f3602"
+SRC_URI[sha256sum] = "2153da2f1b09a69bce7633d7e3f9aaa802572e85f9ac1ed09ad93ef8599d31b6"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.7.4




