Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFF67FC2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:56:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="79868660"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Dec 2019 16:56:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A7014CE1CB0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:47:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019 16:56:14 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Dec 2019 06:58:02 -0800
Message-ID: <1575903483-113548-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575903483-113548-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575903483-113548-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7A7014CE1CB0.A6E84
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wireshark: upgrade 3.0.6 -> 3.0.7
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
X-List-Received-Date: Mon, 09 Dec 2019 08:56:10 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.0.6.bb => wireshark_3.0.7.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.7.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb
index ccaa0c9..a401b54 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.7.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
-SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
+SRC_URI[md5sum] = "5b486f20239545c5af1db614c0d98876"
+SRC_URI[sha256sum] = "3b2b279017753398b8d5deb440db5f98a205eea35f9417e5fa2893947e7992f2"
 
 PE = "1"
 
-- 
2.7.4




