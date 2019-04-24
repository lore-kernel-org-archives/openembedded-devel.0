Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9138E7D557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:43:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,388,1549900800"; d="scan'208";a="60368316"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 15:43:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D856C4CDABF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:43:55 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 15:43:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 15:44:45 +0800
Message-ID: <20190424074445.7104-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: D856C4CDABF5.AAEA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.0.0 -> 1.0.9
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
X-List-Received-Date: Wed, 24 Apr 2019 07:43:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-alembic_1.0.0.bb to python-alembic_1.0.9.bb.

-Upgrade from python3-alembic_1.0.0.bb to python3-alembic_1.0.9.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc      | 6 +++---
 .../{python-alembic_1.0.0.bb => python-alembic_1.0.9.bb}    | 0
 .../{python3-alembic_1.0.0.bb => python3-alembic_1.0.9.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.0.0.bb => python-alembic_1.0.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.0.0.bb => python3-alembic_1.0.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 477e89c5a..a7701a3bc 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a5befaf254582f10aadd62d83cd20322"
 
-SRC_URI[md5sum] = "762ab9ba56d1c0b1bfbc7c9f7f849c92"
-SRC_URI[sha256sum] = "52d73b1d750f1414fa90c25a08da47b87de1e4ad883935718a8f36396e19e78e"
+SRC_URI[md5sum] = "d1ebe49c7f71dfbd0daa8905df95668b"
+SRC_URI[sha256sum] = "40b9a619aa5f25ea1e1508adcda88b33704ef28e02c9cfa6471e5c772ecf0829"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.0.0.bb b/meta-python/recipes-devtools/python/python-alembic_1.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.0.0.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.0.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.0.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.0.9.bb
-- 
2.20.1




