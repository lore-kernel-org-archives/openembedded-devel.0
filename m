Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43E43608DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 02:05:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01D25E4w000303
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 18:05:30 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 12 Feb 2020 18:05:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Feb 2020 10:05:06 +0800
Message-ID: <1581559506-246673-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iozone3: Upgrade to 489
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
X-List-Received-Date: Thu, 13 Feb 2020 02:05:39 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-benchmark/iozone3/{iozone3_488.bb => iozone3_489.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_488.bb => iozone3_489.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_489.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_489.bb
index 222a956..e4b7e4f 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_489.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "d60a69e44cda8436f4f94d860958efc2"
-SRC_URI[sha256sum] = "960265163d93f15f7ad352f726d4837c5dd794fff357c743fdb56cbcf4abca04"
+SRC_URI[md5sum] = "e863281987689cd6d9729e535637b77d"
+SRC_URI[sha256sum] = "6155850d1019f2450dc926bbdb5a24abf423ee3bb928ab1e68569cf60a908584"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.7.4


