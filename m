Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 17FBC71C3D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 18:04:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 11:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,422,1498546800"; d="scan'208";a="141667544"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by orsmga005.jf.intel.com with ESMTP; 24 Aug 2017 11:04:42 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 11:04:39 -0700
Message-Id: <20170824180439.24462-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-python][PATCH] python*-astroid: use SPDX compatible license identifier
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
X-List-Received-Date: Thu, 24 Aug 2017 18:04:41 -0000

License is LGPL-2.1, not simply LGPL

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-astroid.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index a5bb10695..4cb1a3c4b 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -1,7 +1,7 @@
 SUMMARY = "An abstract syntax tree for Python with inference support."
 HOMEPAGE = "https://pypi.python.org/pypi/astroid"
 SECTION = "devel/python"
-LICENSE = "LGPL"
+LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI[md5sum] = "6f65e4ea8290ec032320460905afb828"
-- 
2.13.5


