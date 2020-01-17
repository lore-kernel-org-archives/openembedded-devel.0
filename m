Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D61396B512
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:20:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,329,1574092800"; d="scan'208";a="82113705"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 16:20:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 439EC4CE26CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:11:15 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 16:20:23 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 16:20:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 16:21:52 +0800
Message-ID: <20200117082152.980-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 439EC4CE26CD.AC611
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-waitress: upgrade 1.4.1 -> 1.4.2
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
X-List-Received-Date: Fri, 17 Jan 2020 08:20:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-waitress.inc       | 4 ++--
 .../{python-waitress_1.4.1.bb => python-waitress_1.4.2.bb}    | 0
 .../{python3-waitress_1.4.1.bb => python3-waitress_1.4.2.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-waitress_1.4.1.bb => python-waitress_1.4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.1.bb => python3-waitress_1.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b/meta-python/recipes-devtools/python/python-waitress.inc
index a8d337fd5..0c288d52f 100644
--- a/meta-python/recipes-devtools/python/python-waitress.inc
+++ b/meta-python/recipes-devtools/python/python-waitress.inc
@@ -6,5 +6,5 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "e6b9f0406cb4e6fedcc3add96411786d"
-SRC_URI[sha256sum] = "f4118cbce75985fd60aeb4f0d781aba8dc7ae28c18e50753e913d7a7dee76b62"
+SRC_URI[md5sum] = "fdeed7ec32bbba011e90801208378c89"
+SRC_URI[sha256sum] = "67a60a376f0eb335ed88967c42b73983a58d66a2a72eb9009a42725f7453b142"
diff --git a/meta-python/recipes-devtools/python/python-waitress_1.4.1.bb b/meta-python/recipes-devtools/python/python-waitress_1.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-waitress_1.4.1.bb
rename to meta-python/recipes-devtools/python/python-waitress_1.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.1.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
-- 
2.20.1




