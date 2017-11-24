Return-Path: <huangqy.fnst@cn.fujitsu.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Nov 2017 04:10:48 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B08EE7879C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:10:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30420222"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2017 12:00:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CA16D489C475
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 12:00:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 24 Nov 2017 12:00:47 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Nov 2017 12:00:49 +0800
Message-ID: <1511496049-796-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: CA16D489C475.A6A31
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] quagga: 1.2.1 -> 1.2.2
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
X-List-Received-Date: Fri, 24 Nov 2017 04:10:49 -0000
Content-Type: text/plain

Update quagga from 1.2.1 to 1.2.2

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
new file mode 100644
index 0000000..653f46b
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
@@ -0,0 +1,4 @@
+require quagga.inc
+
+SRC_URI[md5sum] = "e84be2938c26c0c872792090f1a6a866"
+SRC_URI[sha256sum] = "522e22f2beee64e3f0c2cde3d0155f3b8103f4f6fc8abef92cb40bc3a4cc2931"
-- 
2.7.4




