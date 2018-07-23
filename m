Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7024E74D0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:33:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42543812"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2018 17:33:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3775C4B66A23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:33:50 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 23 Jul 2018 17:33:49 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 17:33:24 +0800
Message-ID: <20180723093326.12122-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
References: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 3775C4B66A23.ACACF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] tslib: 1.15 -> 1.16
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
X-List-Received-Date: Mon, 23 Jul 2018 09:33:57 -0000
Content-Type: text/plain

Upgrade tslib from 1.15 to 1.16.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/tslib/{tslib_1.15.bb => tslib_1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.15.bb => tslib_1.16.bb} (96%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb b/meta-oe/recipes-graphics/tslib/tslib_1.16.bb
similarity index 96%
rename from meta-oe/recipes-graphics/tslib/tslib_1.15.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.16.bb
index 7ae941a3..8d23bd5 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.16.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
            file://ts.conf \
            file://tslib.sh \
 "
-SRC_URI[md5sum] = "9ff36788c9ab76a10b58422227b9629e"
-SRC_URI[sha256sum] = "7ce48807cab655076d71a1ceef3ed0ab8a25df98074981d4a8fd1477ee5f710c"
+SRC_URI[md5sum] = "254a022fc8aa89d164840fe8869c2441"
+SRC_URI[sha256sum] = "c9a54651337a701a66b074c603c313225579995a7910e519bbc7b1dcdab9a755"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
-- 
2.7.4




