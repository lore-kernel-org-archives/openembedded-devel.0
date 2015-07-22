Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E5EC873CB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 09:02:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98719403"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2015 17:05:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6M90BFO029284
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 17:00:12 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 22 Jul 2015 17:01:59 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 17:01:55 +0800
Message-ID: <1437555715-1916-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libconfig: upgrade 1.4.9 -> 1.5
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
X-List-Received-Date: Wed, 22 Jul 2015 09:02:04 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../libconfig/{libconfig_1.4.9.bb => libconfig_1.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libconfig/{libconfig_1.4.9.bb => libconfig_1.5.bb} (73%)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
similarity index 73%
rename from meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
rename to meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index 22eecf8..fb6e50e 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -10,5 +10,5 @@ SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
-SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
+SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
+SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
-- 
1.8.4.2


