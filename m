Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 689956C1DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:33:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAF9X6iM001273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Nov 2018 01:33:06 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 15 Nov 2018 01:32:58 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Nov 2018 01:32:57 -0800
Message-ID: <20181115093258.1101-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] iozone3: Upgrade to 484
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
X-List-Received-Date: Thu, 15 Nov 2018 09:33:06 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../iozone3/{iozone3_482.bb => iozone3_484.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_482.bb => iozone3_484.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_484.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_484.bb
index db79dff0a..f218b87e9 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_484.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "31ca1d3d28bc375c20a2808217cf212c"
-SRC_URI[sha256sum] = "2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30"
+SRC_URI[md5sum] = "aa6b88ab83793cb6809ca06949a6ab01"
+SRC_URI[sha256sum] = "e816e6ae2f02003f2a6d19d47fcd9a50fdd8078da4f35fe3d4b9caf91c3d7216"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.17.1


