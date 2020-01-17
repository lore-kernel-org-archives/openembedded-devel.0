Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 17C947F9BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:35:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,329,1574092800"; d="scan'208";a="82115673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 16:35:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C4044CE30E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:26:15 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 16:35:22 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 16:35:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 16:36:52 +0800
Message-ID: <20200117083652.4676-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0C4044CE30E4.AE301
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-tqdm: upgrade 4.38.0 -> 4.41.1
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
X-List-Received-Date: Fri, 17 Jan 2020 08:35:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-tqdm.inc           | 4 ++--
 .../python/{python-tqdm_4.38.0.bb => python-tqdm_4.41.1.bb}   | 0
 .../python/{python3-tqdm_4.38.0.bb => python3-tqdm_4.41.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tqdm_4.38.0.bb => python-tqdm_4.41.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.38.0.bb => python3-tqdm_4.41.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tqdm.inc b/meta-python/recipes-devtools/python/python-tqdm.inc
index 1e410f402..8a0534f9a 100644
--- a/meta-python/recipes-devtools/python/python-tqdm.inc
+++ b/meta-python/recipes-devtools/python/python-tqdm.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=054ef7105cba050017d1368262a1623c"
 
 inherit pypi
 
-SRC_URI[md5sum] = "9a092a5878090996bbb0ed92bf572a8a"
-SRC_URI[sha256sum] = "c1d677f3a85fa291b34bdf8f770f877119b9754b32673699653556f85e2c2f13"
+SRC_URI[md5sum] = "aa3d5fd173c9fea7408cad14c0e73d5d"
+SRC_URI[sha256sum] = "4789ccbb6fc122b5a6a85d512e4e41fc5acad77216533a6f2b8ce51e0f265c23"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-tqdm_4.38.0.bb b/meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tqdm_4.38.0.bb
rename to meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.38.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.41.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.38.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.41.1.bb
-- 
2.20.1




