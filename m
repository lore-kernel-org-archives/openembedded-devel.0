Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 296B1788A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 01:26:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37311897"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2018 09:26:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 544CF48AE765
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 09:26:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 28 Feb 2018 09:26:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Feb 2018 09:26:11 +0800
Message-ID: <1519781171-1889-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 544CF48AE765.A7EB2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] nano: 2.7.4 -> 2.9.3
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
X-List-Received-Date: Wed, 28 Feb 2018 01:26:27 -0000
Content-Type: text/plain

Upgrade nano form 2.7.4 to 2.9.3.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/nano_2.7.4.bb | 4 ----
 meta-oe/recipes-support/nano/nano_2.9.3.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb
 create mode 100644 meta-oe/recipes-support/nano/nano_2.9.3.bb

diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb b/meta-oe/recipes-support/nano/nano_2.7.4.bb
deleted file mode 100644
index eaf393e..0000000
--- a/meta-oe/recipes-support/nano/nano_2.7.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include nano.inc
-
-SRC_URI[md5sum] = "c011c7f9e47cb1da27d4e7cc8b56ec6a"
-SRC_URI[sha256sum] = "752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9"
diff --git a/meta-oe/recipes-support/nano/nano_2.9.3.bb b/meta-oe/recipes-support/nano/nano_2.9.3.bb
new file mode 100644
index 0000000..afb0cf2
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano_2.9.3.bb
@@ -0,0 +1,4 @@
+include nano.inc
+
+SRC_URI[md5sum] = "6dd37f010d6a985bf0e5f8ed091ff919"
+SRC_URI[sha256sum] = "7783bcfd4b2d5dc0bf64d4bd07b1a19e7ba3c91da881a4249772a36b972d4012"
-- 
2.7.4




