Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7654E731C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9954366"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 10:29:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B019942BC503
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:29:51 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 10:29:50 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 22:29:48 -0400
Message-ID: <1471314588-1499-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: B019942BC503.A47B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dialog: 1.2-20150920 -> 1.3-20160424
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
X-List-Received-Date: Tue, 16 Aug 2016 02:29:56 -0000
Content-Type: text/plain

Upgrade dialog from 1.2-20150920 to 1.3-20160424.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.2-20150920.bb => dialog_1.3-20160424.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.2-20150920.bb => dialog_1.3-20160424.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb
index 6fef9d6..2d8fbae 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.2-20150920.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb
@@ -8,8 +8,8 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "2b7c002b0a88ce1e0014af34b6b1ebdc"
-SRC_URI[sha256sum] = "c4e61ec5768701683dd4b5b2ebd8a31e6289fa6a1f5801e4b481085650698c05"
+SRC_URI[md5sum] = "582d804252205f73df2d892ebdc5212e"
+SRC_URI[sha256sum] = "47f5870876e778aa2902f2e91b4070418d4651b647e1a67a94127cb8aab5b5eb"
 
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
           "
-- 
2.7.4




