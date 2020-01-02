Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A734A7FC8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 07:24:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81232460"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 15:24:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E03749E931A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 15:15:53 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 15:24:46 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 15:24:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 15:26:04 +0800
Message-ID: <20200102072604.31449-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8E03749E931A.AA01C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyparsing: upgrade 2.4.5 -> 2.4.6
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
X-List-Received-Date: Thu, 02 Jan 2020 07:24:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyparsing.inc      | 4 ++--
 .../{python-pyparsing_2.4.5.bb => python-pyparsing_2.4.6.bb}  | 0
 ...{python3-pyparsing_2.4.5.bb => python3-pyparsing_2.4.6.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.4.5.bb => python-pyparsing_2.4.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyparsing_2.4.5.bb => python3-pyparsing_2.4.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
index bf89be662..2b9925f49 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing.inc
+++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[md5sum] = "75dfad250d739efa82c7c0eeaacc5e68"
-SRC_URI[sha256sum] = "4ca62001be367f01bd3e92ecbb79070272a9d4964dce6a48a82ff0b8bc7e683a"
+SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
+SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.4.5.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.4.5.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.5.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyparsing_2.4.5.bb
rename to meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
-- 
2.20.1




