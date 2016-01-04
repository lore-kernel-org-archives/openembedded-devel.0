Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3610B731D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:10:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172073"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:10:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 656A241887EC;
	Mon,  4 Jan 2016 10:10:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:10:03 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:09:51 -0800
Message-ID: <1451873391-5142-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 656A241887EC.AE630
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Li Xin <lixin2015.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] dialog: 1.2-20150528 -> 1.2-20150920
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
X-List-Received-Date: Mon, 04 Jan 2016 02:10:22 -0000
Content-Type: text/plain

From: Li Xin <lixin2015.fnst@cn.fujitsu.com>

Upgrade dialog from 1.2-20150528 to 1.2-20150920.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.2-20150528.bb => dialog_1.2-20150920.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.2-20150528.bb => dialog_1.2-20150920.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb b/meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb
index 4fb938e..6fef9d6 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.2-20150528.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb
@@ -8,8 +8,8 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "593615fb448e001e5b81420473a7354b"
-SRC_URI[sha256sum] = "a8cd7a66bdb41e53a3145cbb0eb370c5ce7300fe0e9ad6d3e8d3b9e16ff16418"
+SRC_URI[md5sum] = "2b7c002b0a88ce1e0014af34b6b1ebdc"
+SRC_URI[sha256sum] = "c4e61ec5768701683dd4b5b2ebd8a31e6289fa6a1f5801e4b481085650698c05"
 
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
           "
-- 
1.9.1




