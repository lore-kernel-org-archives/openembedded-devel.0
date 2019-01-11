Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 266BF79F51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 07:36:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0B7Zh8X006072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Jan 2019 23:35:53 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 10 Jan 2019 23:35:32 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 10 Jan 2019 23:35:32 -0800
Message-ID: <20190111073532.55363-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] libdbi-perl: Upgrade to 1.642
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
X-List-Received-Date: Fri, 11 Jan 2019 07:36:20 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../perl/{libdbi-perl_1.641.bb => libdbi-perl_1.642.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.641.bb => libdbi-perl_1.642.bb} (88%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
similarity index 88%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index 24a1245fc..3c031646b 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -16,8 +16,8 @@ RDEPENDS_${PN} = " perl-module-carp \
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "e77fd37fcf77fc88fde029c1b75ded54"
-SRC_URI[sha256sum] = "5509e532cdd0e3d91eda550578deaac29e2f008a12b64576e8c261bb92e8c2c1"
+SRC_URI[md5sum] = "f2ba18b5cea1c8cb322a62be0a847f3d"
+SRC_URI[sha256sum] = "3f2025023a56286cebd15cb495e36ccd9b456c3cc229bf2ce1f69e9ebfc27f5d"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.17.1


