Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8C03360557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 07:38:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63122545"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 15:38:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A51CF4CDE8AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 15:38:18 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:38:17 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 May 2019 15:39:16 +0800
Message-ID: <20190515073916.27859-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A51CF4CDE8AB.AD3C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.1 -> 19.1.1
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
X-List-Received-Date: Wed, 15 May 2019 07:38:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pip_19.1.bb to python-pip_19.1.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.1.bb => python-pip_19.1.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.1.bb => python-pip_19.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.1.bb b/meta-python/recipes-devtools/python/python-pip_19.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.1.bb
rename to meta-python/recipes-devtools/python/python-pip_19.1.1.bb
index f451a8729..f78265030 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.1.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "22e3726252b492ce24312c2b43d0127f"
-SRC_URI[sha256sum] = "d9137cb543d8a4d73140a3282f6d777b2e786bb6abb8add3ac5b6539c82cd624"
+SRC_URI[md5sum] = "4fb98a060f21c731d6743b90a714fc73"
+SRC_URI[sha256sum] = "44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958"
 
 inherit pypi setuptools
 
-- 
2.20.1




