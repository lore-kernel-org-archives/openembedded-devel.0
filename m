Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E193F6059F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 06:32:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14830529"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 14:32:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 550CD47B0CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 14:32:39 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 14:32:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 14:32:26 +0800
Message-ID: <1484634746-26773-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 550CD47B0CAF.AA305
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-m2crypto: 0.23.0 -> 0.25.1
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
X-List-Received-Date: Tue, 17 Jan 2017 06:32:48 -0000
Content-Type: text/plain

Upgrade python-m2crypto from 0.23.0 to 0.25.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-m2crypto_0.23.0.bb => python-m2crypto_0.25.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.23.0.bb => python-m2crypto_0.25.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
index ab665d4..5a9594f 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
@@ -2,10 +2,10 @@ SUMMARY = "A Python crypto and SSL toolkit"
 HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=68f7880de949412b2ea248932d97ed54"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
 
-SRC_URI[md5sum] = "89557730e245294a6cab06de8ad4fb42"
-SRC_URI[sha256sum] = "1ac3b6eafa5ff7e2a0796675316d7569b28aada45a7ab74042ad089d15a9567f"
+SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
+SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 
-- 
2.7.4




