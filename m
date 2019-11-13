Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1568E7D6B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 05:38:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78395346"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 13:38:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CCF1E4CE1BE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:30:28 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 13:38:38 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2019 13:39:11 +0800
Message-ID: <20191113053911.13168-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CCF1E4CE1BE7.AA506
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems] [PATCH] fuse3: upgrade 3.7.0 -> 3.8.0
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
X-List-Received-Date: Wed, 13 Nov 2019 05:38:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.7.0.bb => fuse3_3.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.7.0.bb => fuse3_3.8.0.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb
index f0cbf12a9..b5bbe042a 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "b9e6558aa25f66c0f1a95d1c7455b944"
-SRC_URI[sha256sum] = "3aea4766da5e2751aba82e8f77047d5d3c412bc3c298e4ec9532e59d7bd73a7a"
+SRC_URI[md5sum] = "f184004cd3724f579cd602fa5232681b"
+SRC_URI[sha256sum] = "4a464f6df782a1dca1f7e85bf64ff6ece9547b389557aae4160371cb1c898d61"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.20.1




