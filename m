Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3557FA18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:36:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82110068"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 15:36:55 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CEDF4CE20FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 15:27:42 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 15:36:50 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 15:36:48 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 15:38:17 +0800
Message-ID: <20200117073817.27415-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6CEDF4CE20FF.ABA3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-wcwidth: upgrade 0.1.7 -> 0.1.8
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
X-List-Received-Date: Fri, 17 Jan 2020 07:36:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-wcwidth.inc        | 4 ++--
 .../{python-wcwidth_0.1.7.bb => python-wcwidth_0.1.8.bb}      | 0
 .../{python3-wcwidth_0.1.7.bb => python3-wcwidth_0.1.8.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wcwidth_0.1.7.bb => python-wcwidth_0.1.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-wcwidth_0.1.7.bb => python3-wcwidth_0.1.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-wcwidth.inc b/meta-python/recipes-devtools/python/python-wcwidth.inc
index 1429450bb..bbd0d50bf 100644
--- a/meta-python/recipes-devtools/python/python-wcwidth.inc
+++ b/meta-python/recipes-devtools/python/python-wcwidth.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
 
-SRC_URI[md5sum] = "b3b6a0a08f0c8a34d1de8cf44150a4ad"
-SRC_URI[sha256sum] = "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
+SRC_URI[md5sum] = "dc6677d099e6f49c0f6fbc310de261e9"
+SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb b/meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb
rename to meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb
rename to meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
-- 
2.20.1




