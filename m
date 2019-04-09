Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D37A27D230
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 02:32:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="58812092"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2019 10:32:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AA74E4CD8102
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:32:32 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 9 Apr 2019 10:32:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 10:33:10 +0800
Message-ID: <20190409023310.27426-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: AA74E4CD8102.A7A4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xbitmaps: upgrade 1.1.1 -> 1.1.2
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
X-List-Received-Date: Tue, 09 Apr 2019 02:32:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xbitmaps_1.1.1.bb to xbitmaps_1.1.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-data/{xbitmaps_1.1.1.bb => xbitmaps_1.1.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-data/{xbitmaps_1.1.1.bb => xbitmaps_1.1.2.bb} (58%)

diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
similarity index 58%
rename from meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
rename to meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
index 8647f038e..4d26db668 100644
--- a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.2.bb
@@ -7,5 +7,5 @@ RDEPENDS_${PN}-dev = ""
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
 
-SRC_URI[md5sum] = "7444bbbd999b53bec6a60608a5301f4c"
-SRC_URI[sha256sum] = "3671b034356bbc4d32d052808cf646c940ec8b2d1913adac51b1453e41aa1e9d"
+SRC_URI[md5sum] = "cedeef095918aca86da79a2934e03daf"
+SRC_URI[sha256sum] = "b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee"
-- 
2.20.1




