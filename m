Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19CBE60248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9oqrQ027192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:50:52 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:50:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:21 -0700
Message-ID: <20180627094922.109996-11-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/13] dialog: Upgrade to 1.3-20180621
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:51 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../dialog/{dialog_1.3-20171209.bb => dialog_1.3-20180621.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20171209.bb => dialog_1.3-20180621.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb
index 63c65c4fc..e98795944 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "f66f28beca900b54f5fc90fdcce93508"
-SRC_URI[sha256sum] = "20139442119e2eff5c35236e8e5e313c901539008d9cccf8c8ab3851b41267e6"
+SRC_URI[md5sum] = "1dba09cf45ac4ba40b3cb4a3f1d694b2"
+SRC_URI[sha256sum] = "4a4859e2b22d24e46c1a529b5a5605b95503aa04da4432f7bbd713e3e867587a"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.17.1


