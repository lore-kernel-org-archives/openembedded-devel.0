Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFA67D458
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 02:01:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="58808992"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2019 10:01:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C3524CD8124
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:01:11 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 9 Apr 2019 10:01:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 10:01:48 +0800
Message-ID: <20190409020148.18446-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 5C3524CD8124.A776E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xrdb: upgrade 1.1.1 -> 1.2.0
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
X-List-Received-Date: Tue, 09 Apr 2019 02:01:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xrdb_1.1.1.bb to xrdb_1.2.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xrdb_1.1.1.bb => xrdb_1.2.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrdb_1.1.1.bb => xrdb_1.2.0.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb
rename to meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb
index e50c082d8..c5e0e88ed 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
 DEPENDS += "libxmu"
 
-SRC_URI[md5sum] = "96f9423eab4d0641c70848d665737d2e"
-SRC_URI[sha256sum] = "2d23ade7cdbb487996bf77cbb32cbe9bdb34d004748a53de7a4a97660d2217b7"
+SRC_URI[md5sum] = "34ae801ef994d192c70fcce2bdb2a1b2"
+SRC_URI[sha256sum] = "f23a65cfa1f7126040d68b6cf1e4567523edac10f8dc06f23d840d330c7c6946"
-- 
2.20.1




