Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 24E647CB90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 03:32:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,413,1544457600"; d="scan'208";a="55248939"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2019 11:32:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 522C346BA6DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 11:32:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 26 Feb 2019 11:32:35 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Feb 2019 11:33:42 +0800
Message-ID: <20190226033342.4525-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 522C346BA6DE.AECC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] xwd: Upgrade to 1.0.7
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
X-List-Received-Date: Tue, 26 Feb 2019 03:32:25 -0000
Content-Type: text/plain

Upgrade xwd from 1.0.6 to 1.0.7

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwd_1.0.6.bb => xwd_1.0.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwd_1.0.6.bb => xwd_1.0.7.bb} (69%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb
similarity index 69%
rename from meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb
index 694bf57ac..1ad48b071 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb
@@ -7,5 +7,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
 DEPENDS = "libxmu libxkbfile"
 
-SRC_URI[md5sum] = "6b5d48464c5f366e91efd08b62b12d94"
-SRC_URI[sha256sum] = "3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79"
+SRC_URI[md5sum] = "11794a8eba6d295a192a8975287fd947"
+SRC_URI[sha256sum] = "cd6815b8b9e0b98e284d3d732fb12162159cb9dcee4f45a7d4c0bd8b308a6794"
-- 
2.17.2




