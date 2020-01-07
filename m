Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0047FD72
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:09:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81428993"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:09:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 27C3E406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:00:34 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:09:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:09:39 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:10 -0800
Message-ID: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 27C3E406AB15.A25A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wireshark: upgrade 3.0.7 -> 3.2.0
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
X-List-Received-Date: Tue, 07 Jan 2020 09:09:40 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.0.7.bb => wireshark_3.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.7.bb => wireshark_3.2.0.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb
index a401b5431..412d6d7d6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "5b486f20239545c5af1db614c0d98876"
-SRC_URI[sha256sum] = "3b2b279017753398b8d5deb440db5f98a205eea35f9417e5fa2893947e7992f2"
+SRC_URI[md5sum] = "259915adbbaded15de075afe7b4b03b6"
+SRC_URI[sha256sum] = "4cfd33a19a454ff4002243e9d04d6afd64280a109a21ae652a192f2be2b1b66c"
 
 PE = "1"
 
-- 
2.17.1




