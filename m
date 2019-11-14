Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6C17D72F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 05:41:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78438740"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 13:41:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 214864CE1BE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:32:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 13:41:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 13:41:36 +0800
Message-ID: <20191114054136.9597-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 214864CE1BE4.AD0E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-tqdm: upgrade 4.31.1 -> 4.38.0
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
X-List-Received-Date: Thu, 14 Nov 2019 05:41:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-tqdm.inc           | 4 ++--
 .../python/{python-tqdm_4.31.1.bb => python-tqdm_4.38.0.bb}   | 0
 .../python/{python3-tqdm_4.31.1.bb => python3-tqdm_4.38.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tqdm_4.31.1.bb => python-tqdm_4.38.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.31.1.bb => python3-tqdm_4.38.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tqdm.inc b/meta-python/recipes-devtools/python/python-tqdm.inc
index 967a80c20..1e410f402 100644
--- a/meta-python/recipes-devtools/python/python-tqdm.inc
+++ b/meta-python/recipes-devtools/python/python-tqdm.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=054ef7105cba050017d1368262a1623c"
 
 inherit pypi
 
-SRC_URI[md5sum] = "807e8c13e16e3660ac88e05d711daeb0"
-SRC_URI[sha256sum] = "e22977e3ebe961f72362f6ddfb9197cc531c9737aaf5f607ef09740c849ecd05"
+SRC_URI[md5sum] = "9a092a5878090996bbb0ed92bf572a8a"
+SRC_URI[sha256sum] = "c1d677f3a85fa291b34bdf8f770f877119b9754b32673699653556f85e2c2f13"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb b/meta-python/recipes-devtools/python/python-tqdm_4.38.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tqdm_4.31.1.bb
rename to meta-python/recipes-devtools/python/python-tqdm_4.38.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.38.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.31.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.38.0.bb
-- 
2.20.1




