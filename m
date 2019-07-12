Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 61CF47D2E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:46:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71248552"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 15:46:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A3BBB4CDDD3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 15:46:36 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 12 Jul 2019 15:46:38 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Jul 2019 15:45:53 +0800
Message-ID: <20190712074553.23291-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A3BBB4CDDD3F.AC8C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyflakes: upgrade 1.6.0 -> 2.1.1
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
X-List-Received-Date: Fri, 12 Jul 2019 07:46:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pyflakes_1.6.0.bb to python-pyflakes_2.1.1.bb.

-License-Update: Now,it supports all active versions of Python: 2.7 and 3.4 to 3.7.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pyflakes_1.6.0.bb => python-pyflakes_2.1.1.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyflakes_1.6.0.bb => python-pyflakes_2.1.1.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
index a16a880..1c03f39 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "passive checker of Python programs"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=029ce1beb023f2c4ca9f417e4984a865"
+LIC_FILES_CHKSUM = "file://README.rst;md5=5127315117a8561a1504343d59620647"
 
-SRC_URI[md5sum] = "b385b0e4cd40a522553e97cd2d83573e"
-SRC_URI[sha256sum] = "8d616a382f243dbf19b54743f280b80198be0bca3a5396f1d2e1fca6223e8805"
+SRC_URI[md5sum] = "a0f71a15724e553c46e03ba5ed56703c"
+SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
 
 inherit pypi setuptools
 
-- 
2.7.4




