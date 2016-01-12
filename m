Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA64F65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:44:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2474827"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 09:44:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D5F49418910C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:44:04 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 09:44:04 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jan 2016 17:43:49 -0800
Message-ID: <1452563029-31638-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: D5F49418910C.ACF60
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] networkmanager: 1.0.6 -> 1.0.10
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
X-List-Received-Date: Tue, 12 Jan 2016 01:44:25 -0000
Content-Type: text/plain

Upgrade networkmanager from 1.0.6 to 1.0.10.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../{networkmanager_1.0.6.bb => networkmanager_1.0.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.6.bb => networkmanager_1.0.10.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index c2b00ed..81ce953 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
 "
-SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
-SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
+SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
+SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
1.9.1




