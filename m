Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A1A8673237
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:14:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99016551"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 14:18:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T6CpqB032468
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:12:51 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 14:14:41 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 10:14:38 -0400
Message-ID: <1438179278-4084-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH] iceauth: upgrade 1.0.6 -> 1.0.7
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
X-List-Received-Date: Wed, 29 Jul 2015 06:14:48 -0000
Content-Type: text/plain

From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>

Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{iceauth_1.0.6.bb => iceauth_1.0.7.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{iceauth_1.0.6.bb => iceauth_1.0.7.bb} (69%)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb
similarity index 69%
rename from meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb
index 22007d9..f40dec8 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb
@@ -11,5 +11,6 @@ BBCLASSEXTEND = "native"
 
 DEPENDS += "libice"
 
-SRC_URI[md5sum] = "2527344acc60741a709f4858564c5ae6"
-SRC_URI[sha256sum] = "bd990837353b439e6f45d478a87b8dbfa3f67d72d903e7a9ed4eb8de52f2e2f4"
+SRC_URI[md5sum] = "25dab02f8e40d5b71ce29a07dc901b8c"
+SRC_URI[sha256sum] = "1216af2dee99b318fcf8bf9a259915273bcb37a7f1e7859af4f15d0ebf6f3f0a"
+
-- 
1.8.4.2


