Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D01BD7DFA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 06:15:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,448,1549900800"; d="scan'208";a="62220852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2019 14:15:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C5A474CDB2F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 14:15:00 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 May 2019 14:15:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2019 14:15:57 +0800
Message-ID: <20190509061557.989-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: C5A474CDB2F9.AA18C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-mock: upgrade 2.0.0 -> 3.0.5
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
X-List-Received-Date: Thu, 09 May 2019 06:15:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-mock_2.0.0.bb => python-mock_3.0.5.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mock_2.0.0.bb => python-mock_3.0.5.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb b/meta-python/recipes-devtools/python/python-mock_3.0.5.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-mock_2.0.0.bb
rename to meta-python/recipes-devtools/python/python-mock_3.0.5.bb
index 210502ff5..db7106649 100644
--- a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-mock_3.0.5.bb
@@ -2,8 +2,8 @@ SUMMARY = "A Python Mocking and Patching Library for Testing"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
-SRC_URI[md5sum] = "0febfafd14330c9dcaa40de2d82d40ad"
-SRC_URI[sha256sum] = "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
+SRC_URI[md5sum] = "d834a46d9a129be3e76fdcc99751e82c"
+SRC_URI[sha256sum] = "83657d894c90d5681d62155c82bda9c1187827525880eda8ff5df4ec813437c3"
 
 inherit pypi setuptools
 
-- 
2.20.1




