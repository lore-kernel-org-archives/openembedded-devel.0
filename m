Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBFB73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 10:03:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98769870"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 18:07:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6NA1npV028150
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 18:01:49 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 18:03:37 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 18:03:31 +0800
Message-ID: <1437645811-4903-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] swig: upgrade 3.0.2 -> 3.0.6
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
X-List-Received-Date: Thu, 23 Jul 2015 10:03:40 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/swig/{swig_3.0.2.bb => swig_3.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/swig/{swig_3.0.2.bb => swig_3.0.6.bb} (58%)

diff --git a/meta-oe/recipes-devtools/swig/swig_3.0.2.bb b/meta-oe/recipes-devtools/swig/swig_3.0.6.bb
similarity index 58%
rename from meta-oe/recipes-devtools/swig/swig_3.0.2.bb
rename to meta-oe/recipes-devtools/swig/swig_3.0.6.bb
index ac41914..2a0917e 100644
--- a/meta-oe/recipes-devtools/swig/swig_3.0.2.bb
+++ b/meta-oe/recipes-devtools/swig/swig_3.0.6.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
+SRC_URI[md5sum] = "df43ae271642bcfa61c1e59f970f9963"
+SRC_URI[sha256sum] = "c67f63ea11956106e4cda66416d5020330dc4ce2ee45057d39a9494ce33eca05"
 
-SRC_URI[md5sum] = "62f9b0d010cef36a13a010dc530d0d41"
-SRC_URI[sha256sum] = "a2669657cabcedc371f63c0457407a183e0b6b2ef4e7e303c1ec9a3964cc7813"
-- 
1.8.4.2


