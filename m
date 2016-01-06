Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0D1731E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 06:42:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u066gaXj014585
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Jan 2016 22:42:36 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 22:42:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 14:42:45 +0800
Message-ID: <df9b6c27958ed4b08e6fd744630d3e90dac3ebe7.1452061871.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452061871.git.jackie.huang@windriver.com>
References: <cover.1452061871.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/7 v3] libtalloc: upgrade to 2.1.3
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
X-List-Received-Date: Wed, 06 Jan 2016 06:42:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libtalloc/{libtalloc_2.1.1.bb => libtalloc_2.1.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.1.bb => libtalloc_2.1.3.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
index 521d4da..5c2238d 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "5dffb86414218a91864ed4453ba9be07"
-SRC_URI[sha256sum] = "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
+SRC_URI[md5sum] = "3e285de2228ae67ff0a0f5cec658f627"
+SRC_URI[sha256sum] = "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
 
 inherit waf-samba
 
-- 
1.9.1


