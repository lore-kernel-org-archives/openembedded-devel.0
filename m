Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 588507FCE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708562"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E9D14CE1CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:23 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:30 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:09:33 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:00:57 -0800
Message-ID: <1578895261-30411-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4E9D14CE1CB3.A3A87
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libdvdread: upgrade 6.0.1 -> 6.0.2
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:26 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libdvdread/{libdvdread_6.0.1.bb => libdvdread_6.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.0.1.bb => libdvdread_6.0.2.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb
index d68e792ba..2ca74f6da 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b9eeaaaf3c41b1c3cb6c1622e7219aeb"
-SRC_URI[sha256sum] = "28ce4f0063883ca4d37dfd40a2f6685503d679bca7d88d58e04ee8112382d5bd"
+SRC_URI[md5sum] = "49990935174bf6b2fa501e789c578135"
+SRC_URI[sha256sum] = "f91401af213b219cdde24b46c50a57f29301feb7f965678f1d7ed4632cc6feb0"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.17.1




