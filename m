Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2017F619
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 02:21:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74260203"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 10:21:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DED74CE0437
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:21:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 10:21:38 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2019 11:21:17 +0900
Message-ID: <20190826022117.17483-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6DED74CE0437.A1579
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.2.2 -> 19.2.3
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
X-List-Received-Date: Mon, 26 Aug 2019 02:21:34 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.2.2.bb => python-pip_19.2.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.2.2.bb => python-pip_19.2.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.2.2.bb b/meta-python/recipes-devtools/python/python-pip_19.2.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.2.2.bb
rename to meta-python/recipes-devtools/python/python-pip_19.2.3.bb
index 9a037274d..506a9e21c 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.2.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.2.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "2ba0a3b76d39ccd90ca22bfa82fc635f"
-SRC_URI[sha256sum] = "e05103825871e210d50a44c7e448587b0ed99dd775d3ef586304c58f40224a53"
+SRC_URI[md5sum] = "f417444c66a0db1a82c8d9d2283a2f95"
+SRC_URI[sha256sum] = "e7a31f147974362e6c82d84b91c7f2bdf57e4d3163d3d454e6c3e71944d67135"
 
 inherit pypi setuptools
 
-- 
2.17.1




