Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BBD987FDB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:09:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81428996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:09:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5CF0149E932C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:00:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:09:42 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:09:49 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:13 -0800
Message-ID: <1578403399-45535-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 5CF0149E932C.A3690
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] iozone3: upgrade 487 -> 488
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
X-List-Received-Date: Tue, 07 Jan 2020 09:09:44 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iozone3/{iozone3_487.bb => iozone3_488.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_487.bb => iozone3_488.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_487.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_487.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
index 42864bead..5885b145e 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_487.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "2dbe035caf99c5367625352e158bb866"
-SRC_URI[sha256sum] = "2c488a7ccddd624fd557af16e71442c367b131d6178e1b4023bbd532bacdda59"
+SRC_URI[md5sum] = "d60a69e44cda8436f4f94d860958efc2"
+SRC_URI[sha256sum] = "960265163d93f15f7ad352f726d4837c5dd794fff357c743fdb56cbcf4abca04"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.17.1




