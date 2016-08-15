Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 374BF76E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F604dZ005220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:00:05 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 23:00:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:13 +0800
Message-ID: <0fe5481987c5cbb6ceb44c2702b1ac1114ea1eda.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/6] libldb: upgrade to 1.1.27
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
X-List-Received-Date: Mon, 15 Aug 2016 06:00:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/libldb/{libldb_1.1.26.bb => libldb_1.1.27.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.26.bb => libldb_1.1.27.bb} (93%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.26.bb b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
similarity index 93%
rename from meta-networking/recipes-support/libldb/libldb_1.1.26.bb
rename to meta-networking/recipes-support/libldb/libldb_1.1.27.bb
index e657e52..b92bf22 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "31780b702b638ad32aa5d9853d257839"
-SRC_URI[sha256sum] = "8843c7a72b980d9413ba6c494c039bccd10c524b37fda2917afb147745d8b2e6"
+SRC_URI[md5sum] = "50a194dea128d062cf4b44c59130219b"
+SRC_URI[sha256sum] = "cdb8269cba09006ddf3766eb7721192b52ae3fdc8a6b95f4318b6b740b9d35ac"
 
 inherit waf-samba
 
-- 
1.9.1


