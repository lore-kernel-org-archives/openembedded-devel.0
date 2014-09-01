Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBE4F60E49
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 07:11:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s817BSFg022584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 00:11:28 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 00:11:27 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 15:11:36 +0800
Message-ID: <1409555496-16040-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] aoetools: uprev to version 36
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
X-List-Received-Date: Mon, 01 Sep 2014 07:11:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/aoetools/{aoetools_34.bb => aoetools_36.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/aoetools/{aoetools_34.bb => aoetools_36.bb} (84%)

diff --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
similarity index 84%
rename from meta-networking/recipes-support/aoetools/aoetools_34.bb
rename to meta-networking/recipes-support/aoetools/aoetools_36.bb
index eb1e0fe..5bb486f 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_34.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RRECOMMENDS_${PN} = "kernel-module-aoe"
 
 SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "cde7f7cedc7cd9938a5ebfd009dd3ec0"
-SRC_URI[sha256sum] = "fd6c57244e9458d7cbe7a0171295ddee4d8cdcae291e40d6acbc641df7296d85"
+SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
+SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
 
 # EXTRA_OEMAKE is typically: -e MAKEFLAGS=
 # the -e causes problems as CFLAGS is modified in the Makefile.
-- 
1.7.10.4


