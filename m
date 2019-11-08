Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 13FF47F367
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 07:35:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78053985"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 15:35:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4BDB84CE1A01
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 15:27:19 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:35:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 15:35:55 +0800
Message-ID: <20191108073555.32402-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4BDB84CE1A01.A9119
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pysmi: upgrade 0.2.2 -> 0.3.4
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
X-List-Received-Date: Fri, 08 Nov 2019 07:35:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pysmi_0.2.2.bb => python-pysmi_0.3.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysmi_0.2.2.bb => python-pysmi_0.3.4.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb b/meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
rename to meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
index 7a2d89d99..43aa4b84c 100644
--- a/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://pypi.python.org/pypi/pysmi"
 SECTION = "devel/python"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a088b5c72b59d51a5368ad3b18e219bf"
 
-SRC_URI[md5sum] = "3b0f71e4e9f730d211f09d8ef5371140"
-SRC_URI[sha256sum] = "2a315cc3e556b3428372b69da663a24d2f0df9e9ab075b022cb133855f25aef7"
+SRC_URI[md5sum] = "10a9dd140ad512eed9f37344df83ce9d"
+SRC_URI[sha256sum] = "bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c"
 
 inherit pypi setuptools
 
-- 
2.20.1




