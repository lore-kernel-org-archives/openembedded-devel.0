Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B7B1876579
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105258"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3ikAs018166
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:46 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:37 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:19 +0800
Message-ID: <1438314380-3834-7-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 7/8] xterm: upgrade 303 -> 308
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:41 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_303.bb => xterm_308.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_303.bb => xterm_308.bb} (86%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb b/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
similarity index 86%
rename from meta-oe/recipes-graphics/xorg-app/xterm_303.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_308.bb
index cac40c9..9198ca2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=540cf18ccc16bc3c5f
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "48f6d49b2b6b6933d501d767cbed9254"
-SRC_URI[sha256sum] = "8af29987bda9b77205ebf6233aaa5c347e5f2407310b62ac9ba92a658257f058"
+SRC_URI[md5sum] = "1ec76c1a79a70de4f82c24c527ef4626"
+SRC_URI[sha256sum] = "c5bf7377a5bf35e34b7e3a4ab6c848fbc89e8901dd98f8b237662a72bdbfe372"
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-- 
1.8.4.2


