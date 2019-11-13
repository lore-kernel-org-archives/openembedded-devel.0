Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88C8C7F628
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 00:23:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAD0NgwL010834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 16:23:42 -0800
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 12 Nov 2019 16:23:42 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2019 19:23:39 -0500
Message-ID: <20191113002339.2625858-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113002339.2625858-1-trevor.gamblin@windriver.com>
References: <20191113002339.2625858-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python3-itsdangerous: upgrade from 0.24 to 1.1.0
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
X-List-Received-Date: Wed, 13 Nov 2019 00:23:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-itsdangerous.inc | 6 +++---
 ...on-itsdangerous_0.24.bb => python-itsdangerous_1.1.0.bb} | 0
 ...3-itsdangerous_0.24.bb => python3-itsdangerous_1.1.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-itsdangerous_0.24.bb => python-itsdangerous_1.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_0.24.bb => python3-itsdangerous_1.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
index 84f9e7742..241786a7c 100644
--- a/meta-python/recipes-devtools/python/python-itsdangerous.inc
+++ b/meta-python/recipes-devtools/python/python-itsdangerous.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
 HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b61841e2bf5f07884148e2a6f1bcab0c"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
 
-SRC_URI[md5sum] = "a3d55aa79369aef5345c036a8a26307f"
-SRC_URI[sha256sum] = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"
+SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
+SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
rename to meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
-- 
2.23.0


