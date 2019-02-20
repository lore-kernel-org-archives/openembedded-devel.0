Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8345479BA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:56:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K8uOlp004471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:24 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:24 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:16 +0800
Message-ID: <1550652980-292761-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] phoronix-test-suite: Upgrade 8.2.0 -> 8.6.0
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
X-List-Received-Date: Wed, 20 Feb 2019 08:56:23 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{phoronix-test-suite_8.2.0.bb => phoronix-test-suite_8.6.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.2.0.bb => phoronix-test-suite_8.6.0.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
index 2214931..4c7b057 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "33e7b9ba5a65e7fcef91d47117450e6c"
-SRC_URI[sha256sum] = "d7160df5ab15fbd65ade82c6cc13c02a4826d46eff10113f615e38316c9c01f1"
+SRC_URI[md5sum] = "a3d9e81f5abc1921d3aaf710ac4f4046"
+SRC_URI[sha256sum] = "acb9dfcf4a3452aaf82cce59ccc04fa4cf51a43617a6cca9d1f9c5c670a5655d"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4


