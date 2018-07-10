Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B081F754C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:20:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6A3KU02006071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2018 20:20:31 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 20:20:30 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jul 2018 11:20:25 +0800
Message-ID: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] phoronix-test-suite: upgrade 7.8.0 -> 8.0.1
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
X-List-Received-Date: Tue, 10 Jul 2018 03:20:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
index 1f90a71..402779e 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "850843bd9252823e7e24bc0849773000"
-SRC_URI[sha256sum] = "cd6c869841f28e4ac1e8a5e4cda05fafce9a523a6b4f0f3a47805efd30494d88"
+SRC_URI[md5sum] = "3dc3a0e490e909f188379a9e05fd4780"
+SRC_URI[sha256sum] = "6306549109c7254baf31edb385265b19557b5692217d2dfcf96f6fb17de8e842"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4


