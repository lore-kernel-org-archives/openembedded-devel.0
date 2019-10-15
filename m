Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 59B2E7F2FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:20:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76985488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 15:20:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 299C54CE151A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 15:20:18 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 15:20:35 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 15:20:42 +0800
Message-ID: <20191015072042.24918-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 299C54CE151A.A6996
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyasn1-modules: upgrade 0.2.6 -> 0.2.7
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
X-List-Received-Date: Tue, 15 Oct 2019 07:20:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1-modules.inc | 4 ++--
 ...pyasn1-modules_0.2.6.bb => python-pyasn1-modules_0.2.7.bb} | 0
 ...yasn1-modules_0.2.6.bb => python3-pyasn1-modules_0.2.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1-modules_0.2.6.bb => python-pyasn1-modules_0.2.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.6.bb => python3-pyasn1-modules_0.2.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
index a9e4bbef0..fcb140ac3 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "c0bbe9820c971a97f156ff343ae67911"
-SRC_URI[sha256sum] = "43c17a83c155229839cc5c6b868e8d0c6041dba149789b6d6e28801c64821722"
+SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
+SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.6.bb b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.6.bb
rename to meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.6.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.6.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
-- 
2.20.1




