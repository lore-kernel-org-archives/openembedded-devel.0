Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 752737CB4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:03:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1L22vSV021797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:03:07 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:46 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:18 +0800
Message-ID: <1550714538-415016-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
References: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] uthash: upgrade 2.0.2 -> 2.1.0
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
X-List-Received-Date: Thu, 21 Feb 2019 02:03:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Copyright Year Update

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/uthash/{uthash_2.0.2.bb => uthash_2.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/uthash/{uthash_2.0.2.bb => uthash_2.1.0.bb} (85%)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.0.2.bb b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
similarity index 85%
rename from meta-oe/recipes-support/uthash/uthash_2.0.2.bb
rename to meta-oe/recipes-support/uthash/uthash_2.1.0.bb
index ccdd13b..7eb1383 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
@@ -8,7 +8,7 @@ DESCRIPTION = " uthash-dev provides a hash table implementation using C preproce
 HOMEPAGE = "https://troydhanson.github.io/uthash/"
 SECTION = "base"
 LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a2513f7d2291df840527b76b2a8f9718"
 
 SRC_URI = "\
     https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
@@ -16,8 +16,8 @@ SRC_URI = "\
 "
 UPSTREAM_CHECK_URI = "https://github.com/troydhanson/${BPN}/releases"
 
-SRC_URI[md5sum] = "d08632a58674274c9cd87e2930f5696a"
-SRC_URI[sha256sum] = "34a31d51dd7a839819cecd6f46049b4ffe031d7f3147d9a042f5504fdb1348d1"
+SRC_URI[md5sum] = "4d0a33f6393260926032f1fad4bad39a"
+SRC_URI[sha256sum] = "152ccd8e64d0f495377232e3964d06c7ec8bb8c3fbd3217f8a5702614f9a669e"
 
 inherit ptest
 
-- 
2.7.4


