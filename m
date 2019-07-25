Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8BD7F1DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:54:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,305,1559491200"; d="scan'208";a="72166484"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2019 12:54:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E3E54CDE65E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 12:54:27 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 25 Jul 2019 12:54:26 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jul 2019 12:53:42 +0800
Message-ID: <20190725045342.31423-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2E3E54CDE65E.A9135
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.1.1 -> 19.2.1
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
X-List-Received-Date: Thu, 25 Jul 2019 04:54:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.1.1.bb => python-pip_19.2.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.1.1.bb => python-pip_19.2.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.1.1.bb b/meta-python/recipes-devtools/python/python-pip_19.2.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.1.1.bb
rename to meta-python/recipes-devtools/python/python-pip_19.2.1.bb
index f782650..5a2b94b 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "4fb98a060f21c731d6743b90a714fc73"
-SRC_URI[sha256sum] = "44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958"
+SRC_URI[md5sum] = "e9ac3e030e88b6c076a20ab371a30742"
+SRC_URI[sha256sum] = "258d702483dd749400aec59c23d638a5b2249ae28a0f478b6cab12ad45681a80"
 
 inherit pypi setuptools
 
-- 
2.7.4




