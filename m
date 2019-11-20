Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6E87E7CBD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:29:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78782458"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 15:29:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C3934CE1BE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:20:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 15:29:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 15:29:39 +0800
Message-ID: <20191120072939.29856-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2C3934CE1BE4.A9179
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-tzlocal: upgrade 1.5.1 -> 2.0.0
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
X-List-Received-Date: Wed, 20 Nov 2019 07:29:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-tzlocal.inc        | 4 ++--
 .../{python-tzlocal_1.5.1.bb => python-tzlocal_2.0.0.bb}      | 0
 .../{python3-tzlocal_1.5.1.bb => python3-tzlocal_2.0.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tzlocal_1.5.1.bb => python-tzlocal_2.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_1.5.1.bb => python3-tzlocal_2.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tzlocal.inc b/meta-python/recipes-devtools/python/python-tzlocal.inc
index 42f93e6a5..7c2ad2471 100644
--- a/meta-python/recipes-devtools/python/python-tzlocal.inc
+++ b/meta-python/recipes-devtools/python/python-tzlocal.inc
@@ -3,6 +3,6 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[md5sum] = "4553be891efa0812c4adfb0c6e818eec"                            
-SRC_URI[sha256sum] = "4ebeb848845ac898da6519b9b31879cf13b6626f7184c496037b818e238f2c4e" 
+SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"                            
+SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590" 
 
diff --git a/meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb
rename to meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
-- 
2.20.1




