Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A7D5F7017D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 06:06:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14829409"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 14:06:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 321E547B0CAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 14:05:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 14:05:57 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 14:05:48 +0800
Message-ID: <1484633148-26691-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 321E547B0CAC.A5C58
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-requests: 2.12.0 -> 2.12.4
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
X-List-Received-Date: Tue, 17 Jan 2017 06:06:06 -0000
Content-Type: text/plain

Upgrade python-requests from 2.12.0 to 2.12.4.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-requests.inc               | 4 ++--
 .../python/{python-requests_2.12.0.bb => python-requests_2.12.4.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.12.0.bb => python-requests_2.12.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 9f851e4..847d484 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "d0d3e5fb81c6b4d87c08ed5cad677337"
-SRC_URI[sha256sum] = "57b6c314a2c5f014dce634a0e1eeeb1707741b2e30bc7fee9c5b01fa216d57a3"
+SRC_URI[md5sum] = "acdb48888a9d3c7309da12fc7f83fedb"
+SRC_URI[sha256sum] = "ed98431a0631e309bb4b63c81d561c1654822cb103de1ac7b47e45c26be7ae34"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-email \
diff --git a/meta-python/recipes-devtools/python/python-requests_2.12.0.bb b/meta-python/recipes-devtools/python/python-requests_2.12.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.12.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.12.4.bb
-- 
2.7.4




