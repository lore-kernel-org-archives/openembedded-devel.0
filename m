Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 35C636BA10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 06:21:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63111928"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 14:21:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1177B46BA6C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 14:21:16 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 14:21:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 May 2019 14:22:13 +0800
Message-ID: <20190515062213.28384-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 1177B46BA6C2.A9B0B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-wrapt: upgrade 1.10.11 -> 1.11.1
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
X-List-Received-Date: Wed, 15 May 2019 06:21:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-wrapt_1.10.11.bb to python-wrapt_1.11.1.bb.

-Upgrade from python3-wrapt_1.10.11.bb to python3-wrapt_1.11.1.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-wrapt.inc        | 6 +++---
 .../{python-wrapt_1.10.11.bb => python-wrapt_1.11.1.bb}     | 0
 .../{python3-wrapt_1.10.11.bb => python3-wrapt_1.11.1.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wrapt_1.10.11.bb => python-wrapt_1.11.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.10.11.bb => python3-wrapt_1.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-python/recipes-devtools/python/python-wrapt.inc
index c85548fb4..4de09d2fd 100644
--- a/meta-python/recipes-devtools/python/python-wrapt.inc
+++ b/meta-python/recipes-devtools/python/python-wrapt.inc
@@ -2,10 +2,10 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "http://wrapt.readthedocs.org/"
 LICENSE = "BSD"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=61c27930012e86b3dc7e36f92e83c4d8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
 
-SRC_URI[md5sum] = "e1346f31782d50401f81c2345b037076"
-SRC_URI[sha256sum] = "d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6"
+SRC_URI[md5sum] = "9f21acd7c0a57bf3057715c4665db3c7"
+SRC_URI[sha256sum] = "4aea003270831cceb8a90ff27c4031da6ead7ec1886023b80ce0dfe0adf61533"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.11.bb b/meta-python/recipes-devtools/python/python-wrapt_1.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-wrapt_1.10.11.bb
rename to meta-python/recipes-devtools/python/python-wrapt_1.11.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.10.11.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.10.11.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.11.1.bb
-- 
2.20.1




