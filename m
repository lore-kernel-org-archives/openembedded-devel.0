Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B6BCC605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 04:59:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77722376"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 12:59:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BB130486A852
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:51:07 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 12:59:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 12:59:22 +0800
Message-ID: <20191031045922.22088-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BB130486A852.A8E31
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-dnspython: upgrade 1.15.0 -> 1.16.0
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
X-List-Received-Date: Thu, 31 Oct 2019 04:59:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2017.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-dnspython.inc    | 6 +++---
 ...ython-dnspython_1.15.0.bb => python-dnspython_1.16.0.bb} | 0
 ...hon3-dnspython_1.15.0.bb => python3-dnspython_1.16.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dnspython_1.15.0.bb => python-dnspython_1.16.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dnspython_1.15.0.bb => python3-dnspython_1.16.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/meta-python/recipes-devtools/python/python-dnspython.inc
index 1b5f7160f..84502affe 100644
--- a/meta-python/recipes-devtools/python/python-dnspython.inc
+++ b/meta-python/recipes-devtools/python/python-dnspython.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "DNS toolkit for Python"
 HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9d855ee0d7bea17c8b0994d37985e1e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[md5sum] = "05d33ffb5d8f35ae0474bb952778a344"
-SRC_URI[sha256sum] = "40f563e1f7a7b80dc5a4e76ad75c23da53d62f1e15e6e517293b04e1f84ead7c"
+SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
+SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
 
 PYPI_PACKAGE_EXT = "zip"
 
diff --git a/meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb
rename to meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
-- 
2.20.1




