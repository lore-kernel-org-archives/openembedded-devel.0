Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB237FFE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:41:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75687393"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:41:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 168864CE14EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:41:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:41:21 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:40:55 +0900
Message-ID: <20190919034055.48614-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 168864CE14EB.A1C39
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libtevent: upgrade 0.10.0 -> 0.10.1
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
X-List-Received-Date: Thu, 19 Sep 2019 03:41:23 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../libtevent/{libtevent_0.10.0.bb => libtevent_0.10.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.10.0.bb => libtevent_0.10.1.bb} (93%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb
similarity index 93%
rename from meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb
index a581d3abf..f1b170daf 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "97ea9861252e52c24adf6c45ab676a60"
-SRC_URI[sha256sum] = "33f39612cd6d1ae6a737245784581494846f5bb07827983d2f41f942446aa4e6"
+SRC_URI[md5sum] = "1060eb69d6994a847eecb73c4d391ced"
+SRC_URI[sha256sum] = "79a4da68b38b86ac71d8ac824ee3605ab22a6a91cfa83033a7db73f3dd6910b6"
 
 inherit waf-samba
 
-- 
2.17.1




