Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB3D65CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:58:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5x0bP002853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:59:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:58:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:50 +0800
Message-ID: <1529992863-24711-7-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 07/20] python(3)-twisted: upgrade 17.9.0 -> 18.4.0
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
X-List-Received-Date: Tue, 26 Jun 2018 05:58:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc              | 6 +++---
 .../python/{python-twisted_17.9.0.bb => python-twisted_18.4.0.bb}   | 0
 .../python/{python3-twisted_17.9.0.bb => python3-twisted_18.4.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_17.9.0.bb => python-twisted_18.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_17.9.0.bb => python3-twisted_18.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 6480ad54f..260909bdd 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8a9c2fbfcba7d70504e3ba545e1820ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=04e7730aecedc79d805625a91bc06145"
 
-SRC_URI[md5sum] = "6dbedb918f0c7288a4c670f59393ecf8"
-SRC_URI[sha256sum] = "0da1a7e35d5fcae37bc9c7978970b5feb3bc82822155b8654ec63925c05af75c"
+SRC_URI[sha256sum] = "a4cc164a781859c74de47f17f0e85f4bce8a3321a9d0892c015c8f80c4158ad9"
+SRC_URI[md5sum] = "da8142ad4e9971a75fe751ac96a33b95"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
-- 
2.11.0


