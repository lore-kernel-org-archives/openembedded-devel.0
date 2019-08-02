Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F309260291
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 01:00:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,336,1559491200"; d="scan'208";a="72700848"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 09:00:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F1E974CDCCC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 09:00:09 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 09:00:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 08:59:28 +0800
Message-ID: <20190802005928.17775-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: F1E974CDCCC4.AC9C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python] [PATCH] python-pycodestyle: upgrade 2.4.0 -> 2.5.0
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
X-List-Received-Date: Fri, 02 Aug 2019 01:00:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pycodestyle.inc            | 4 ++--
 .../{python-pycodestyle_2.4.0.bb => python-pycodestyle_2.5.0.bb}      | 0
 .../{python3-pycodestyle_2.4.0.bb => python3-pycodestyle_2.5.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycodestyle_2.4.0.bb => python-pycodestyle_2.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.4.0.bb => python3-pycodestyle_2.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycodestyle.inc b/meta-python/recipes-devtools/python/python-pycodestyle.inc
index c0e46b7..96cdc5d 100644
--- a/meta-python/recipes-devtools/python/python-pycodestyle.inc
+++ b/meta-python/recipes-devtools/python/python-pycodestyle.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
 
-SRC_URI[md5sum] = "85bbebd2c90d2f833c1db467d4d0e9a3"
-SRC_URI[sha256sum] = "cbfca99bd594a10f674d0cd97a3d802a1fdef635d4361e1a2658de47ed261e3a"
+SRC_URI[md5sum] = "40e7a76f364a18f531aaba11a4476e21"
+SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb b/meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
rename to meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
-- 
2.7.4




