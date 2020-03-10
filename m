Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B64E861912
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 05:29:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,535,1574092800"; d="scan'208";a="86089633"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Mar 2020 13:29:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A43A406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 13:19:17 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 10 Mar 2020 13:29:09 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 10 Mar 2020 13:29:17 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Mar 2020 04:29:18 -0700
Message-ID: <1583839758-124554-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4A43A406AB15.A2375
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] kea: upgrade 1.7.4 -> 1.7.5
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
X-List-Received-Date: Tue, 10 Mar 2020 05:29:21 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.4.bb => kea_1.7.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.4.bb => kea_1.7.5.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.4.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.5.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.4.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.5.bb
index a2c97655a..38a256afd 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.4.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.5.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "d2d0e3ad8064a5e6f3ba1e970d39f9cc"
-SRC_URI[sha256sum] = "2b7f8d8cafdb9ad2be8df9aceb2de58c8f37c1544e47c28f05e84555d0015ef5"
+SRC_URI[md5sum] = "1f771e0209c9149bcf8fb91a25db03bf"
+SRC_URI[sha256sum] = "9b89b75cd8fd71e0ad7cb32c1b996177ba617bea2d162851eed42eea739e9999"
 
 inherit autotools systemd
 
-- 
2.17.1




