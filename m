Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 97C7A6612D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:10:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10033528"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 14:10:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 31CB442BC500
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:10:12 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 14:10:11 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 02:09:47 -0400
Message-ID: <1471500587-1781-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 31CB442BC500.A277F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libedit: 20150325-3.1 -> 20160618-3.1
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
X-List-Received-Date: Thu, 18 Aug 2016 06:10:14 -0000
Content-Type: text/plain

Upgrade libedit from 20150325-3.1 to 20160618-3.1.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../libedit/{libedit_20150325-3.1.bb => libedit_20160618-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20150325-3.1.bb => libedit_20160618-3.1.bb} (78%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb
similarity index 78%
rename from meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb
index 4a72896..bda421d 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb
@@ -16,5 +16,5 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "43cdb5df3061d78b5e9d59109871b4f6"
-SRC_URI[sha256sum] = "c88a5e4af83c5f40dda8455886ac98923a9c33125699742603a88a0253fcc8c5"
+SRC_URI[md5sum] = "b6e60f326a3fce91bea1a6fe4700af58"
+SRC_URI[sha256sum] = "b6b159c0c6ec8a7f349ea2a75d8b960efa346c462c1ac4921f1ac0de85a9f5d6"
-- 
2.7.4




