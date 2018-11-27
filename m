Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B77906D253
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:40:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR9eG7M020947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:40:47 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:40:27 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:39:14 +0800
Message-ID: <1543311554-293342-8-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
References: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/7] phoronix-test-suite: upgrade to 8.2.0
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
X-List-Received-Date: Tue, 27 Nov 2018 09:40:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{phoronix-test-suite_8.0.1.bb => phoronix-test-suite_8.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.0.1.bb => phoronix-test-suite_8.2.0.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb
index b1fa51b..2214931 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.2.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "3dc3a0e490e909f188379a9e05fd4780"
-SRC_URI[sha256sum] = "6306549109c7254baf31edb385265b19557b5692217d2dfcf96f6fb17de8e842"
+SRC_URI[md5sum] = "33e7b9ba5a65e7fcef91d47117450e6c"
+SRC_URI[sha256sum] = "d7160df5ab15fbd65ade82c6cc13c02a4826d46eff10113f615e38316c9c01f1"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.7.4


