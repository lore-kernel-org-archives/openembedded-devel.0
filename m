Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0976E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:58:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 03:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,335,1517904000"; d="scan'208";a="43635906"
Received: from rlin98-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.18])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2018 03:58:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 18:58:24 +0800
Message-Id: <1521543504-28155-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] phoronix-test-suite: upgrade 7.4.0 -> 7.8.0
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
X-List-Received-Date: Tue, 20 Mar 2018 10:58:33 -0000

List of changes here:

https://github.com/phoronix-test-suite/phoronix-test-suite/blob/master/ChangeLog

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{phoronix-test-suite_7.4.0.bb => phoronix-test-suite_7.8.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_7.4.0.bb => phoronix-test-suite_7.8.0.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
index 3ccd5db..b205821 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "86fa3eede43ffff88992fe21368b11b7"
-SRC_URI[sha256sum] = "de9aec3ef4f980581756fd0bf7b30dd1ccb20e7aae637078a587606bf75a6b67"
+SRC_URI[md5sum] = "850843bd9252823e7e24bc0849773000"
+SRC_URI[sha256sum] = "cd6c869841f28e4ac1e8a5e4cda05fafce9a523a6b4f0f3a47805efd30494d88"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4


