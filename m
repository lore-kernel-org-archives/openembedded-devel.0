Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 199BA7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:06:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,546,1559491200"; d="scan'208";a="75985330"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Sep 2019 15:06:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4008C4CE14F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 15:06:58 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 25 Sep 2019 15:06:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 15:06:51 +0800
Message-ID: <20190925070651.21781-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4008C4CE14F7.A854A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cmd2: upgrade 0.9.16 -> 0.9.17
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
X-List-Received-Date: Wed, 25 Sep 2019 07:06:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc                   | 4 ++--
 .../python/{python-cmd2_0.9.16.bb => python-cmd2_0.9.17.bb}           | 0
 .../python/{python3-cmd2_0.9.16.bb => python3-cmd2_0.9.17.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.16.bb => python-cmd2_0.9.17.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.16.bb => python3-cmd2_0.9.17.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index 1a0be77..3afa93a 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
-SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
+SRC_URI[md5sum] = "c030c7364422609d16028fe1ea023bfe"
+SRC_URI[sha256sum] = "77bea602eb3b553a573188fa9514234bb1e44269d830a0ef8c4357f47aa9e46a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.17.bb
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_0.9.17.bb
-- 
2.7.4




