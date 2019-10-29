Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EACC37F61C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:17:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,242,1569254400"; d="scan'208";a="77611114"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 10:17:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E4994CE150E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:09:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 29 Oct 2019 10:17:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 10:17:11 +0800
Message-ID: <20191029021711.3388-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4E4994CE150E.A87F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] poppler: upgrade 0.80.0 -> 0.82.0
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
X-List-Received-Date: Tue, 29 Oct 2019 02:17:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../poppler/{poppler_0.80.0.bb => poppler_0.82.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.80.0.bb => poppler_0.82.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.80.0.bb b/meta-oe/recipes-support/poppler/poppler_0.82.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.80.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.82.0.bb
index 338af1d87..37f859353 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.80.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.82.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "8ff9964d1fcc9c334a9c66f6f426ab9c"
-SRC_URI[sha256sum] = "4d3ca6b79bc13b8e24092e34f83ef5f387f3bb0bbd7359a6c078e09c696d104f"
+SRC_URI[md5sum] = "4d6106c2382c5e66072e0b355acc3640"
+SRC_URI[sha256sum] = "234f8e573ea57fb6a008e7c1e56bfae1af5d1adf0e65f47555e1ae103874e4df"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.20.1




