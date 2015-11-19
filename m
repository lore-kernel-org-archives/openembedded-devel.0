Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 851A760132
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:37:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ5bLGX009842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 21:37:21 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 21:37:20 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:37:17 +0800
Message-ID: <25e91a75079a67d873f8f653a6bf6b80e6981349.1447910888.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447910888.git.jackie.huang@windriver.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/7 v2] libtdb: upgrade to 1.3.7
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
X-List-Received-Date: Thu, 19 Nov 2015 05:37:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb} (87%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
similarity index 87%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.0.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
index 0b9e1f2..9dc4808 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.0.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
 SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch"
 
-SRC_URI[md5sum] = "f18cd6afc4f5670edfe58f72d2665f94"
-SRC_URI[sha256sum] = "04bee48d405ab7815810575a6e0cb364cc0eea6187b54b18c84e9c18a768ba20"
+SRC_URI[md5sum] = "e3741a19c427255acd1e92c5e09d9df7"
+SRC_URI[sha256sum] = "a64d95ca0cc06a28fed24c6e952aed7660cae04983108735d6bc30b925136412"
 
 S = "${WORKDIR}/tdb-${PV}"
 
-- 
1.9.1


