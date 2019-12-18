Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D62B27FEB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 07:58:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,328,1571673600"; d="scan'208";a="80458757"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2019 15:58:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A48E4CE1C9E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 15:49:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Dec 2019 15:58:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Dec 2019 05:27:36 -0800
Message-ID: <1576675656-32410-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576675656-32410-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1576675656-32410-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3A48E4CE1C9E.A89F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] kea: upgrade 1.7.0 -> 1.7.2
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
X-List-Received-Date: Wed, 18 Dec 2019 07:58:34 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.0.bb => kea_1.7.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.0.bb => kea_1.7.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.2.bb
index 105ba10d7..6f0a7c9cf 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "c6406ac3d160161056d2fc36557ebd89"
-SRC_URI[sha256sum] = "173c8e893690a611bc1d1c6fbe54a5c20fcd54429399a8dc3a0d7d2eb01bf8cc"
+SRC_URI[md5sum] = "38ed9af438a79ce4584b0ffea6813d26"
+SRC_URI[sha256sum] = "e43fb0079cb344ae4dec7cafb8d85f75440a228ff88d742a0033315cc8a7b0ca"
 
 inherit autotools systemd
 
-- 
2.17.1




