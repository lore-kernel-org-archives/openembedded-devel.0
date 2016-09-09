Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9679E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u891lWlu020724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 18:47:32 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Sep 2016 18:47:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Sep 2016 21:47:30 -0400
Message-ID: <1473385650-33524-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] traceroute: update to 2.1.0
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
X-List-Received-Date: Fri, 09 Sep 2016 01:47:31 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../traceroute/{traceroute_2.0.21.bb => traceroute_2.1.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.0.21.bb => traceroute_2.1.0.bb} (91%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
similarity index 91%
rename from meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 09da1ef..48a0c12 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
            file://filter-out-the-patches-from-subdirs.patch \
 "
 
-SRC_URI[md5sum] = "79289adabd6f3ebf9160fc0815ab3150"
-SRC_URI[sha256sum] = "f7ac93ef30b13a587292b8d6a7e2538a65bc978a3a576eab238c392b884e96e0"
+SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
+SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 
-- 
2.8.1


