Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFE47E648
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:58:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,549,1559491200"; d="scan'208";a="76040050"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2019 10:58:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 04F0A4CE14F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 10:58:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 26 Sep 2019 10:58:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Sep 2019 10:57:56 +0800
Message-ID: <20190926025756.28042-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 04F0A4CE14F4.ADF5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.2.0 -> 1.2.1
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
X-List-Received-Date: Thu, 26 Sep 2019 02:58:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_1.2.0.bb => python-alembic_1.2.1.bb}       | 0
 .../python/{python3-alembic_1.2.0.bb => python3-alembic_1.2.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.2.0.bb => python-alembic_1.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.2.0.bb => python3-alembic_1.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 8c917e3..fa178ce 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "7cdba960544ecb59fd74e6433d82036c"
-SRC_URI[sha256sum] = "5609afbb2ab142a991b15ae436347c475f8a517f1610f2fd1b09cdca7c311f3f"
+SRC_URI[md5sum] = "6fe272274fce2641b93998ef9b702b76"
+SRC_URI[sha256sum] = "9f907d7e8b286a1cfb22db9084f9ce4fde7ad7956bb496dc7c952e10ac90e36a"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.2.0.bb b/meta-python/recipes-devtools/python/python-alembic_1.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.2.0.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.2.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.2.1.bb
-- 
2.7.4




