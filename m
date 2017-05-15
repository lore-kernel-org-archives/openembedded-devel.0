Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BB5586076F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 01:19:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18832993"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2017 09:18:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9481147C6122
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 09:18:56 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 15 May 2017 09:19:02 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 May 2017 09:18:37 +0800
Message-ID: <1494811117-755-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9481147C6122.A359E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] lvm2: 2.02.166 -> 2.02.171
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
X-List-Received-Date: Mon, 15 May 2017 01:19:10 -0000
Content-Type: text/plain

Upgrade lvm2 from 2.02.166 to 2.02.171.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lvm2/{lvm2_2.02.166.bb => lvm2_2.02.171.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.166.bb => lvm2_2.02.171.bb} (95%)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
similarity index 95%
rename from meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
index 7939f05..38c4414 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "c5a54ee0b86703daaad6e856439e115a"
-SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
+SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
+SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
 
 DEPENDS += "autoconf-archive-native"
 
-- 
2.7.4




