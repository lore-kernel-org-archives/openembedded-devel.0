Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47ACE78467
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 08:48:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H8mjkb000178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 01:48:46 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 01:48:45 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 04:48:44 -0400
Message-ID: <1502959724-47472-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] c-ares: upgrade to 1.13.0
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
X-List-Received-Date: Thu, 17 Aug 2017 08:48:45 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../recipes-support/c-ares/{c-ares_1.12.0.bb => c-ares_1.13.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.12.0.bb => c-ares_1.13.0.bb} (75%)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
similarity index 75%
rename from meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
rename to meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index 4e28d6a..0d9a2a4 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
 SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
            file://0001-configure.ac-don-t-override-passed-cflags.patch \
 "
-SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
-SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
+SRC_URI[md5sum] = "d2e010b43537794d8bedfb562ae6bba2"
+SRC_URI[sha256sum] = "03f708f1b14a26ab26c38abd51137640cb444d3ec72380b21b20f1a8d2861da7"
 
 inherit autotools pkgconfig
-- 
2.8.1


