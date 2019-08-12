Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11D4E7E95B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:04:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73487840"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 14:04:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D6124CE0327
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:04:15 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 14:04:17 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Aug 2019 14:03:34 +0800
Message-ID: <20190812060334.29374-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4D6124CE0327.A7640
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.2.1 -> 19.2.2
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
X-List-Received-Date: Mon, 12 Aug 2019 06:04:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.2.1.bb => python-pip_19.2.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.2.1.bb => python-pip_19.2.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.2.1.bb b/meta-python/recipes-devtools/python/python-pip_19.2.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.2.1.bb
rename to meta-python/recipes-devtools/python/python-pip_19.2.2.bb
index 5a2b94b..9a03727 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.2.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "e9ac3e030e88b6c076a20ab371a30742"
-SRC_URI[sha256sum] = "258d702483dd749400aec59c23d638a5b2249ae28a0f478b6cab12ad45681a80"
+SRC_URI[md5sum] = "2ba0a3b76d39ccd90ca22bfa82fc635f"
+SRC_URI[sha256sum] = "e05103825871e210d50a44c7e448587b0ed99dd775d3ef586304c58f40224a53"
 
 inherit pypi setuptools
 
-- 
2.7.4




