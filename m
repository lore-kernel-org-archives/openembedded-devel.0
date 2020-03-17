Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B87E60C66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 02:41:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86439601"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:41:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C765A50A9984
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 10:31:02 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:41:04 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 10:41:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 10:43:31 +0800
Message-ID: <20200317024331.31653-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C765A50A9984.A726B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] gsoap: upgrade 2.8.95 -> 2.8.99
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
X-List-Received-Date: Tue, 17 Mar 2020 02:41:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gsoap/{gsoap_2.8.95.bb => gsoap_2.8.99.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.95.bb => gsoap_2.8.99.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb
index 22a049892..a5535ee91 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.99.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "88031646018d60857f21246962d10011"
-SRC_URI[sha256sum] = "fe07aa152cd946ef8ebd3f87653f14c1d38efe7c6e6fce8c6f773c4814f79baf"
+SRC_URI[md5sum] = "9bba04cf88211762ee4cf35e03c65662"
+SRC_URI[sha256sum] = "c1c99a64eecf96cfd781a611171b58a39326f5811eb98c619aa7c54ec7bcc84b"
 
 inherit autotools
 
-- 
2.20.1




