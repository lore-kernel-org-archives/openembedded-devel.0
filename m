Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7F560CD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 09:46:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83150277"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Feb 2020 17:37:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1CBE850A9974
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:27:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 11 Feb 2020 17:36:56 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 11 Feb 2020 17:37:03 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Feb 2020 09:21:31 -0800
Message-ID: <1581441693-85373-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1CBE850A9974.A1D15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wireshark: upgrade 3.2.0 -> 3.2.1
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
X-List-Received-Date: Tue, 11 Feb 2020 09:46:36 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.2.0.bb => wireshark_3.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.0.bb => wireshark_3.2.1.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb
index df46b3326..5f89ec812 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "259915adbbaded15de075afe7b4b03b6"
-SRC_URI[sha256sum] = "4cfd33a19a454ff4002243e9d04d6afd64280a109a21ae652a192f2be2b1b66c"
+SRC_URI[md5sum] = "e699b1e001c6303013791d81faf7727d"
+SRC_URI[sha256sum] = "589f640058d6408ebbd695a80ebbd6e7bd99d8db64ecda253d27100dfd27e85b"
 
 PE = "1"
 
-- 
2.17.1




