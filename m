Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 524C97FBCA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 06:44:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,337,1574092800"; d="scan'208";a="82255606"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 14:44:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AC2AC5010EAD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 14:35:36 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 14:44:45 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 14:44:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 14:46:15 +0800
Message-ID: <20200119064615.5274-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AC2AC5010EAD.AA3F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-pychromecast: upgrade 4.0.1 -> 4.1.0
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
X-List-Received-Date: Sun, 19 Jan 2020 06:44:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...n3-pychromecast_4.0.1.bb => python3-pychromecast_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_4.0.1.bb => python3-pychromecast_4.1.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb
index 1b9301f96..b79e7954c 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "d6f96d478fd768696a0e440cb0ea903b"
-SRC_URI[sha256sum] = "d98df28f340bb14a07236846518daad7107b66581512c33da921663df61ac819"
+SRC_URI[md5sum] = "46fbd33212f3869c5dc2d8b4a1d667e5"
+SRC_URI[sha256sum] = "b6979f1ddce1ff8760586aa6b8828290964b38f34c01aa1380ab1740330eeee2"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.20.1




