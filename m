Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73B4A7884B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7VY4X009802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:34 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:21 +0800
Message-ID: <1531899089-395618-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] mm-common: 0.9.11 -> 0.9.12
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:33 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb | 9 ---------
 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
deleted file mode 100644
index 591caa7..0000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit gnomebase
-
-SRC_URI[archive.md5sum] = "d6f2a43589480d2315672da0b5839b56"
-SRC_URI[archive.sha256sum] = "20d1e7466ca4c83c92e29f9e8dfcc8e5721fdf1337f53157bed97be3b73b32a8"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
new file mode 100644
index 0000000..4f91f31
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
@@ -0,0 +1,9 @@
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "be1c61587db989c7677375a729b94672"
+SRC_URI[archive.sha256sum] = "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


