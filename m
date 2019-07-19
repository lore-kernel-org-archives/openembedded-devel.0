Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB797F172
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:16:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6J9Fwk8029085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:16:08 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 19 Jul 2019 02:15:47 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 02:15:38 -0700
Message-ID: <20190719091539.100373-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719091539.100373-1-mingli.yu@windriver.com>
References: <20190719091539.100373-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] hwloc: Upgrade to 1.11.13
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
X-List-Received-Date: Fri, 19 Jul 2019 09:16:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../hwloc/{hwloc_1.11.12.bb => hwloc_1.11.13.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_1.11.12.bb => hwloc_1.11.13.bb} (89%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
similarity index 89%
rename from meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
index 4f5b248c4..7231484fe 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.12.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
 
 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c2a2e4e23eeb719ed31a755684697cf9"
-SRC_URI[sha256sum] = "ddfb7b9b4571551165b0fd824a340e58814c8c2b4af64c818579d4bc695a417d"
+SRC_URI[md5sum] = "3c792e23c209e9e1bafe9bdbc613d401"
+SRC_URI[sha256sum] = "a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8"
 
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v1.11/"
 
-- 
2.21.0


