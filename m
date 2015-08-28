Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB4976420
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:39:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100121586"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2015 15:42:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7S7dEJk023253
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:39:15 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 28 Aug 2015 15:39:21 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Aug 2015 15:39:15 +0800
Message-ID: <1440747555-1672-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <B7D0F32E-EE42-4C5C-8AEF-85D1FA5165EB@gmail.com>
References: <B7D0F32E-EE42-4C5C-8AEF-85D1FA5165EB@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] postfix: 3.0.1 -> 3.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 07:39:28 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/postfix/{postfix_3.0.1.bb => postfix_3.0.2.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.0.1.bb => postfix_3.0.2.bb} (12%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb
similarity index 12%
rename from meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb
index 04b81c8..c722658 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb
@@ -1,5 +1,4 @@
 require postfix.inc
 
-
-SRC_URI[md5sum] = "3ec1416e7d4fba9566297c8fcf7a348c"
-SRC_URI[sha256sum] = "cd2bd6447fe3368bb1a39f482f8dd1eec87c63067a0eb75f9aec8e4eadd21328"
+SRC_URI[md5sum] = "d1dc2c23011c222129db3d91aa4f312a"
+SRC_URI[sha256sum] = "68256314202f5f0f24022d64f7ac664d28fa1394d07c84a37c3fc7a2d040be80"
-- 
1.8.4.2


