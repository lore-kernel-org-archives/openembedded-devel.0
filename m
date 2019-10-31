Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E0F506C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 06:18:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77726371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 14:17:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4847A4CE1514
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 14:10:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 14:17:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:18:15 +0800
Message-ID: <20191031061815.12434-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4847A4CE1514.A419B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-future: upgrade 0.16.0 -> 0.18.2
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
X-List-Received-Date: Thu, 31 Oct 2019 06:18:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-future.inc       | 6 +++---
 .../{python-future_0.16.0.bb => python-future_0.18.2.bb}    | 0
 .../{python3-future_0.16.0.bb => python3-future_0.18.2.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-future_0.16.0.bb => python-future_0.18.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-future_0.16.0.bb => python3-future_0.18.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-future.inc b/meta-python/recipes-devtools/python/python-future.inc
index 224756180..c0a2b39ba 100644
--- a/meta-python/recipes-devtools/python/python-future.inc
+++ b/meta-python/recipes-devtools/python/python-future.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Clean single-source support for Python 3 and 2"
 HOMEPAGE = "https://python-future.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f457538b297bd0ef86564b8ac216ad7"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
 
-SRC_URI[md5sum] = "3e8e88a2bda48d54b1da7634d04760d7"
-SRC_URI[sha256sum] = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
+SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
+SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
 
 PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
 
diff --git a/meta-python/recipes-devtools/python/python-future_0.16.0.bb b/meta-python/recipes-devtools/python/python-future_0.18.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-future_0.16.0.bb
rename to meta-python/recipes-devtools/python/python-future_0.18.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-future_0.16.0.bb b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-future_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-future_0.18.2.bb
-- 
2.20.1




