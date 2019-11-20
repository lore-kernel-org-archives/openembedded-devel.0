Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 843B46C1CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:07:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78784124"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 16:07:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 25D784CE1BE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:59:10 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 16:07:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 16:08:01 +0800
Message-ID: <20191120080801.2635-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 25D784CE1BE7.A9068
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-twisted: upgrade 19.7.0 -> 19.10.0
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
X-List-Received-Date: Wed, 20 Nov 2019 08:07:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc        | 4 ++--
 .../{python-twisted_19.7.0.bb => python-twisted_19.10.0.bb}   | 0
 .../{python3-twisted_19.7.0.bb => python3-twisted_19.10.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_19.7.0.bb => python-twisted_19.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_19.7.0.bb => python3-twisted_19.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index d70104dc2..34f8846b0 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
 
-SRC_URI[sha256sum] = "d5db93026568f60cacdc0615fcd21d46f694a6bfad0ef3ff53cde2b4bb85a39d"
-SRC_URI[md5sum] = "5e9296a952430d288cdcdc6ad9eb5ee8"
+SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
+SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_19.7.0.bb b/meta-python/recipes-devtools/python/python-twisted_19.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_19.7.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_19.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.7.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_19.7.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
-- 
2.20.1




