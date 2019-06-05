Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 240967D32D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 02:22:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x552MBVr005279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Jun 2019 19:22:12 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 4 Jun 2019 19:22:11 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Jun 2019 19:22:11 -0700
Message-ID: <20190605022211.41350-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hwloc: Upgrade to 1.11.12
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
X-List-Received-Date: Wed, 05 Jun 2019 02:22:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../hwloc/{hwloc_1.11.10.bb => hwloc_1.11.12.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_1.11.10.bb => hwloc_1.11.12.bb} (89%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb
similarity index 89%
rename from meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb
index 5f4155ea5..4f5b248c4 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
 
 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0981a01935982aa7e850a96e0c3057b0"
-SRC_URI[sha256sum] = "2be808383d8337846fe77ce49c7ad3336fb6857505494d85c0ac03f22c5bd1e7"
+SRC_URI[md5sum] = "c2a2e4e23eeb719ed31a755684697cf9"
+SRC_URI[sha256sum] = "ddfb7b9b4571551165b0fd824a340e58814c8c2b4af64c818579d4bc695a417d"
 
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v1.11/"
 
-- 
2.21.0


