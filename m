Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBA23601F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:28:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99017016"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 14:32:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T6QiMZ000772
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:26:44 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 14:28:35 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 10:28:32 -0400
Message-ID: <1438180112-4185-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH] dracut: upgrade 38 -> 43
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
X-List-Received-Date: Wed, 29 Jul 2015 06:28:37 -0000
Content-Type: text/plain

From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>

Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 77c137c..65a5515 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -5,10 +5,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "038"
+PV = "043"
 
-# v038 tag
-SRCREV = "267a109a81715c8957f14659593deb7b6255d40e"
+# v043 tag
+SRCREV = "eab03540cd695d940062af5b55c02e8829aaa526"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
-- 
1.8.4.2


