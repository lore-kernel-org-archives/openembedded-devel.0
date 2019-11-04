Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D502A7D185
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 02:19:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,265,1569254400"; d="scan'208";a="77872316"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 10:19:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 138894CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 10:11:23 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 10:19:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2019 10:19:43 +0800
Message-ID: <20191104021943.9331-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 138894CE1510.AA781
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyjwt: upgrade 1.6.4 -> 1.7.1
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
X-List-Received-Date: Mon, 04 Nov 2019 02:19:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyjwt.inc          | 4 ++--
 .../python/{python-pyjwt_1.6.4.bb => python-pyjwt_1.7.1.bb}   | 0
 .../python/{python3-pyjwt_1.6.4.bb => python3-pyjwt_1.7.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyjwt_1.6.4.bb => python-pyjwt_1.7.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.6.4.bb => python3-pyjwt_1.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
index 00c38e317..9b8938530 100644
--- a/meta-python/recipes-devtools/python/python-pyjwt.inc
+++ b/meta-python/recipes-devtools/python/python-pyjwt.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[md5sum] = "2731c6b66b67b95d1944f072f5fa35a9"
-SRC_URI[sha256sum] = "4ee413b357d53fd3fb44704577afac88e72e878716116270d722723d65b42176"
+SRC_URI[md5sum] = "a4712f980c008696e13e09504120b2a0"
+SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.6.4.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyjwt_1.6.4.bb
rename to meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.6.4.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.6.4.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
-- 
2.20.1




