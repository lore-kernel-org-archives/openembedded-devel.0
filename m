Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 436EB7D577
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:53:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549900800"; d="scan'208";a="60376232"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 16:53:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5F9154CDAADA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:53:58 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 16:53:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 16:54:48 +0800
Message-ID: <20190424085448.2615-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 5F9154CDAADA.AA93C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-decorator: upgrade 4.3.0 -> 4.4.0
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
X-List-Received-Date: Wed, 24 Apr 2019 08:53:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-decorator_4.3.0.bb to python-decorator_4.4.0.bb.

-Upgrade from python3-decorator_4.3.0.bb to python3-decorator_4.4.0.bb.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-decorator.inc    | 6 +++---
 ...{python-decorator_4.3.0.bb => python-decorator_4.4.0.bb} | 0
 ...ython3-decorator_4.3.0.bb => python3-decorator_4.4.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.3.0.bb => python-decorator_4.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.3.0.bb => python3-decorator_4.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index 44edb8ad7..96cf8b475 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -7,10 +7,10 @@ can be abused and you should not try to solve every problem with a \
 decorator, just because you can."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=893f896413826096ce5270c700a498fd"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[md5sum] = "249e7299b9b4bced0c382343f84eb1c0"
-SRC_URI[sha256sum] = "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"
+SRC_URI[md5sum] = "a565a98581c0d110bc247323e89df9b1"
+SRC_URI[sha256sum] = "86156361c50488b84a3f148056ea716ca587df2f0de1d34750d35c21312725de"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.3.0.bb b/meta-python/recipes-devtools/python/python-decorator_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.3.0.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.3.0.bb b/meta-python/recipes-devtools/python/python3-decorator_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.4.0.bb
-- 
2.20.1




