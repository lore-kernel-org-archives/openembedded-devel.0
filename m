Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5257FC84
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:31:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81231104"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 14:31:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C8B6E406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 14:22:37 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 14:31:31 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 14:31:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 14:32:48 +0800
Message-ID: <20200102063248.32464-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C8B6E406AB15.A98E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pycryptodome: upgrade 3.9.3 -> 3.9.4
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
X-List-Received-Date: Thu, 02 Jan 2020 06:31:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pycryptodome.inc   | 4 ++--
 ...hon-pycryptodome_3.9.3.bb => python-pycryptodome_3.9.4.bb} | 0
 ...n3-pycryptodome_3.9.3.bb => python3-pycryptodome_3.9.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycryptodome_3.9.3.bb => python-pycryptodome_3.9.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycryptodome_3.9.3.bb => python3-pycryptodome_3.9.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index 50ffd0a66..31d1368b0 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
 
-SRC_URI[md5sum] = "c4e53f9ed33ca883b18249b9e1546251"
-SRC_URI[sha256sum] = "39ddc3c493125494572e0beefa8e8e6a43369e93c3c3e163cb871b37c1c62fba"
+SRC_URI[md5sum] = "f990716b49add7b14ea8b8a961fb3746"
+SRC_URI[sha256sum] = "a168e73879619b467072509a223282a02c8047d932a48b74fbd498f27224aa04"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.9.3.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycryptodome_3.9.3.bb
rename to meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.3.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycryptodome_3.9.3.bb
rename to meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
-- 
2.20.1




