Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B650F7E815
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:52:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,438,1557158400"; d="scan'208";a="70362780"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 16:52:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 08BC74CDE905
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 16:52:15 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 16:52:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 16:53:51 +0800
Message-ID: <20190701085351.24868-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 08BC74CDE905.AC298
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.0.10 -> 1.0.11
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
X-List-Received-Date: Mon, 01 Jul 2019 08:52:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-alembic_1.0.10.bb to python-alembic_1.0.11.bb.

-Upgrade from python3-alembic_1.0.10.bb to python3-alembic_1.0.11.bb.

-License-Update:Removed description of MIT license and trademark.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc      | 6 +++---
 .../{python-alembic_1.0.10.bb => python-alembic_1.0.11.bb}  | 0
 ...{python3-alembic_1.0.10.bb => python3-alembic_1.0.11.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.0.10.bb => python-alembic_1.0.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.0.10.bb => python3-alembic_1.0.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 9d556e7ef..bf3485ccb 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a5befaf254582f10aadd62d83cd20322"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "9969c707786f41f1b95c09c54f8970e9"
-SRC_URI[sha256sum] = "828dcaa922155a2b7166c4f36ec45268944e4055c86499bd14319b4c8c0094b7"
+SRC_URI[md5sum] = "b8603f4c9bac851570bd1798e8f23982"
+SRC_URI[sha256sum] = "cdb7d98bd5cbf65acd38d70b1c05573c432e6473a82f955cdea541b5c153b0cc"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.0.10.bb b/meta-python/recipes-devtools/python/python-alembic_1.0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.0.10.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.0.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.0.10.bb b/meta-python/recipes-devtools/python/python3-alembic_1.0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.0.10.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.0.11.bb
-- 
2.20.1




