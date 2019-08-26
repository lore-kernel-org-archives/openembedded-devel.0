Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0237F619
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 02:13:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74259487"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 10:13:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 45F114CE0453
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:13:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 10:13:59 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2019 11:13:39 +0900
Message-ID: <20190826021339.17324-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 45F114CE0453.AE2BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.1.0 -> 3.1.1
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
X-List-Received-Date: Mon, 26 Aug 2019 02:13:55 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.1.0.bb => python-paste_3.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.1.0.bb => python-paste_3.1.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.1.0.bb b/meta-python/recipes-devtools/python/python-paste_3.1.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.1.0.bb
rename to meta-python/recipes-devtools/python/python-paste_3.1.1.bb
index 6873b7dbe..90e7970a5 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.1.1.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "904ec5634f3f901cadf529711930a98b"
-SRC_URI[sha256sum] = "18323f22df5ab6998fdf4c5aa5a9f41d33ff949a87ad7b2ca48e72fbf50fa3e4"
+SRC_URI[md5sum] = "07132313bc62c7525402d31119161228"
+SRC_URI[sha256sum] = "baca402a089594db0cf1e9aae5c98bcf91588bbbaf848527257e246b960eb72f"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.17.1




