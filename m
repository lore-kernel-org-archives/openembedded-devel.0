Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C4E6C7D3EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:32:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78779999"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 14:32:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 196B34CE1BE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:24:12 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 14:32:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 14:33:03 +0800
Message-ID: <20191120063303.4407-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 196B34CE1BE4.A6BFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-zopeinterface: upgrade 4.6.0 -> 4.7.1
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
X-List-Received-Date: Wed, 20 Nov 2019 06:32:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc  | 4 ++--
 ...n-zopeinterface_4.6.0.bb => python-zopeinterface_4.7.1.bb} | 0
 ...-zopeinterface_4.6.0.bb => python3-zopeinterface_4.7.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.6.0.bb => python-zopeinterface_4.7.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.6.0.bb => python3-zopeinterface_4.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 7213bc8ac..df8f1ff3b 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "a3b24f9d079bae5e13dd7a88aa512112"
-SRC_URI[sha256sum] = "1b3d0dcabc7c90b470e59e38a9acaa361be43b3a6ea644c0063951964717f0e5"
+SRC_URI[md5sum] = "1bc66758275c5eb66d169acba3c8e50e"
+SRC_URI[sha256sum] = "4bb937e998be9d5e345f486693e477ba79e4344674484001a0b646be1d530487"
 
 PYPI_PACKAGE = "zope.interface"
 
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.6.0.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.6.0.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.6.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
-- 
2.20.1




