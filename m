Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 399167E08E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:22:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78782219"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 15:22:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A581F4CE1BE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:14:23 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 15:22:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 15:23:09 +0800
Message-ID: <20191120072309.28623-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A581F4CE1BE4.A9588
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-urllib3: upgrade 1.25.6 -> 1.25.7
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
X-List-Received-Date: Wed, 20 Nov 2019 07:22:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc        | 4 ++--
 .../{python-urllib3_1.25.6.bb => python-urllib3_1.25.7.bb}    | 0
 .../{python3-urllib3_1.25.6.bb => python3-urllib3_1.25.7.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.25.6.bb => python-urllib3_1.25.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.6.bb => python3-urllib3_1.25.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 398b5f2ac..b7edc03f0 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "a7504a9fcb7ed4ffa482fe098c80b6d4"
-SRC_URI[sha256sum] = "9a107b99a5393caf59c7aa3c1249c16e6879447533d0887f4336dde834c7be86"
+SRC_URI[md5sum] = "85e1e3925f8c1095172bff343f3312ed"
+SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
-- 
2.20.1




