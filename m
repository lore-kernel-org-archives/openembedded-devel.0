Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4C9731ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:02:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2310453"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2016 13:02:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F0B7E45DEE10
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:01:56 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 7 Jan 2016 13:01:56 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 21:01:38 -0800
Message-ID: <1452142898-841-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: F0B7E45DEE10.AF5D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-networking][PATCH] postfix: 3.0.2 -> 3.0.3
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
X-List-Received-Date: Thu, 07 Jan 2016 05:02:06 -0000
Content-Type: text/plain

Upgrade postfix from 3.0.2 to 3.0.3.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/postfix/{postfix_3.0.2.bb => postfix_3.0.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.0.2.bb => postfix_3.0.3.bb} (12%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
similarity index 12%
rename from meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
index c722658..7104a9d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.0.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
@@ -1,4 +1,4 @@
 require postfix.inc
 
-SRC_URI[md5sum] = "d1dc2c23011c222129db3d91aa4f312a"
-SRC_URI[sha256sum] = "68256314202f5f0f24022d64f7ac664d28fa1394d07c84a37c3fc7a2d040be80"
+SRC_URI[md5sum] = "61caffae689c11d09b4c972a394ae3b1"
+SRC_URI[sha256sum] = "401e46ec3450569dcce60d1d8ca22a19ab1f7f817b0cc730cdf4875ba608ac02"
-- 
1.9.1




