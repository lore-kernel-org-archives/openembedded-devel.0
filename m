Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8324D77100
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:59:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F5xve3013262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 22:59:57 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 22:59:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:09 +0800
Message-ID: <2d966e231bdfc5e41a3293e06af8e12f615c7f41.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/6] libtalloc: upgrade to 2.1.8
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
X-List-Received-Date: Mon, 15 Aug 2016 05:59:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libtalloc/{libtalloc_2.1.6.bb => libtalloc_2.1.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.6.bb => libtalloc_2.1.8.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
index b9192b0..7c85ab3 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "707010c6ede5821fd34397f5d9ec6ab8"
-SRC_URI[sha256sum] = "3b8e1a50bacb359d99942e0dd9941cef779ae4b5eb20f138873bd8270cb1d47b"
+SRC_URI[md5sum] = "6fb70af4174330e4cc139ea63b07c9e9"
+SRC_URI[sha256sum] = "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996877130"
 
 
 inherit waf-samba
-- 
1.9.1


