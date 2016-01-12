Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6EC6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:40:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2477518"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 10:40:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 52FBC418914F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:40:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 10:40:41 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jan 2016 18:40:19 -0800
Message-ID: <1452566419-62203-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 52FBC418914F.ADB08
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-initramfs][PATCH] dracut: 043 -> 044
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
X-List-Received-Date: Tue, 12 Jan 2016 02:41:00 -0000
Content-Type: text/plain

Upgrade dracut from 043 to 044.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/dracut/dracut_git.bb          |  8 +++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index e026da7..0c7a8b9 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -5,11 +5,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "043+git${SRCREV}"
+PV = "044+git${SRCREV}"
 
-# v043 tag
-SRCREV = "eab03540cd695d940062af5b55c02e8829aaa526"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
+# v044 tag
+SRCREV = "1bc3e733f96033a508841e97fe08da7a12851782"
+SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1




