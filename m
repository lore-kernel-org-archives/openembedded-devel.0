Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89B6E77166
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 12:02:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10845226"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2016 20:02:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E01DD404240C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 20:02:42 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sun, 11 Sep 2016 20:02:43 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Sep 2016 08:02:35 -0400
Message-ID: <1473595355-1405-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: E01DD404240C.A6F9F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tk: 8.6.4 -> 8.6.6
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
X-List-Received-Date: Sun, 11 Sep 2016 12:02:47 -0000
Content-Type: text/plain

Upgrade tk from 8.6.4 to 8.6.6.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/tcltk/{tk_8.6.4.bb => tk_8.6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.4.bb => tk_8.6.6.bb} (94%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
similarity index 94%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
index d8eca50..59075bc 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
@@ -26,8 +26,8 @@ SRC_URI = "\
     file://fix-xft.diff \
     file://configure.use.fontconfig.with.xft.patch \
 "
-SRC_URI[md5sum] = "261754d7dc2a582f00e35547777e1fea"
-SRC_URI[sha256sum] = "08f99df85e5dc9c4271762163c6aabb962c8b297dc5c4c1af8bdd05fc2dd26c1"
+SRC_URI[md5sum] = "dd7dbb3a6523c42d05f6ab6e86096e99"
+SRC_URI[sha256sum] = "d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d88eb19d"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
-- 
2.7.4




