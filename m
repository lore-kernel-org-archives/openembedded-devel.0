Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF3C78493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6I7Vjl3012406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:26 +0800
Message-ID: <1531899089-395618-7-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] python-pygobject: 3.28.0 -> 3.28.3
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:44 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python/{python-pygobject_3.28.0.bb => python-pygobject_3.28.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.28.0.bb => python-pygobject_3.28.3.bb} (87%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
similarity index 87%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
index ab65ba1..c444fbf 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
@@ -17,8 +17,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "b29d69edb63ae1f555afeb19f90b9996"
-SRC_URI[sha256sum] = "42b47b261b45aedfc77e02e3c90a01cd74d6f86c3273c1860a054d531d606e5a"
+SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
+SRC_URI[sha256sum] = "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


