Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 432AE7DDCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5534F0T011396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:25 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:55 +0800
Message-ID: <1559703841-263740-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] phoronix-test-suite: upgrade from 8.6.0 -> 8.8.1
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:34 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{phoronix-test-suite_8.6.0.bb => phoronix-test-suite_8.8.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.6.0.bb => phoronix-test-suite_8.8.1.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
index 4c7b057..8733844 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "a3d9e81f5abc1921d3aaf710ac4f4046"
-SRC_URI[sha256sum] = "acb9dfcf4a3452aaf82cce59ccc04fa4cf51a43617a6cca9d1f9c5c670a5655d"
+SRC_URI[md5sum] = "08fc81d25a1c24c7b091ac78ef145da6"
+SRC_URI[sha256sum] = "d6feeeafb6d636667480b6fbfd2a6537e3b354b2c7c72305784d14d38ab4bcd0"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4


