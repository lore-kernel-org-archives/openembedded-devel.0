Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6BA17836A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 06:59:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2Q6xS2O013072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 23:59:29 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 25 Mar 2018 23:59:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Mar 2018 14:56:23 +0800
Message-ID: <20180326065623.1157-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dialog: update to 1.3-20171209
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
X-List-Received-Date: Mon, 26 Mar 2018 06:59:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../dialog/{dialog_1.3-20160828.bb => dialog_1.3-20171209.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20160828.bb => dialog_1.3-20171209.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb
index 85dede177..63c65c4fc 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20171209.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "a39ec183517bc1feaff017d067300b8c"
-SRC_URI[sha256sum] = "453095abaec288bfbc1ca9faced917e17742cff1ea45ec46210071ac153562f9"
+SRC_URI[md5sum] = "f66f28beca900b54f5fc90fdcce93508"
+SRC_URI[sha256sum] = "20139442119e2eff5c35236e8e5e313c901539008d9cccf8c8ab3851b41267e6"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.11.0


