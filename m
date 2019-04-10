Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 63A1C7D795
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 08:26:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549900800"; d="scan'208";a="58933115"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Apr 2019 16:26:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 456AB4CD8122
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:26:49 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 10 Apr 2019 16:26:48 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Apr 2019 16:27:26 +0800
Message-ID: <20190410082726.30843-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 456AB4CD8122.A86F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-attrs: upgrade 18.1.0 -> 19.1.0
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
X-List-Received-Date: Wed, 10 Apr 2019 08:26:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-attrs_18.1.0.bb to python-attrs_19.1.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc          | 4 ++--
 .../python/{python-attrs_18.1.0.bb => python-attrs_19.1.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attrs_18.1.0.bb => python-attrs_19.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index d0b5697cb..1f767ba19 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "e0d0eb91441a3b53dab4d9b743eafc1ac44476296a2053b6ca3af0b139faf87b"
-SRC_URI[md5sum] = "3f3f3e0750dab74cfa1dc8b0fd7a5f86"
+SRC_URI[sha256sum] = "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
+SRC_URI[md5sum] = "2be7bce157988928f5ff2bb50a0b510d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-attrs_18.1.0.bb b/meta-python/recipes-devtools/python/python-attrs_19.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attrs_18.1.0.bb
rename to meta-python/recipes-devtools/python/python-attrs_19.1.0.bb
-- 
2.20.1




