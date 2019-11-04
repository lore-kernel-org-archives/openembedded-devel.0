Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0C377D185
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 02:09:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,265,1569254400"; d="scan'208";a="77871904"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 10:09:28 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1DFF94CE1519
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 10:01:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 4 Nov 2019 10:09:27 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2019 13:49:02 +0800
Message-ID: <1572846542-117839-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1DFF94CE1519.A86BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] mdns: upgrade 878.200.35 -> 878.260.1
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
X-List-Received-Date: Mon, 04 Nov 2019 02:09:29 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-protocols/mdns/{mdns_878.200.35.bb => mdns_878.260.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_878.200.35.bb => mdns_878.260.1.bb} (95%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb b/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
similarity index 95%
rename from meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
rename to meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
index 1353b2b..0178945 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
            file://build.patch;patchdir=.. \
            file://mdns.service \
            "
-SRC_URI[md5sum] = "e773f290a7d29f1072247985d6add2ff"
-SRC_URI[sha256sum] = "e777b4d7dbf5eb1552cb80090ad1ede319067ab6e45e3990d68aabf6e8b3f5a0"
+SRC_URI[md5sum] = "aeb92d838a4aa2402ef128ed501484eb"
+SRC_URI[sha256sum] = "3cc71582e8eee469c2de8ecae1d769e7f32b3468dfb7f2ca77f1dee1f30a7d1e"
 
 PARALLEL_MAKE = ""
 
-- 
2.7.4




