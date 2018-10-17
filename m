Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7D23D7458B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:42:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46233012"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:42:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 749DF4B69E01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:42:19 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:42:19 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:42:33 +0800
Message-ID: <20181017004233.8130-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20181017004233.8130-1-hongl.fnst@cn.fujitsu.com>
References: <20181017004233.8130-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 749DF4B69E01.A291D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] ipc-run: 0.99->20180523.0
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
X-List-Received-Date: Wed, 17 Oct 2018 00:42:24 -0000
Content-Type: text/plain

1.Upgrade ipc-run from 0.99 to 20180523.0

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/perl/{ipc-run_0.99.bb => ipc-run_20180523.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_0.99.bb => ipc-run_20180523.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_0.99.bb b/meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_0.99.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb
index 3e9a2a9..c812ae1 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_0.99.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git"
-SRCREV = "5b990b641a73eb0bc1e2b4c19daeef390d4d797a"
+SRCREV = "0b409702490729eeb97ae65f5b94d949ec083134"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




