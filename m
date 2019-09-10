Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1577F050
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 18:04:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8AI46FR019091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 11:04:28 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 11:04:08 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2019 14:04:08 -0400
Message-ID: <20190910180408.19517-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] poppler: update from 0.79.0 to 0.80.0
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
X-List-Received-Date: Tue, 10 Sep 2019 18:04:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../poppler/{poppler_0.79.0.bb => poppler_0.80.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.79.0.bb => poppler_0.80.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.80.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.79.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.80.0.bb
index 903817f18..338af1d87 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.80.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "0aac1fcb6466f8b7bdf51871264c7e83"
-SRC_URI[sha256sum] = "f985a4608fe592d2546d9d37d4182e502ff6b4c42f8db4be0a021a1c369528c8"
+SRC_URI[md5sum] = "8ff9964d1fcc9c334a9c66f6f426ab9c"
+SRC_URI[sha256sum] = "4d3ca6b79bc13b8e24092e34f83ef5f387f3bb0bbd7359a6c078e09c696d104f"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.22.0


