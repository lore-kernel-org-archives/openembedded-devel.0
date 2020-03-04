Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA2196184F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:18:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,513,1574092800"; d="scan'208";a="85657989"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Mar 2020 18:18:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1D738406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:08:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 18:18:07 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Mar 2020 18:17:18 +0800
Message-ID: <1583317038-9789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1D738406AB15.A5C72
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wireshark: upgrade 3.2.1 -> 3.2.2
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
X-List-Received-Date: Wed, 04 Mar 2020 10:18:12 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.2.1.bb => wireshark_3.2.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.1.bb => wireshark_3.2.2.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
index 5f89ec812..b2bcf5fd9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e699b1e001c6303013791d81faf7727d"
-SRC_URI[sha256sum] = "589f640058d6408ebbd695a80ebbd6e7bd99d8db64ecda253d27100dfd27e85b"
+SRC_URI[md5sum] = "e468b78e1176e0212b13ef809f59dcbb"
+SRC_URI[sha256sum] = "5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208feeded79"
 
 PE = "1"
 
-- 
2.17.1




