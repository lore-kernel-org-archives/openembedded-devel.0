Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 73B2160807
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:51:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76984205"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 14:51:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F3E5D4CE1500
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 14:51:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 14:51:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 14:51:50 +0800
Message-ID: <20191015065150.5290-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: F3E5D4CE1500.A8EBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paste: upgrade 3.2.1 -> 3.2.2
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
X-List-Received-Date: Tue, 15 Oct 2019 06:51:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paste_3.2.1.bb => python-paste_3.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.2.1.bb => python-paste_3.2.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.2.1.bb b/meta-python/recipes-devtools/python/python-paste_3.2.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.2.1.bb
rename to meta-python/recipes-devtools/python/python-paste_3.2.2.bb
index 6c78598a4..2778fc6b5 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.2.2.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "4ec8ac6032270daf91ff9621bda019d0"
-SRC_URI[sha256sum] = "3d9c9e96a8408777b01976dfce900049e9e8c970e02198534f2c8c1b2cca5dee"
+SRC_URI[md5sum] = "788fceb192bc338f1a3e2a8f78fd42b6"
+SRC_URI[sha256sum] = "0b1f4d86f8366f0d4093e5449813792c98e760edc6b7c918f0f29f9ef22ae996"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.20.1




