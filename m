Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9B73873196
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:55:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="79868612"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Dec 2019 16:55:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 060924CE1A0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:47:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019 16:55:56 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Dec 2019 06:58:01 -0800
Message-ID: <1575903483-113548-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 060924CE1A0C.A879D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xterm: upgrade 350 -> 351
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
X-List-Received-Date: Mon, 09 Dec 2019 08:55:58 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_350.bb => xterm_351.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_350.bb => xterm_351.bb} (88%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_350.bb b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
similarity index 88%
rename from meta-oe/recipes-graphics/xorg-app/xterm_350.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_351.bb
index d98ce47..394d2cb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_350.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "189b593841189da66bc1cea92df602a5"
-SRC_URI[sha256sum] = "aefb59eefd310268080d1a90a447368fb97a9a6737bfecfc3800bf6cc304104d"
+SRC_URI[md5sum] = "a07edfbee2e2f4c6a9ddbf834fa4bbec"
+SRC_URI[sha256sum] = "760a8a10221c9c9744afd86db87c7ad95bbf9be4f5f525fecf39125f0d2a6e16"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.7.4




