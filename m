Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4FA74F13
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:35:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44439477"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2018 17:35:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A16EE4B6EC99
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 17:35:32 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 4 Sep 2018 17:35:31 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Sep 2018 17:35:29 +0800
Message-ID: <20180904093529.31141-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: A16EE4B6EC99.A11F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] ipc-run: 0.96 -> 0.99
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
X-List-Received-Date: Tue, 04 Sep 2018 09:35:32 -0000
Content-Type: text/plain

Upgrade ipc-run from 0.96 to 0.99

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/perl/{ipc-run_0.96.bb => ipc-run_0.99.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_0.96.bb => ipc-run_0.99.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_0.96.bb b/meta-oe/recipes-devtools/perl/ipc-run_0.99.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_0.96.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_0.99.bb
index 08c966d..3e9a2a9 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_0.96.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_0.99.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git"
-SRCREV = "96066366ac8c401dff9c979d04f25dc8219ffcc1"
+SRCREV = "5b990b641a73eb0bc1e2b4c19daeef390d4d797a"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




