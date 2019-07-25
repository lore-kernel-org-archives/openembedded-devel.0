Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 06DA07F1BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:54:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,305,1559491200"; d="scan'208";a="72166491"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2019 12:54:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 975904CDE64D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 12:54:39 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 25 Jul 2019 12:54:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jul 2019 12:53:55 +0800
Message-ID: <20190725045355.31478-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 975904CDE64D.A8B2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.0.8 -> 3.1.0
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
X-List-Received-Date: Thu, 25 Jul 2019 04:54:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.0.8.bb => python-paste_3.1.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.0.8.bb => python-paste_3.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.0.8.bb b/meta-python/recipes-devtools/python/python-paste_3.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.0.8.bb
rename to meta-python/recipes-devtools/python/python-paste_3.1.0.bb
index c8c932c..6873b7d 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.1.0.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "0119f4e82b930781e3bcb59c77f7a353"
-SRC_URI[sha256sum] = "c4f13993e6ab4a38602cef298d876552083e8215685bb45abda7113f0dd48117"
+SRC_URI[md5sum] = "904ec5634f3f901cadf529711930a98b"
+SRC_URI[sha256sum] = "18323f22df5ab6998fdf4c5aa5a9f41d33ff949a87ad7b2ca48e72fbf50fa3e4"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.7.4




