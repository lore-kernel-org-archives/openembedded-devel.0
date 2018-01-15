Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4F371B31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 03:34:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35305677"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2018 11:34:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AE4D0486A791
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 11:34:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 15 Jan 2018 11:34:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 11:34:40 +0800
Message-ID: <1515987280-32534-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: AE4D0486A791.A8C57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] quagga: 1.2.1 -> 1.2.2
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
X-List-Received-Date: Mon, 15 Jan 2018 03:34:20 -0000
Content-Type: text/plain

Update quagga from 1.2.1 to 1.2.2

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb | 4 ----
 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
deleted file mode 100644
index 4d43d7b..0000000
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require quagga.inc
-
-SRC_URI[md5sum] = "b1546de89062f7070d56e780b30be4b1"
-SRC_URI[sha256sum] = "aaddba5d4f41ed8e4c2f155f4584c993465d122c9096b5b52ada3fc75266fbcd"
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




