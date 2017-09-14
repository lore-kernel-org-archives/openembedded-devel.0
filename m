Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 660D9783A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 01:58:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,390,1500912000"; d="scan'208";a="26250050"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 09:58:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C675846BA6A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:58:33 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 09:58:32 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 09:58:29 +0800
Message-ID: <1505354318-33200-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: C675846BA6A5.A5483
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] daemontools: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 01:58:38 -0000
Content-Type: text/plain

From: Bian Yaqin <bianyq@cn.fujitsu.com>

Signed-off-by: Bian Yaqin <bianyq@cn.fujitsu.com>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index def58db..84e9bca 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -1,4 +1,5 @@
 SUMMARY = "DJB daemontools"
+HOMEPAGE = "http://cr.yp.to/daemontools.html"
 DESCRIPTION = "supervise monitors a service. It starts the service and restarts the \
 service if it dies. The companion svc program stops, pauses, or restarts \
 the service on sysadmin request. The svstat program prints a one-line \
-- 
2.7.4




