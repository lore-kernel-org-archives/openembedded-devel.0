Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 780B8731CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:12:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172168"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:12:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2864841887F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:11:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:11:54 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:11:53 -0800
Message-ID: <1451873513-5407-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 2864841887F3.AC3A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] lemon: 3.5.4 -> 3.7.3
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
X-List-Received-Date: Mon, 04 Jan 2016 02:12:14 -0000
Content-Type: text/plain

Upgrade lemon from 3.5.4 to 3.7.3.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb | 7 -------
 meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb
 create mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb

diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb b/meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb
deleted file mode 100644
index 7df47d4..0000000
--- a/meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require lemon.inc
-
-LIC_FILES_CHKSUM = "file://lemon.c;endline=8;md5=c7551a78fa3fdecd96d1ad6761d205ee"
-
-SRC_URI[md5sum] = "f17da840eed792e896c3408d0ce97718"
-SRC_URI[sha256sum] = "47daba209bd3bcffa1c5fcd5fdfc4f524eae619b4fa855aeeb1bbbc8bd2bb04f"
-
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb b/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
new file mode 100644
index 0000000..354db17
--- /dev/null
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
@@ -0,0 +1,7 @@
+require lemon.inc
+
+LIC_FILES_CHKSUM = "file://lemon.c;endline=8;md5=c7551a78fa3fdecd96d1ad6761d205ee"
+
+SRC_URI[md5sum] = "5437978aae90350cf984993091e0d695"
+SRC_URI[sha256sum] = "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e4b6cdfb271309ef6"
+
-- 
1.9.1




