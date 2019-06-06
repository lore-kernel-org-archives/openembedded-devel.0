Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2F29A6079F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:23:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66168337"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 11:23:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0633B4CDCD42
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 11:23:00 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 11:23:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:24:13 +0800
Message-ID: <20190606032413.7746-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 0633B4CDCD42.AC201
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-babel: upgrade 2.6.0 -> 2.7.0
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
X-List-Received-Date: Thu, 06 Jun 2019 03:23:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-babel_2.6.0.bb to python-babel_2.7.0.bb.

-Upgrade from python3-babel_2.6.0.bb to python3-babel_2.7.0.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-babel.inc        | 6 +++---
 .../python/{python-babel_2.6.0.bb => python-babel_2.7.0.bb} | 0
 .../{python3-babel_2.6.0.bb => python3-babel_2.7.0.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.6.0.bb => python-babel_2.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.6.0.bb => python3-babel_2.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 14b5a9f57..427467294 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eebdc057dc12abcc2d6c4453628bfcd4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
 
-SRC_URI[md5sum] = "c384ac03026e8fe6f9b90f55201f1bff"
-SRC_URI[sha256sum] = "8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23"
+SRC_URI[md5sum] = "83c158b7dae9135750a7cf204e6e2eea"
+SRC_URI[sha256sum] = "e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.6.0.bb b/meta-python/recipes-devtools/python/python-babel_2.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.6.0.bb
rename to meta-python/recipes-devtools/python/python-babel_2.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.6.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
-- 
2.20.1




