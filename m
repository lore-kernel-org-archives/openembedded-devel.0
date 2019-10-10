Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0152B7F4F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 07:43:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,279,1566835200"; d="scan'208";a="76762904"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2019 15:43:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 19DAD4CE14F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:43:22 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 10 Oct 2019 15:43:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2019 15:43:33 +0800
Message-ID: <20191010074333.20698-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 19DAD4CE14F9.A88D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cmd2: upgrade 0.9.17 -> 0.9.18
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
X-List-Received-Date: Thu, 10 Oct 2019 07:43:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc                   | 4 ++--
 .../python/{python-cmd2_0.9.17.bb => python-cmd2_0.9.18.bb}           | 0
 .../python/{python3-cmd2_0.9.17.bb => python3-cmd2_0.9.18.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.17.bb => python-cmd2_0.9.18.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.17.bb => python3-cmd2_0.9.18.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index 3afa93a..7782b14 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "c030c7364422609d16028fe1ea023bfe"
-SRC_URI[sha256sum] = "77bea602eb3b553a573188fa9514234bb1e44269d830a0ef8c4357f47aa9e46a"
+SRC_URI[md5sum] = "f7a51dc68ad377ebc6a84408044dc1a2"
+SRC_URI[sha256sum] = "840cdbf50e83761fea69ca5beadcba7569ab03734e3ee42b0dbf7f6f90e1213d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.17.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.17.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.18.bb
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.17.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.17.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_0.9.18.bb
-- 
2.7.4




