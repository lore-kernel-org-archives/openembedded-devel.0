Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D02A7F7BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 03:53:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="77982654"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 11:53:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EF9044CE1A0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:44:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 7 Nov 2019 11:52:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 11:53:17 +0800
Message-ID: <20191107035317.22784-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: EF9044CE1A0A.AAE87
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-flask-babel: upgrade 0.11.2 -> 0.12.2
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
X-List-Received-Date: Thu, 07 Nov 2019 03:53:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-flask-babel.inc    | 4 ++--
 ...hon-flask-babel_0.11.2.bb => python-flask-babel_0.12.2.bb} | 0
 ...n3-flask-babel_0.11.2.bb => python3-flask-babel_0.12.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-babel_0.11.2.bb => python-flask-babel_0.12.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-babel_0.11.2.bb => python3-flask-babel_0.12.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/meta-python/recipes-devtools/python/python-flask-babel.inc
index f560f3ed5..0e507f337 100644
--- a/meta-python/recipes-devtools/python/python-flask-babel.inc
+++ b/meta-python/recipes-devtools/python/python-flask-babel.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 
-SRC_URI[md5sum] = "07803453743f139309021572a799c6b3"
-SRC_URI[sha256sum] = "c0d75710bd4b0fe866f9f2347de6e19208712f9cec006436b4c1c15d4cb0c939"
+SRC_URI[md5sum] = "fcf2f360ff279d3133e40974804efd72"
+SRC_URI[sha256sum] = "316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86"
 
 PYPI_PACKAGE = "Flask-Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb b/meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb
rename to meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb b/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
-- 
2.20.1




