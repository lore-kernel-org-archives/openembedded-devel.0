Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A5DE17FBCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:30:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="77574335"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 15:30:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C4774CE151C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:22:32 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 28 Oct 2019 15:30:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 15:30:44 +0800
Message-ID: <20191028073044.3005-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2C4774CE151C.A7F22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] xmlsec1: upgrade 1.2.28 -> 1.2.29
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
X-List-Received-Date: Mon, 28 Oct 2019 07:30:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.28.bb => xmlsec1_1.2.29.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.28.bb => xmlsec1_1.2.29.bb} (93%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.28.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
similarity index 93%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.28.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
index 0a4c56aa0..40c585ee1 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.28.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://run-ptest \
     "
 
-SRC_URI[md5sum] = "69b8d95c009a404462e19f335e650241"
-SRC_URI[sha256sum] = "13eec4811ea30e3f0e16a734d1dbf7f9d246a71d540b48d143a07b489f6222d4"
+SRC_URI[md5sum] = "4755621ff2a7150e208de6bd7decca10"
+SRC_URI[sha256sum] = "b1d1deba966019930f608d1f2b95c40ca3450f1393bcd3a3c001a8ba1d2839ab"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.20.1




