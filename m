Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B2B4B71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:42:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46233008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:42:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 46F194B6ED68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:42:18 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:42:18 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:42:31 +0800
Message-ID: <20181017004233.8130-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 46F194B6ED68.A086C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-initramfs][PATCH] dracut: 048->049
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
X-List-Received-Date: Wed, 17 Oct 2018 00:42:20 -0000
Content-Type: text/plain

Upgrade dracut from 048 to 049.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 059e40a..dd2e8bb 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -6,10 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "048"
+PV = "049"
 
 # v048 tag
-SRCREV = "bc01f822de732d85d4bfc77bae44c6bd4abe43d7"
+SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            "
-- 
2.7.4




