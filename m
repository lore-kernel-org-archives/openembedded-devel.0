Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAD1B771F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:44:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tACAiUVC023430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:44:31 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 02:44:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Nov 2015 18:44:23 +0800
Message-ID: <d4e8a778ee6bbed50aefbff98ba646f7f0ff1cef.1447324249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447324249.git.jackie.huang@windriver.com>
References: <cover.1447324249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] libtdb: upgrade to 1.3.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 10:44:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb} (87%)

diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-oe/recipes-support/libtdb/libtdb_1.3.7.bb
similarity index 87%
rename from meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
rename to meta-oe/recipes-support/libtdb/libtdb_1.3.7.bb
index 0b9e1f2..9dc4808 100644
--- a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
+++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.7.bb
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


