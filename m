Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE717D277
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 01:56:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="58808504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2019 09:56:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E2DA54CD8107
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 09:56:29 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 9 Apr 2019 09:56:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 09:57:07 +0800
Message-ID: <20190409015707.14043-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: E2DA54CD8107.AAA6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xlsatoms: upgrade 1.1.2 -> 1.1.3
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
X-List-Received-Date: Tue, 09 Apr 2019 01:56:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xlsatoms_1.1.2.bb to xlsatoms_1.1.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xlsatoms_1.1.2.bb => xlsatoms_1.1.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsatoms_1.1.2.bb => xlsatoms_1.1.3.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb
index 723d4e211..288bcfc8f 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "5dcb6e6c4b28c8d7aeb45257f5a72a7d"
-SRC_URI[sha256sum] = "47e5dc7c3dbda6db2cf8c00cedac1722835c1550aa21cfdbc9ba83906694dea4"
+SRC_URI[md5sum] = "61671fee12535347db24ec3a715032a7"
+SRC_URI[sha256sum] = "57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382"
-- 
2.20.1




