Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CECA17D399
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 05:28:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59502897"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 13:28:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 483564CD84CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:28:31 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 13:28:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 13:29:21 +0800
Message-ID: <20190417052921.23900-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 483564CD84CA.A88E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.0.6 -> 3.0.8
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
X-List-Received-Date: Wed, 17 Apr 2019 05:28:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-paste_3.0.6.bb to python-paste_3.0.8.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.0.6.bb => python-paste_3.0.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.0.6.bb => python-paste_3.0.8.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.0.6.bb b/meta-python/recipes-devtools/python/python-paste_3.0.8.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.0.6.bb
rename to meta-python/recipes-devtools/python/python-paste_3.0.8.bb
index 4d5c3239b..c8c932c9a 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.0.8.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "4e93762f24fc728ecb4ddcff2693df39"
-SRC_URI[sha256sum] = "06aacf7a40685be0a0db8b26516e7d559d7fe5ccf7a47c5cd34f15ab558a8b92"
+SRC_URI[md5sum] = "0119f4e82b930781e3bcb59c77f7a353"
+SRC_URI[sha256sum] = "c4f13993e6ab4a38602cef298d876552083e8215685bb45abda7113f0dd48117"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.20.1




