Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 161997651E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 06:22:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99110143"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 14:26:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V6L0hx026730
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:21:00 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 14:22:51 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:22:42 -0400
Message-ID: <1438352562-12198-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-networking][PATCH] opensaf: upgrade 4.5.0 -> 4.6.0
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
X-List-Received-Date: Fri, 31 Jul 2015 06:22:55 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/opensaf/{opensaf_4.5.0.bb => opensaf_4.6.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_4.5.0.bb => opensaf_4.6.0.bb} (94%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
similarity index 94%
rename from meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
index 686407a..83cb1be 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
@@ -20,8 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-plmcd-error-fix.patch \
            "
 
-SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
-SRC_URI[sha256sum] = "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
+SRC_URI[md5sum] = "a1ceddb517c0972aa7e899b092d7f464"
+SRC_URI[sha256sum] = "f6ea754a145ae42552f328f96c32f38429ad06478a351b9d0aed812adcecb2b4"
 
 SECTION = "admin"
 LICENSE = "LGPLv2.1"
-- 
1.8.4.2


