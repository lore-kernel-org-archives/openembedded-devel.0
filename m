Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C7758772CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:46:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14060992"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2016 22:45:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 24073477B1C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 22:45:49 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 19 Dec 2016 22:45:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Dec 2016 14:45:34 -0800
Message-ID: <1482187534-12314-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 24073477B1C5.A42B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] python-pygobject: 3.20.1 -> 3.22.0
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
X-List-Received-Date: Mon, 19 Dec 2016 14:46:14 -0000
Content-Type: text/plain

Upgrade python-pygobject from 3.20.1 to 3.22.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-pygobject_3.20.1.bb => python-pygobject_3.22.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.20.1.bb => python-pygobject_3.22.0.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
index e490ae5..56691aa 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "4354c6283b135f859563b72457f6a321"
-SRC_URI[sha256sum] = "3d261005d6fed6a92ac4c25f283792552f7dad865d1b7e0c03c2b84c04dbd745"
+SRC_URI[md5sum] = "ed4117ed5d554d25fd7718807fbf819f"
+SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8a5cbe7"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




