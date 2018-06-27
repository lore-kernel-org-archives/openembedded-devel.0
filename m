Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6A2A60068
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:49:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9nOux027180
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:49:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:23 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:12 -0700
Message-ID: <20180627094922.109996-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/13] log4cplus: upgrade to 2.0.1
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
X-List-Received-Date: Wed, 27 Jun 2018 09:49:24 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../log4cplus/{log4cplus_1.2.0.bb => log4cplus_2.0.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_1.2.0.bb => log4cplus_2.0.1.bb} (71%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb
similarity index 71%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb
index b7c8358e2..aef5978bd 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.1.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
 LICENSE = "Apache-2.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cedaa287ececcb94f9f2880d9c4ef085"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "e250f0f431c0723f8b625323e7b6465d"
-SRC_URI[sha256sum] = "ad5ec3b62f2f0bdc7f06fa398bde61091fd2493e91059e17315b5197420dcf04"
+SRC_URI[md5sum] = "2b4054b2d66c0ef0e4091df26ce8aad4"
+SRC_URI[sha256sum] = "772b268142e1c02dd346880fff06f38f693e9458d6390ce0b493395d0ca01714"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1


