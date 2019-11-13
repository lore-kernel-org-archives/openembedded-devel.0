Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6377F2C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 06:45:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78397762"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 14:45:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 444B74CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:36:56 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 14:45:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2019 14:45:38 +0800
Message-ID: <20191113064538.5795-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 444B74CE1A05.A73C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.2.1 -> 1.3.0
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
X-List-Received-Date: Wed, 13 Nov 2019 06:45:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc        | 4 ++--
 .../{python-alembic_1.2.1.bb => python-alembic_1.3.0.bb}      | 0
 .../{python3-alembic_1.2.1.bb => python3-alembic_1.3.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.2.1.bb => python-alembic_1.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.2.1.bb => python3-alembic_1.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index e3842345f..8245676b2 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "6fe272274fce2641b93998ef9b702b76"
-SRC_URI[sha256sum] = "9f907d7e8b286a1cfb22db9084f9ce4fde7ad7956bb496dc7c952e10ac90e36a"
+SRC_URI[md5sum] = "81ec3de9e2d9c389657f51bdc0d24984"
+SRC_URI[sha256sum] = "e6c6a4243e89c8d3e2342a1562b2388f3b524c9cac2fccc4d2c461a1320cc1c1"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.2.1.bb b/meta-python/recipes-devtools/python/python-alembic_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.2.1.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.2.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.3.0.bb
-- 
2.20.1




