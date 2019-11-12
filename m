Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BDC667F7B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 09:02:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,295,1569254400"; d="scan'208";a="78321192"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Nov 2019 17:02:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 26F8D4CE1507
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 16:54:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 12 Nov 2019 17:02:40 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2019 20:42:20 +0800
Message-ID: <1573562540-23097-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 26F8D4CE1507.A8577
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] f2fs-tools: Update Homepage
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
X-List-Received-Date: Tue, 12 Nov 2019 09:02:50 -0000
Content-Type: text/plain

Change homepage to git as the f2fs-tools is no longer maintained through sf.net.
Reference to https://sourceforge.net/projects/f2fs-tools/.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
index 870281b..98bd478 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for Flash-Friendly File System (F2FS)"
-HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
-- 
2.7.4




