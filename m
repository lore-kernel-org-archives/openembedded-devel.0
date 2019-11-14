Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 195327F838
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 02:58:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78432638"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 10:58:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B72554CE1BEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 10:50:22 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 10:58:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 10:59:05 +0800
Message-ID: <20191114025905.15439-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B72554CE1BEC.AC521
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pycryptodome: upgrade 3.9.0 -> 3.9.3
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
X-List-Received-Date: Thu, 14 Nov 2019 02:58:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pycryptodome.inc   | 4 ++--
 ...hon-pycryptodome_3.9.0.bb => python-pycryptodome_3.9.3.bb} | 0
 ...n3-pycryptodome_3.9.0.bb => python3-pycryptodome_3.9.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycryptodome_3.9.0.bb => python-pycryptodome_3.9.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycryptodome_3.9.0.bb => python3-pycryptodome_3.9.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index 113e811b1..50ffd0a66 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
 
-SRC_URI[md5sum] = "97ee98c95f350927bcc0e937976f17ee"
-SRC_URI[sha256sum] = "dbeb08ad850056747aa7d5f33273b7ce0b9a77910604a1be7b7a6f2ef076213f"
+SRC_URI[md5sum] = "c4e53f9ed33ca883b18249b9e1546251"
+SRC_URI[sha256sum] = "39ddc3c493125494572e0beefa8e8e6a43369e93c3c3e163cb871b37c1c62fba"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.9.0.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycryptodome_3.9.0.bb
rename to meta-python/recipes-devtools/python/python-pycryptodome_3.9.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.0.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycryptodome_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pycryptodome_3.9.3.bb
-- 
2.20.1




