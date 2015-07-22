Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AC86375791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:49:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98718857"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2015 16:53:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6M8m5D1028327
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 16:48:05 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 22 Jul 2015 16:49:53 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 16:49:48 +0800
Message-ID: <1437554988-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] iw: upgrade 3.15 -> 4.1
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
X-List-Received-Date: Wed, 22 Jul 2015 08:49:55 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/iw/{iw_3.15.bb => iw_4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/iw/{iw_3.15.bb => iw_4.1.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/iw/iw_3.15.bb b/meta-oe/recipes-connectivity/iw/iw_4.1.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/iw/iw_3.15.bb
rename to meta-oe/recipes-connectivity/iw/iw_4.1.bb
index 7800e90..e1e7c12 100644
--- a/meta-oe/recipes-connectivity/iw/iw_3.15.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_4.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
 "
 
-SRC_URI[md5sum] = "ebb16e6c29b075e3a58b99552583fd79"
-SRC_URI[sha256sum] = "1223ebab68dc337f16ed80c45af37b78f112ea091e919eafe96a4cbd63942081"
+SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
+SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9c8f33d"
 
 EXTRA_OEMAKE = ""
 
-- 
1.8.4.2


