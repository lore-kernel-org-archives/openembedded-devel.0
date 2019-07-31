Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C0E507F3BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:12:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,328,1559491200"; d="scan'208";a="72571025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 14:12:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B32A4CDE65E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 14:12:26 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 14:12:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2019 14:11:45 +0800
Message-ID: <20190731061145.24649-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 1B32A4CDE65E.A8D6B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] dialog: upgrade 1.3-20190211 -> 1.3-20190728
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
X-List-Received-Date: Wed, 31 Jul 2019 06:12:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20190211.bb => dialog_1.3-20190728.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20190211.bb => dialog_1.3-20190728.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb
index f232dd0..d414bc6 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20190211.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20190728.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "27d05caef648e8e02d0908a59951d44c"
-SRC_URI[sha256sum] = "49c0e289d77dcd7806f67056c54f36a96826a9b73a53fb0ffda1ffa6f25ea0d3"
+SRC_URI[md5sum] = "e9d7f8b5e7b17183b0fb9297c0f57840"
+SRC_URI[sha256sum] = "e5eb0eaaef9cae8c822887bd998e33c2c3b94ebadd37b4f6aba018c0194a2a87"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.7.4




