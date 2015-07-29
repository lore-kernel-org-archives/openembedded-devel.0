Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9AD7626C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:54:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027308"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 17:58:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T9qaqA016467
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 17:52:36 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 17:54:26 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 17:54:09 +0800
Message-ID: <1438163651-3294-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 2/4] setxkbmap: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Wed, 29 Jul 2015 09:54:30 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{setxkbmap_1.3.0.bb => setxkbmap_1.3.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.0.bb => setxkbmap_1.3.1.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
index 62a3ee2..8402753 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
@@ -15,5 +15,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "1001771344608e120e943a396317c33a"
-SRC_URI[sha256sum] = "3d305c9d1f38224169b2e501ef0665cc3ab52d4dbc2b9a60c9dbb047f77ddec6"
+SRC_URI[md5sum] = "2c47a1b8e268df73963c4eb2316b1a89"
+SRC_URI[sha256sum] = "a9ddb3963f263ba13f0ea105d8c45a531832140530217cc559587bb94f02d3e1"
-- 
1.8.4.2


