Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9432476E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:00:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7F601u9009520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:00:01 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 23:00:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:11 +0800
Message-ID: <bcfd0cbe77dfaeb500ca04de8f187e0a4eebb7fb.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/6] libtdb: upgrade to 1.3.10
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
X-List-Received-Date: Mon, 15 Aug 2016 06:00:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/libtdb/{libtdb_1.3.8.bb => libtdb_1.3.10.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.8.bb => libtdb_1.3.10.bb} (87%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
similarity index 87%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
index 7fbbe34..35ae8c0 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
 SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch"
 
-SRC_URI[md5sum] = "fa4c9e2f59fcf41441285bca5f5ab481"
-SRC_URI[sha256sum] = "0605ac0427eac9c23bf61ebfd8206a07d5ece198498eab1769cd0cfb6e7de6b1"
+SRC_URI[md5sum] = "c98f24eb469022b0f1741d3a504cfda5"
+SRC_URI[sha256sum] = "5578fb726bd04835f250bea11fe7d1398fe0bb3a7c9390404241c83cd6b50c1c"
 
 S = "${WORKDIR}/tdb-${PV}"
 
-- 
1.9.1


