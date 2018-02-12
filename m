Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4765478094
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 02:01:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36992094"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2018 10:01:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C57F148AE763
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 10:01:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 12 Feb 2018 10:01:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:01:05 +0800
Message-ID: <1518400865-17940-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: C57F148AE763.A6851
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tomoyo-tools: 20140601 -> 20170102
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
X-List-Received-Date: Mon, 12 Feb 2018 02:01:02 -0000
Content-Type: text/plain

Upgrade tomoyo-tools from 2.5.0-20140601 to 2.5.0-20170102.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
index 4a1b4ce..f362775 100644
--- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -5,9 +5,9 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20140601.tar.gz"
-SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
-SRC_URI[sha256sum] = "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
+SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20170102.tar.gz"
+SRC_URI[md5sum] = "888804d58742452fe213a68f7eadd0ad"
+SRC_URI[sha256sum] = "00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
2.7.4




