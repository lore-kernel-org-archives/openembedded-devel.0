Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C92E6D545
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 08:20:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,454,1557158400"; d="scan'208";a="70807662"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jul 2019 16:20:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F9F44CDDD5C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:20:51 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 16:21:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jul 2019 16:20:01 +0800
Message-ID: <20190705082001.6076-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 1F9F44CDDD5C.A9AAE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] dialog: upgrade 1.3-20180621 -> 1.3-20190211
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
X-List-Received-Date: Fri, 05 Jul 2019 08:20:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from dialog_1.3-20180621.bb to dialog_1.3-20190211.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20180621.bb => dialog_1.3-20190211.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20180621.bb => dialog_1.3-20190211.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb
index e987959..f232dd0 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20180621.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "1dba09cf45ac4ba40b3cb4a3f1d694b2"
-SRC_URI[sha256sum] = "4a4859e2b22d24e46c1a529b5a5605b95503aa04da4432f7bbd713e3e867587a"
+SRC_URI[md5sum] = "27d05caef648e8e02d0908a59951d44c"
+SRC_URI[sha256sum] = "49c0e289d77dcd7806f67056c54f36a96826a9b73a53fb0ffda1ffa6f25ea0d3"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.7.4




