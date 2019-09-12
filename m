Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D61A97E963
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 01:33:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 18:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189841741"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga006.jf.intel.com with ESMTP; 11 Sep 2019 18:33:57 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 09:33:53 +0800
Message-Id: <20190912013354.2924-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-networkx: upgrade 2.1 -> 2.2
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
X-List-Received-Date: Thu, 12 Sep 2019 01:33:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python-networkx_2.1.bb => python-networkx_2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-networkx_2.1.bb => python-networkx_2.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python-networkx_2.1.bb b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python-networkx_2.1.bb
rename to meta-python/recipes-devtools/python/python-networkx_2.2.bb
index bc0c6863d..a2381661c 100644
--- a/meta-python/recipes-devtools/python/python-networkx_2.1.bb
+++ b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3376ff7c9c58048c62d91431f7f08cde"
 
-SRC_URI[md5sum] = "4a2c2a62dfc46ba7d594daca7c834995"
-SRC_URI[sha256sum] = "64272ca418972b70a196cb15d9c85a5a6041f09a2f32e0d30c0255f25d458bb1"
+SRC_URI[md5sum] = "82608a3686fb3e61f20cf13bfd3c1b4a"
+SRC_URI[sha256sum] = "45e56f7ab6fe81652fb4bc9f44faddb0e9025f469f602df14e3b2551c2ea5c8b"
 
 PYPI_PACKAGE_EXT = "zip"
 
-- 
2.21.0


