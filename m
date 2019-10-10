Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 60F857CDAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 05:06:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,278,1566835200"; d="scan'208";a="76753665"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2019 13:06:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 90C244CE03E4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 13:06:08 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 10 Oct 2019 13:06:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2019 13:06:19 +0800
Message-ID: <20191010050619.12347-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 90C244CE03E4.AA185
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-attrs: upgrade 19.1.0 -> 19.2.0
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
X-List-Received-Date: Thu, 10 Oct 2019 05:06:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc                  | 4 ++--
 .../python/{python-attrs_19.1.0.bb => python-attrs_19.2.0.bb}         | 0
 .../python/{python3-attrs_19.1.0.bb => python3-attrs_19.2.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attrs_19.1.0.bb => python-attrs_19.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-attrs_19.1.0.bb => python3-attrs_19.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index bd0f7ee..13c9e5f 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
-SRC_URI[md5sum] = "2be7bce157988928f5ff2bb50a0b510d"
+SRC_URI[sha256sum] = "f913492e1663d3c36f502e5e9ba6cd13cf19d7fab50aa13239e420fef95e1396"
+SRC_URI[md5sum] = "d5a6ee80beaa072bd2b3bcb6fee0d508"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-attrs_19.1.0.bb b/meta-python/recipes-devtools/python/python-attrs_19.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attrs_19.1.0.bb
rename to meta-python/recipes-devtools/python/python-attrs_19.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.1.0.bb b/meta-python/recipes-devtools/python/python3-attrs_19.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-attrs_19.1.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_19.2.0.bb
-- 
2.7.4




