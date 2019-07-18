Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B06127EE09
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:24:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,276,1559491200"; d="scan'208";a="71678565"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jul 2019 10:24:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B82AA4CDDD3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 10:24:41 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Jul 2019 10:24:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jul 2019 10:23:56 +0800
Message-ID: <20190718022356.12639-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: B82AA4CDDD3F.ACB8E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] setxkbmap: upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Thu, 18 Jul 2019 02:24:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from setxkbmap_1.3.1.bb to setxkbmap_1.3.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{setxkbmap_1.3.1.bb => setxkbmap_1.3.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.1.bb => setxkbmap_1.3.2.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
index 8402753..30fbd1b 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
@@ -15,5 +15,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "2c47a1b8e268df73963c4eb2316b1a89"
-SRC_URI[sha256sum] = "a9ddb3963f263ba13f0ea105d8c45a531832140530217cc559587bb94f02d3e1"
+SRC_URI[md5sum] = "93e736c98fb75856ee8227a0c49a128d"
+SRC_URI[sha256sum] = "8ff27486442725e50b02d7049152f51d125ecad71b7ce503cfa09d5d8ceeb9f5"
-- 
2.7.4




