Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 47ED47F7BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 02:35:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="77979065"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 10:35:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19579406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 10:27:08 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 7 Nov 2019 10:35:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 10:35:31 +0800
Message-ID: <20191107023531.11492-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 19579406AB15.A6040
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-decorator: upgrade 4.4.0 -> 4.4.1
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
X-List-Received-Date: Thu, 07 Nov 2019 02:35:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-decorator.inc      | 4 ++--
 .../{python-decorator_4.4.0.bb => python-decorator_4.4.1.bb}  | 0
 ...{python3-decorator_4.4.0.bb => python3-decorator_4.4.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.4.0.bb => python-decorator_4.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.4.0.bb => python3-decorator_4.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index caf4340b2..65db1a961 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,8 +9,8 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[md5sum] = "a565a98581c0d110bc247323e89df9b1"
-SRC_URI[sha256sum] = "86156361c50488b84a3f148056ea716ca587df2f0de1d34750d35c21312725de"
+SRC_URI[md5sum] = "933981f288c4230816b5beee8d40e6ea"
+SRC_URI[sha256sum] = "54c38050039232e1db4ad7375cfce6748d7b41c29e95a081c8a6d2c30364a2ce"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.4.0.bb b/meta-python/recipes-devtools/python/python-decorator_4.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.4.0.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.4.0.bb b/meta-python/recipes-devtools/python/python3-decorator_4.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.4.1.bb
-- 
2.20.1




