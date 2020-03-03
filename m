Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CD9EF61954
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:26:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488742"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:27:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 732CC406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:17:09 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:26:52 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:27:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:53 -0800
Message-ID: <1583236320-114088-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 732CC406AB15.A106F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] freeglut: upgrade 3.0.0 -> 3.2.1
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
X-List-Received-Date: Tue, 03 Mar 2020 05:27:00 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../freeglut/{freeglut_3.0.0.bb => freeglut_3.2.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/freeglut/{freeglut_3.0.0.bb => freeglut_3.2.1.bb} (78%)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
similarity index 78%
rename from meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
rename to meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
index 3b540bb78..851641c08 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
 SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "90c3ca4dd9d51cf32276bc5344ec9754"
-SRC_URI[sha256sum] = "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
+SRC_URI[md5sum] = "cd5c670c1086358598a6d4a9d166949d"
+SRC_URI[sha256sum] = "d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68"
 
 inherit cmake features_check
 
-- 
2.17.1




