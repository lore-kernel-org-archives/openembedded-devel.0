Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDB676280
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105239"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3icN6018142
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:38 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:29 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:15 +0800
Message-ID: <1438314380-3834-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 3/8] xkbevd: upgrade 1.1.3 -> 1.1.4
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:30 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xkbevd_1.1.3.bb => xkbevd_1.1.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbevd_1.1.3.bb => xkbevd_1.1.4.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
index e81a3c9..a6fc9e7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "37ed71525c63a9acd42e7cde211dcc5b"
-SRC_URI[sha256sum] = "55b2484f9851112c2685d503b64b319f0f98fce74863ef735ecd52b52ceb0116"
+SRC_URI[md5sum] = "c747faf1f78f5a5962419f8bdd066501"
+SRC_URI[sha256sum] = "2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a"
-- 
1.8.4.2


