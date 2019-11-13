Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3F5C7D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 00:23:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xAD0NeGm003096
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 16:23:41 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 12 Nov 2019 16:23:40 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2019 19:23:37 -0500
Message-ID: <20191113002339.2625858-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python3-werkzeug: upgrade from 0.14.1 to 0.16.0
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
X-List-Received-Date: Wed, 13 Nov 2019 00:23:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc     | 6 +++---
 ...{python-werkzeug_0.14.1.bb => python-werkzeug_0.16.0.bb} | 0
 ...ython3-werkzeug_0.14.1.bb => python3-werkzeug_0.16.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.14.1.bb => python-werkzeug_0.16.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.14.1.bb => python3-werkzeug_0.16.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e630fdd09..e292d93bb 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -8,10 +8,10 @@ cookie handling, file uploads, a powerful URL routing system and a bunch \
 of community contributed addon modules."
 HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9a0b7c0254616d72dadb98b293ef1b"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[md5sum] = "6d20b5be2d245be4ac7706cc390d130c"
-SRC_URI[sha256sum] = "c3fd7a7d41976d9f44db327260e263132466836cef6f91512889ed60ad26557c"
+SRC_URI[md5sum] = "5b23b4953efc4f52b1d0b33af6f7cd2d"
+SRC_URI[sha256sum] = "7280924747b5733b246fe23972186c6b348f9ae29724135a6dfc1e53cea433e7"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.14.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.16.0.bb
-- 
2.23.0


