Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9F1061954
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:44:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85489769"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:43:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A0F6B50A997F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:34:09 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:43:58 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:44:06 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 04:10:22 -0800
Message-ID: <1583237422-114479-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A0F6B50A997F.A485B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] renderdoc: upgrade 1.5 -> 1.6
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
X-List-Received-Date: Tue, 03 Mar 2020 05:44:02 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../renderdoc/{renderdoc_1.5.bb => renderdoc_1.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.5.bb => renderdoc_1.6.bb} (89%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb
similarity index 89%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb
index 5f81e841d..7cb79d070 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb
@@ -2,9 +2,9 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9753b1b4fba3261c27d1ce5c1acef667"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=df7ea9e196efc7014c124747a0ef9772"
 
-SRCREV = "a94f238e37cfe2f142093eb8e5da7775abaa88c6"
+SRCREV = "0e7f772596035137416be01766c2d61205efc63e"
 SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
 	   file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
 	   file://0001-Remove-glslang-pool_allocator-setAllocator.patch \
-- 
2.17.1




