Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6517D9FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 03:07:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,339,1549900800"; d="scan'208";a="59090391"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2019 11:07:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 440F94CD8183
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:07:07 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 12 Apr 2019 11:07:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Apr 2019 11:07:51 +0800
Message-ID: <20190412030751.28438-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 440F94CD8183.A78FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCHv2] python-certifi: upgrade 2018.8.13 -> 2019.3.9
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
X-List-Received-Date: Fri, 12 Apr 2019 03:07:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-certifi_2018.8.13.bb to python-certifi_2019.3.9.bb.

-Upgrade from python3-certifi_2018.8.13.bb to python3-certifi_2019.3.9.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-certifi.inc        | 4 ++--
 ...python-certifi_2018.8.13.bb => python-certifi_2019.3.9.bb} | 0
 ...thon3-certifi_2018.8.13.bb => python3-certifi_2019.3.9.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2018.8.13.bb => python-certifi_2019.3.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2018.8.13.bb => python3-certifi_2019.3.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index c7955c57d..9d99b3475 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "a84571995a209dcd00a1702a74302b88"
-SRC_URI[sha256sum] = "4c1d68a1408dd090d2f3a869aa94c3947cc1d967821d1ed303208c9f41f0f2f4"
+SRC_URI[md5sum] = "76381d19d0a1171fecb2d1002b81424e"
+SRC_URI[sha256sum] = "b26104d6835d1f5e49452a26eb2ff87fe7090b89dfcaee5ea2212697e1e1d7ae"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb b/meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb
rename to meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2018.8.13.bb b/meta-python/recipes-devtools/python/python3-certifi_2019.3.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2018.8.13.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2019.3.9.bb
-- 
2.20.1




