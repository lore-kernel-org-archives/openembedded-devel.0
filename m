Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 81DAC7621B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:53:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98763709"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 15:57:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N7pZFI019662
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:51:35 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 15:53:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 15:53:16 +0800
Message-ID: <1437637996-4507-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libedit: upgrade 20130712-3.1 -> 20150325-3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2015 07:53:26 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../libedit/{libedit_20130712-3.1.bb => libedit_20150325-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20130712-3.1.bb => libedit_20150325-3.1.bb} (78%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb
similarity index 78%
rename from meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb
index 1f76bb2..4a72896 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20150325-3.1.bb
@@ -16,5 +16,5 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "0891336c697362727a1fa7e60c5cb96c"
-SRC_URI[sha256sum] = "5d9b1a9dd66f1fe28bbd98e4d8ed1a22d8da0d08d902407dcc4a0702c8d88a37"
+SRC_URI[md5sum] = "43cdb5df3061d78b5e9d59109871b4f6"
+SRC_URI[sha256sum] = "c88a5e4af83c5f40dda8455886ac98923a9c33125699742603a88a0253fcc8c5"
-- 
1.8.4.2


