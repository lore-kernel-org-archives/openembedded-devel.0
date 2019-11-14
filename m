Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C3C787F836
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:18:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78433691"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 11:18:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 798204CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:09:57 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 11:18:08 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 11:18:40 +0800
Message-ID: <20191114031840.22702-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 798204CE1510.A7893
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyparsing: upgrade 2.4.2 -> 2.4.5
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
X-List-Received-Date: Thu, 14 Nov 2019 03:18:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyparsing.inc      | 4 ++--
 .../{python-pyparsing_2.4.2.bb => python-pyparsing_2.4.5.bb}  | 0
 ...{python3-pyparsing_2.4.2.bb => python3-pyparsing_2.4.5.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.4.2.bb => python-pyparsing_2.4.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyparsing_2.4.2.bb => python3-pyparsing_2.4.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
index 556946e76..bf89be662 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing.inc
+++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[md5sum] = "46d02cbe0461fe0571d51649e6006ef5"
-SRC_URI[sha256sum] = "6f98a7b9397e206d78cc01df10131398f1c8b8510a2f4d97d9abd82e1aacdd80"
+SRC_URI[md5sum] = "75dfad250d739efa82c7c0eeaacc5e68"
+SRC_URI[sha256sum] = "4ca62001be367f01bd3e92ecbb79070272a9d4964dce6a48a82ff0b8bc7e683a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.4.2.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.4.2.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.4.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.2.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyparsing_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pyparsing_2.4.5.bb
-- 
2.20.1




