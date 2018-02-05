Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18CA971C69
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 05:41:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36779444"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Feb 2018 13:41:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E7B249F19B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 13:41:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:41:07 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:40:48 +0800
Message-ID: <1517809249-7183-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 6E7B249F19B0.A7D4A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ipc-run: 0.94 -> 0.96
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
X-List-Received-Date: Mon, 05 Feb 2018 05:41:10 -0000
Content-Type: text/plain

Upgrade ipc-run from 0.94 to 0.96.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/perl/{ipc-run_0.94.bb => ipc-run_0.96.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_0.94.bb => ipc-run_0.96.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_0.94.bb b/meta-oe/recipes-devtools/perl/ipc-run_0.96.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_0.94.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_0.96.bb
index 3b58939..08c966d 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_0.94.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_0.96.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git"
-SRCREV = "6bdf41e276e06d23e140783b13a6eaef4745c216"
+SRCREV = "96066366ac8c401dff9c979d04f25dc8219ffcc1"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




