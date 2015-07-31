Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5500476567
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 07:32:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99112924"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 15:35:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V7UYs2031198
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:30:34 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 15:32:26 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 15:32:25 +0800
Message-ID: <1438327945-18711-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-python][PATCH] python-decorator: upgrade 3.4.0 -> 3.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 07:32:27 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-decorator_3.4.0.bb => python-decorator_3.4.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_3.4.0.bb => python-decorator_3.4.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-decorator_3.4.0.bb b/meta-python/recipes-devtools/python/python-decorator_3.4.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-decorator_3.4.0.bb
rename to meta-python/recipes-devtools/python/python-decorator_3.4.2.bb
index 4316630..7031857 100644
--- a/meta-python/recipes-devtools/python/python-decorator_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-decorator_3.4.2.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://documentation3.py;beginline=848;endline=877;md5=0b56661417fb7b841afc8892e14ba241"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=104961fab4bc3ef8d0640bb37641b473"
 
 SRCNAME = "decorator"
 
@@ -18,5 +18,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-SRC_URI[md5sum] = "1e8756f719d746e2fc0dd28b41251356"
-SRC_URI[sha256sum] = "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51f36e1a7988d9d783"
+SRC_URI[md5sum] = "9e0536870d2b83ae27d58dbf22582f4d"
+SRC_URI[sha256sum] = "7320002ce61dea6aa24adc945d9d7831b3669553158905cdd12f5d0027b54b44"
-- 
1.8.4.2


