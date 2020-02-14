Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BD273610BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:11:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,440,1574092800"; d="scan'208";a="83307825"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2020 00:11:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E739050A9969
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:01:56 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 15 Feb 2020 00:11:31 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 15 Feb 2020 00:11:33 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Feb 2020 15:43:43 -0800
Message-ID: <1581723823-21171-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E739050A9969.A1E0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libp11: upgrade 0.4.10 -> 11
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
X-List-Received-Date: Fri, 14 Feb 2020 16:11:31 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb} (93%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_11.bb
similarity index 93%
rename from meta-oe/recipes-support/libp11/libp11_0.4.10.bb
rename to meta-oe/recipes-support/libp11/libp11_11.bb
index 655db4907..5a0951df2 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
+++ b/meta-oe/recipes-support/libp11/libp11_11.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
+SRCREV = "e1210903291b1de9eabcad26e740a4b2fbcca692"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




