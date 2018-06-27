Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCEA60248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9oJPI027189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:50:19 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:50:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:18 -0700
Message-ID: <20180627094922.109996-8-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/13] libedit: Upgrade to 20180525-3.1
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:18 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{libedit_20170329-3.1.bb => libedit_20180525-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20170329-3.1.bb => libedit_20180525-3.1.bb} (80%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
similarity index 80%
rename from meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
index fc2467112..8cc0e959e 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20170329-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
@@ -15,7 +15,7 @@ FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "c57a0690e62ef523c083598730272cfd"
-SRC_URI[sha256sum] = "91f2d90fbd2a048ff6dad7131d9a39e690fd8a8fd982a353f1333dd4017dd4be"
+SRC_URI[md5sum] = "97679319742f45d6cdcd6075511b14ac"
+SRC_URI[sha256sum] = "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
2.17.1


