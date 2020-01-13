Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F09706B5C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708642"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D67204CE1CB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:56 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:10:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:01:01 -0800
Message-ID: <1578895261-30411-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D67204CE1CB4.A50D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] yad: upgrade 4.1 -> 5.0
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:59 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/yad/{yad_4.1.bb => yad_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/yad/{yad_4.1.bb => yad_5.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipes-graphics/yad/yad_5.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/yad/yad_4.1.bb
rename to meta-oe/recipes-graphics/yad/yad_5.0.bb
index c69f47dcd..e53c04bbc 100644
--- a/meta-oe/recipes-graphics/yad/yad_4.1.bb
+++ b/meta-oe/recipes-graphics/yad/yad_5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://github.com/v1cont/yad.git"
-SRCREV = "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
+SRCREV = "c8eac89cc20d915cb5ed185f423091a291c8af24"
 
 inherit autotools gsettings
 
-- 
2.17.1




