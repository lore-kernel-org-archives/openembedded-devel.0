Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 41F2F7FDA4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:10:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81429007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:10:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C9A5B406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:00:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:09:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:10:05 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:16 -0800
Message-ID: <1578403399-45535-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C9A5B406AB15.A65F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libsigc++-2.0: upgrade 3.0.0 -> 3.0.2
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
X-List-Received-Date: Tue, 07 Jan 2020 09:10:02 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libsigc++-3_3.0.0.bb => libsigc++-3_3.0.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.0.bb => libsigc++-3_3.0.2.bb} (77%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
similarity index 77%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
index 3c0330f50..0acdb3e98 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "6ffe924f1d8624b5716468cde67dc03f"
-SRC_URI[sha256sum] = "50a0855c1eb26e6044ffe888dbe061938ab4241f96d8f3754ea7ead38ab8ed06"
+SRC_URI[md5sum] = "1f93f8ed4ead38e876157834b2c57c21"
+SRC_URI[sha256sum] = "4b77676de1e74774ec456bcc6ac6f04a2791a12cc1fe07f8305d4c3c86e2f339"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.17.1




