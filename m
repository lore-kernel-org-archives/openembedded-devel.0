Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B57E86058C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:04:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74144838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 14:04:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 382A54CE032E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:04:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 14:04:28 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Aug 2019 15:04:15 +0900
Message-ID: <20190823060415.3598-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 382A54CE032E.AF88E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-twisted: upgrade 19.2.1 -> 19.7.0
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
X-List-Received-Date: Fri, 23 Aug 2019 06:04:27 -0000
Content-Type: text/plain

LICENSE file updated:
	"Tom Most" was added in LICENSE file.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc      | 6 +++---
 .../{python-twisted_19.2.1.bb => python-twisted_19.7.0.bb}  | 0
 ...{python3-twisted_19.2.1.bb => python3-twisted_19.7.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_19.2.1.bb => python-twisted_19.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_19.2.1.bb => python3-twisted_19.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 005aaadef..d70104dc2 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d136e8cf7b52f2e64079186ae2060d8a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
 
-SRC_URI[sha256sum] = "fa2c04c2d68a9be7fc3975ba4947f653a57a656776f24be58ff0fe4b9aaf3e52"
-SRC_URI[md5sum] = "528b7856938edc2a752c244aebd94981"
+SRC_URI[sha256sum] = "d5db93026568f60cacdc0615fcd21d46f694a6bfad0ef3ff53cde2b4bb85a39d"
+SRC_URI[md5sum] = "5e9296a952430d288cdcdc6ad9eb5ee8"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_19.2.1.bb b/meta-python/recipes-devtools/python/python-twisted_19.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_19.2.1.bb
rename to meta-python/recipes-devtools/python/python-twisted_19.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.2.1.bb b/meta-python/recipes-devtools/python/python3-twisted_19.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_19.2.1.bb
rename to meta-python/recipes-devtools/python/python3-twisted_19.7.0.bb
-- 
2.17.1




