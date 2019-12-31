Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 973337F220
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 06:52:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,378,1571673600"; d="scan'208";a="81050459"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Dec 2019 14:52:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 660BE4CE1CA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 14:44:02 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 31 Dec 2019 14:52:53 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 31 Dec 2019 14:52:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Dec 2019 14:54:07 +0800
Message-ID: <20191231065407.31084-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 660BE4CE1CA7.AC124
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Tue, 31 Dec 2019 06:52:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc        | 4 ++--
 .../{python-alembic_1.3.1.bb => python-alembic_1.3.2.bb}      | 0
 .../{python3-alembic_1.3.1.bb => python3-alembic_1.3.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.3.1.bb => python-alembic_1.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.3.1.bb => python3-alembic_1.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 7b4b08c4d..c94c142dd 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
 
-SRC_URI[md5sum] = "6ac9edfb0b3951fef3b356d2761ebb3f"
-SRC_URI[sha256sum] = "49277bb7242192bbb9eac58fed4fe02ec6c3a2a4b4345d2171197459266482b2"
+SRC_URI[md5sum] = "3d7584a8fb0203ec82b90baa726d2bd9"
+SRC_URI[sha256sum] = "3b0cb1948833e062f4048992fbc97ecfaaaac24aaa0d83a1202a99fb58af8c6d"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.3.1.bb b/meta-python/recipes-devtools/python/python-alembic_1.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.3.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb
-- 
2.20.1




