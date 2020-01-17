Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8642B7F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 06:36:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82104659"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 14:36:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F5F04CE26C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 14:27:38 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 14:36:46 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 14:36:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 14:38:12 +0800
Message-ID: <20200117063812.19533-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3F5F04CE26C8.AA4B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-yarl: upgrade 1.3.0 -> 1.4.2
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
X-List-Received-Date: Fri, 17 Jan 2020 06:36:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-yarl.inc           | 4 ++--
 .../python/{python3-yarl_1.3.0.bb => python3-yarl_1.4.2.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.3.0.bb => python3-yarl_1.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-yarl.inc b/meta-python/recipes-devtools/python/python-yarl.inc
index ea555418a..98066d73b 100644
--- a/meta-python/recipes-devtools/python/python-yarl.inc
+++ b/meta-python/recipes-devtools/python/python-yarl.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 
-SRC_URI[md5sum] = "92889c31fce4c8f82b7ee9c2b2ed9cd1"
-SRC_URI[sha256sum] = "024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388ba7aa9"
+SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
+SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
 
 PYPI_PACKAGE = "yarl"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
-- 
2.20.1




