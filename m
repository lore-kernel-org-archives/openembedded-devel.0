Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3248F7C326
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 08:26:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; d="scan'208";a="79505833"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:26:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AA474CE1C09
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 16:17:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:26:08 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Dec 2019 06:50:55 -0800
Message-ID: <1575384656-121548-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7AA474CE1C09.A7419
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-paste: 3.2.2 -> 3.2.3
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
X-List-Received-Date: Tue, 03 Dec 2019 08:26:30 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python-paste_3.2.2.bb => python-paste_3.2.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_3.2.2.bb => python-paste_3.2.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-paste_3.2.2.bb b/meta-python/recipes-devtools/python/python-paste_3.2.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-paste_3.2.2.bb
rename to meta-python/recipes-devtools/python/python-paste_3.2.3.bb
index 2778fc6..c3d4fdd 100644
--- a/meta-python/recipes-devtools/python/python-paste_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python-paste_3.2.3.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "788fceb192bc338f1a3e2a8f78fd42b6"
-SRC_URI[sha256sum] = "0b1f4d86f8366f0d4093e5449813792c98e760edc6b7c918f0f29f9ef22ae996"
+SRC_URI[md5sum] = "7dc6dbd20e358dd95bd42eef5c6cc84c"
+SRC_URI[sha256sum] = "8bdc7f6be907eed7cd63868c79d88af2b87d02d840fb5acfc93d4bda572b1567"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
2.7.4




