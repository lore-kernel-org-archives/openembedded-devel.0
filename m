Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE716AB99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:37:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97854926"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2015 15:41:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5T7ZQAI016189
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:35:26 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 29 Jun 2015 15:37:05 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2015 15:36:49 +0800
Message-ID: <1435563409-1616-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-oe][PATCH] sg3-utils: 1.38 -> 1.40
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jun 2015 07:37:08 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../sg3-utils/{sg3-utils_1.38.bb => sg3-utils_1.40.bb}               | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.38.bb => sg3-utils_1.40.bb} (77%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb
similarity index 77%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb
index 5ce11b6..754e03f 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.40.bb
@@ -9,8 +9,9 @@ LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
-SRC_URI[md5sum] = "e532a3d6648c422347f6d84cac469263"
-SRC_URI[sha256sum] = "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5d7c12ce652ba38f1"
+
+SRC_URI[md5sum] = "4a74ed491b0891fc60cd91d2b5d68331"
+SRC_URI[sha256sum] = "44a9ecfd3af018fa9f3586067a8fa5f4874451c3d773d74436d262a7e530ee83"
 
 inherit autotools-brokensep
 
-- 
1.8.4.2


