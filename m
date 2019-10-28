Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5F07F9BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:29:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="77574252"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 15:29:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BCC3E4CE150E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:21:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 28 Oct 2019 15:29:25 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 23:23:39 +0800
Message-ID: <1572276219-125218-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BCC3E4CE150E.A8615
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] keepalived: upgrade 2.0.16 -> 2.0.19
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
X-List-Received-Date: Mon, 28 Oct 2019 07:29:24 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../keepalived/{keepalived_2.0.16.bb => keepalived_2.0.19.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.0.16.bb => keepalived_2.0.19.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.19.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.0.19.bb
index 5257c5c..08182b1 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.19.bb
@@ -11,8 +11,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[md5sum] = "03f202eace2ad392c61ced15bb710e24"
-SRC_URI[sha256sum] = "f0c7dc86147a286913c1c2c918f557735016285d25779d4d2fce5732fcb888df"
+SRC_URI[md5sum] = "df670e0904d4e48e72ccc8409ad9c6de"
+SRC_URI[sha256sum] = "0e2f8454765bc6a5fa26758bd9cec18aae42882843cdd24848aff0ae65ce4ca7"
 
 DEPENDS = "libnfnetlink openssl"
 
-- 
2.7.4




