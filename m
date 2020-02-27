Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 709A5611D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:01:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484407"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 14:01:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4282650A9975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:52:14 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 14:01:57 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 14:02:07 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:17 -0800
Message-ID: <1582807398-13955-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4282650A9975.A08CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libev: upgrade 4.27 -> 4.31
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
X-List-Received-Date: Thu, 27 Feb 2020 06:01:59 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libev/{libev_4.27.bb => libev_4.31.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libev/{libev_4.27.bb => libev_4.31.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.27.bb b/meta-oe/recipes-connectivity/libev/libev_4.31.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libev/libev_4.27.bb
rename to meta-oe/recipes-connectivity/libev/libev_4.31.bb
index be4536b9c..beea85533 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.27.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.31.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause | GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-SRC_URI[md5sum] = "d38925fbc030153fe674c4e0e864a69a"
-SRC_URI[sha256sum] = "2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e"
+SRC_URI[md5sum] = "20111fda0df0a289c152faa2aac91b08"
+SRC_URI[sha256sum] = "ed855d2b52118e32c0c1a6a32bd18c97f9e6711ca511f5ee12de3b9eccc66e5a"
 
 inherit autotools
 
-- 
2.17.1




