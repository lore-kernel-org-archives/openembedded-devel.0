Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0B571CB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Sep 2017 21:54:38 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Sep 2017 14:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,460,1500966000"; d="scan'208";a="155221042"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga005.jf.intel.com with ESMTP; 30 Sep 2017 14:54:39 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Sep 2017 14:54:36 -0700
Message-Id: <20170930215436.36636-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-oe][PATCH] phoronix-test-suite: Upgrade from v6.6.1 to v7.4.0
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
X-List-Received-Date: Sat, 30 Sep 2017 21:54:39 -0000

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{phoronix-test-suite_6.6.1.bb => phoronix-test-suite_7.4.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_6.6.1.bb => phoronix-test-suite_7.4.0.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb
index 1f1404849..3ccd5db44 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.4.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "5bcac5896a4a34fc6ae4ae94991e1637"
-SRC_URI[sha256sum] = "631ceb808d8bd6cebe69c8b711d55090d6880e906a65837f18fa8200fe7d2c4d"
+SRC_URI[md5sum] = "86fa3eede43ffff88992fe21368b11b7"
+SRC_URI[sha256sum] = "de9aec3ef4f980581756fd0bf7b30dd1ccb20e7aae637078a587606bf75a6b67"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.13.5


