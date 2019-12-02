Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 338F67F35F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:00:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439175"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:00:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F1714CE1C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:51:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:00:13 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:28:12 -0800
Message-ID: <1575300494-101612-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0F1714CE1C0A.AB254
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-alembic: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Mon, 02 Dec 2019 09:00:10 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_1.3.0.bb => python-alembic_1.3.1.bb}       | 0
 .../python/{python3-alembic_1.3.0.bb => python3-alembic_1.3.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.3.0.bb => python-alembic_1.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.3.0.bb => python3-alembic_1.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 8245676..7b4b08c 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "81ec3de9e2d9c389657f51bdc0d24984"
-SRC_URI[sha256sum] = "e6c6a4243e89c8d3e2342a1562b2388f3b524c9cac2fccc4d2c461a1320cc1c1"
+SRC_URI[md5sum] = "6ac9edfb0b3951fef3b356d2761ebb3f"
+SRC_URI[sha256sum] = "49277bb7242192bbb9eac58fed4fe02ec6c3a2a4b4345d2171197459266482b2"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.3.0.bb b/meta-python/recipes-devtools/python/python-alembic_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.3.0.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.3.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.3.1.bb
-- 
2.7.4




