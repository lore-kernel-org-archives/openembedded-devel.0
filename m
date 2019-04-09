Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1BA7D450
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 02:05:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="58809488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2019 10:05:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DC104CD8109
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:05:32 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 9 Apr 2019 10:05:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2019 10:06:10 +0800
Message-ID: <20190409020610.22674-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 4DC104CD8109.A69F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xrefresh: upgrade 1.0.5 -> 1.0.6
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
X-List-Received-Date: Tue, 09 Apr 2019 02:05:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xrefresh_1.0.5.bb to xrefresh_1.0.6.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xrefresh_1.0.5.bb => xrefresh_1.0.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrefresh_1.0.5.bb => xrefresh_1.0.6.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb
index a2a4941e9..99dc3b5aa 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dad633bce9c3cd0e3abf72a16e0057cf"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "a896382bc53ef3e149eaf9b13bc81d42"
-SRC_URI[sha256sum] = "3213671b0a8a9d1e8d1d5d9e3fd86842c894dd9acc1be2560eda50bc1fb791d6"
+SRC_URI[md5sum] = "c56fa4adbeed1ee5173f464a4c4a61a6"
+SRC_URI[sha256sum] = "287dfb9bb7e8d780d07e672e3252150850869cb550958ed5f8401f0835cd6353"
-- 
2.20.1




