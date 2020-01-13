Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E65897FCE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708552"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 39B0E49E931C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:13 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:19 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:09:22 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:00:56 -0800
Message-ID: <1578895261-30411-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 39B0E49E931C.A3DFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libburn: upgrade 1.5.0 -> 1.5.2
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:20 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libburn/{libburn_1.5.0.bb => libburn_1.5.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libburn/{libburn_1.5.0.bb => libburn_1.5.2.bb} (68%)

diff --git a/meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb b/meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb
similarity index 68%
rename from meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb
rename to meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb
index 612000e67..73e8e3f56 100644
--- a/meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb
+++ b/meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "b32edefdd9a978edc65aacddfe7c588a"
-SRC_URI[sha256sum] = "582b12c236c1365211946f2fe3c254976af37bbec244051f7742a98ded9be2bd"
+SRC_URI[md5sum] = "096f4acfba00f1210a84fb7650f7693d"
+SRC_URI[sha256sum] = "7b32db1719d7f6516cce82a9d00dfddfb3581725db732ea87d41ea8ef0ce5227"
 
 inherit autotools pkgconfig
-- 
2.17.1




