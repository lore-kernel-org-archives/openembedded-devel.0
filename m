Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1878076515
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 07:32:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99112917"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 15:35:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V7UIY7031176
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:30:19 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 15:32:10 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 15:32:08 +0800
Message-ID: <1438327928-18670-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-python][PATCH] python-greenlet: upgrade 0.4.1->0.4.7
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
X-List-Received-Date: Fri, 31 Jul 2015 07:32:15 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-greenlet_0.4.1.bb => python-greenlet_0.4.7.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.1.bb => python-greenlet_0.4.7.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
index a6db8ab..97d64d0 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
-SRC_URI[md5sum] = "c2deda75bdda59c38cae12a77cc53adc"
-SRC_URI[sha256sum] = "ea671592f8460541286b133ed46a6cf5311a6b75051cc31b53e2bc38992b775a"
+SRC_URI[md5sum] = "c2333a8ff30fa75c5d5ec0e67b461086"
+SRC_URI[sha256sum] = "f32c4fa4e06443e1bdb0d32b69e7617c25ff772c3ffc6d0aa63d192e9fd795fe"
 
 S = "${WORKDIR}/greenlet-${PV}"
 
-- 
1.8.4.2


