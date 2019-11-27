Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F310D7F978
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:26:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,248,1571673600"; d="scan'208";a="79144830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 16:26:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DAA04B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:18:33 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 27 Nov 2019 16:26:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Nov 2019 16:27:42 +0800
Message-ID: <20191127082742.9771-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9DAA04B6EC86.A91CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libmicrohttpd: upgrade 0.9.67 -> 0.9.68
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
X-List-Received-Date: Wed, 27 Nov 2019 08:27:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libmicrohttpd_0.9.67.bb => libmicrohttpd_0.9.68.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.67.bb => libmicrohttpd_0.9.68.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb
index c400462e0..f5569de9f 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb
@@ -8,8 +8,8 @@ DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "e28e04e3d3eca62f5754efb844d17812"
-SRC_URI[sha256sum] = "7e1f852723d099d4827d7ebde4d02dd00fd8da62149526fdb9fae058c5a60495"
+SRC_URI[md5sum] = "1c3ca3bf92dfc680538b4186c58a9bd0"
+SRC_URI[sha256sum] = "c5716e2a2899abc9e16c8fa7a1a58da88f81aca96a0b7e68a5d4d89e21610b61"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.20.1




