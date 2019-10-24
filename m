Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 68DE07F8F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:09:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,224,1569254400"; d="scan'208";a="77402256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 16:09:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4953C4CE1515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:01:49 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 16:09:43 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 24 Oct 2019 16:09:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 16:09:39 +0800
Message-ID: <1571904579-735-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 4953C4CE1515.A3899
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] multipath-tools: upgrade 0.8.2 -> 0.8.3
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
X-List-Received-Date: Thu, 24 Oct 2019 08:09:42 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{multipath-tools_0.8.2.bb => multipath-tools_0.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.2.bb => multipath-tools_0.8.3.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
index 06e78c7..358f0cb 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
@@ -47,7 +47,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "8a7e9b6648898f2c2d2bbd2d22871f79612e716e"
+SRCREV = "6c3bd369b23e959700527e0e2e6d5b2a1bd36294"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




