Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC16D6C1DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:33:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAF9XHHO021360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Nov 2018 01:33:27 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 15 Nov 2018 01:33:06 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Nov 2018 01:32:58 -0800
Message-ID: <20181115093258.1101-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181115093258.1101-1-mingli.yu@windriver.com>
References: <20181115093258.1101-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.2
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
X-List-Received-Date: Thu, 15 Nov 2018 09:33:53 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../log4cplus/{log4cplus_2.0.1.bb => log4cplus_2.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.1.bb => log4cplus_2.0.2.bb} (81%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb
similarity index 81%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb
index aef5978bd..d17d15c92 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb
@@ -7,8 +7,8 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "2b4054b2d66c0ef0e4091df26ce8aad4"
-SRC_URI[sha256sum] = "772b268142e1c02dd346880fff06f38f693e9458d6390ce0b493395d0ca01714"
+SRC_URI[md5sum] = "b3bbeb2dc3e170768430cf87583016f8"
+SRC_URI[sha256sum] = "10539f2315271d370c7bc6a2b4808cbe369279837f4539ce5c789e456489fc62"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1


