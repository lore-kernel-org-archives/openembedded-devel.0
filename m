Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8C27FAB2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 05:23:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78048577"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 13:23:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 06A5A4CE1BE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 13:15:02 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 13:23:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 13:23:37 +0800
Message-ID: <20191108052337.24923-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 06A5A4CE1BE4.AAD1B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-flask-sqlalchemy: upgrade 2.3.2 -> 2.4.1
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
X-List-Received-Date: Fri, 08 Nov 2019 05:23:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Renamed from LICENSE to LICENSE.rst and Copyright year changed to 2010.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-flask-sqlalchemy.inc     | 6 +++---
 ...sqlalchemy_2.3.2.bb => python-flask-sqlalchemy_2.4.1.bb} | 0
 ...qlalchemy_2.3.2.bb => python3-flask-sqlalchemy_2.4.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-sqlalchemy_2.3.2.bb => python-flask-sqlalchemy_2.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.3.2.bb => python3-flask-sqlalchemy_2.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
index 957d07dbb..86ba9dda5 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
-SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
+SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
+SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
rename to meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
-- 
2.20.1




