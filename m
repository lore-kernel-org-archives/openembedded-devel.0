Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 146377D922
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 02:25:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,403,1549900800"; d="scan'208";a="60875410"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Apr 2019 10:25:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 621FA4CDAACA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 10:25:11 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 28 Apr 2019 10:25:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Apr 2019 10:26:02 +0800
Message-ID: <20190428022602.7377-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 621FA4CDAACA.A8AAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 18.0 -> 19.1
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
X-List-Received-Date: Sun, 28 Apr 2019 02:25:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pip_18.0.bb to python-pip_19.1.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_18.0.bb => python-pip_19.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_18.0.bb => python-pip_19.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pip_18.0.bb b/meta-python/recipes-devtools/python/python-pip_19.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pip_18.0.bb
rename to meta-python/recipes-devtools/python/python-pip_19.1.bb
index 6b943b008..f451a8729 100644
--- a/meta-python/recipes-devtools/python/python-pip_18.0.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
 HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=593c6cd9d639307226978cbcae61ad4b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "52f75ceb21e96c258f289859a2996b60"
-SRC_URI[sha256sum] = "a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76"
+SRC_URI[md5sum] = "22e3726252b492ce24312c2b43d0127f"
+SRC_URI[sha256sum] = "d9137cb543d8a4d73140a3282f6d777b2e786bb6abb8add3ac5b6539c82cd624"
 
 inherit pypi setuptools
 
-- 
2.20.1




