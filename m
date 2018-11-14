Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3A76C3ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 07:54:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAE7sfoQ018868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2018 23:54:42 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 13 Nov 2018 23:54:29 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Nov 2018 23:54:29 -0800
Message-ID: <20181114075429.115049-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libestr: Upgrade to 0.1.11
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
X-List-Received-Date: Wed, 14 Nov 2018 07:54:42 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libestr/{libestr_0.1.10.bb => libestr_0.1.11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libestr/{libestr_0.1.10.bb => libestr_0.1.11.bb} (71%)

diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.10.bb b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
similarity index 71%
rename from meta-oe/recipes-support/libestr/libestr_0.1.10.bb
rename to meta-oe/recipes-support/libestr/libestr_0.1.11.bb
index abce8f3d3..ff61dd8fd 100644
--- a/meta-oe/recipes-support/libestr/libestr_0.1.10.bb
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9d6c993486c18262afba4ca5bcb894d0"
 
 SRC_URI = "http://libestr.adiscon.com/files/download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "f4c9165a23587e77f7efe65d676d5e8e"
-SRC_URI[sha256sum] = "bd655e126e750edd18544b88eb1568d200a424a0c23f665eb14bbece07ac703c"
+SRC_URI[md5sum] = "1f25a2332750d4bfacfb314235fedff0"
+SRC_URI[sha256sum] = "46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024"
 
 UPSTREAM_CHECK_URI = "http://libestr.adiscon.com/download/"
 
-- 
2.17.1


