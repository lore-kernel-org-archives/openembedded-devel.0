Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B28807ED3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 01:51:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,439,1559491200"; d="scan'208";a="74408817"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 09:50:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C26634CE088C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 09:50:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 09:50:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 09:50:16 +0800
Message-ID: <20190828015016.19072-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C26634CE088C.AA6BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.0.11 -> 1.1.0
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
X-List-Received-Date: Wed, 28 Aug 2019 01:51:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_1.0.11.bb => python-alembic_1.1.0.bb}      | 0
 .../python/{python3-alembic_1.0.11.bb => python3-alembic_1.1.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.0.11.bb => python-alembic_1.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.0.11.bb => python3-alembic_1.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index bf3485c..7d11045 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "b8603f4c9bac851570bd1798e8f23982"
-SRC_URI[sha256sum] = "cdb7d98bd5cbf65acd38d70b1c05573c432e6473a82f955cdea541b5c153b0cc"
+SRC_URI[md5sum] = "69fb6b25923d4f1e3c392447b342e358"
+SRC_URI[sha256sum] = "4a4811119efbdc5259d1f4c8f6de977b36ad3bcc919f59a29c2960c5ef9149e4"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.0.11.bb b/meta-python/recipes-devtools/python/python-alembic_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.0.11.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.0.11.bb b/meta-python/recipes-devtools/python/python3-alembic_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.0.11.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.1.0.bb
-- 
2.7.4




