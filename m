Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C64960F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 16:39:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r97Gd9EL007527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Oct 2013 09:39:09 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 7 Oct 2013 09:39:09 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Oct 2013 09:39:08 -0700
Message-ID: <1381163948-20161-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/1] xdebug: update to version 2.2.3
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
X-List-Received-Date: Mon, 07 Oct 2013 16:39:09 -0000
Content-Type: text/plain

Version 2.2.1 will not build with modphp 5.5.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../xdebug/{xdebug_2.2.1.bb => xdebug_2.2.3.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.1.bb => xdebug_2.2.3.bb} (85%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
similarity index 85%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
index d09473c..3e9c982 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
@@ -8,8 +8,8 @@ PR = "r0"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "5e5c467e920240c20f165687d7ac3709"
-SRC_URI[sha256sum] = "11d340eb7f87909a596bac054cc927df757dc2fc7c90b50a832c30e9bf84c9ad"
+SRC_URI[md5sum] = "e49cec9861b45dc0b36eae33bf8a14fa"
+SRC_URI[sha256sum] = "b351872da46ed8378dff90a87673f5ec1e0bdd94324558ebc898e1d115e9d71c"
 
 inherit autotools
 
-- 
1.7.3.4


