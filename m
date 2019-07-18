Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A47C77D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:21:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6I4LO4o009254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 21:21:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 17 Jul 2019 21:21:24 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jul 2019 21:21:23 -0700
Message-ID: <20190718042123.61092-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718042123.61092-1-mingli.yu@windriver.com>
References: <20190718042123.61092-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
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
X-List-Received-Date: Thu, 18 Jul 2019 04:21:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb} (81%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
similarity index 81%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
index 56c62f1f2..d86521aba 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
@@ -7,8 +7,8 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "20a87090cd8ec34ea11b3e59954234cb"
-SRC_URI[sha256sum] = "2d8f627aa6417e6c6a100bc09dc407684ca4605c929defc1690ee7d6a575ce6a"
+SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
+SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.21.0


