Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3206601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:37:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ5bM8U018361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 21:37:23 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 21:37:22 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:37:18 +0800
Message-ID: <6fba874a520c454bc345429d79a1bb2f54c28a8e.1447910888.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447910888.git.jackie.huang@windriver.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/7 v2] libldb: upgrade to 1.1.21
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
X-List-Received-Date: Thu, 19 Nov 2015 05:37:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/libldb/{libldb_1.1.17.bb => libldb_1.1.21.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.17.bb => libldb_1.1.21.bb} (92%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb b/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
similarity index 92%
rename from meta-networking/recipes-support/libldb/libldb_1.1.17.bb
rename to meta-networking/recipes-support/libldb/libldb_1.1.21.bb
index 44f061a..f4531d5 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "7c2ab4e3f2a4186493aa06eabbc61cc0"
-SRC_URI[sha256sum] = "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bdb6e6"
+SRC_URI[md5sum] = "94ba09c7452fff68df3481686c56677e"
+SRC_URI[sha256sum] = "267bbb7f278068eaf0de27adffda2e691a070a93c5c15ee27c828e87b4c7dbf1"
 
 inherit waf-samba
 
-- 
1.9.1


