Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2947C9A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:57:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K8uZJF026958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:51 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:46 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:18 +0800
Message-ID: <1550652980-292761-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] rrdtool: upgrade 1.7.0 -> 1.7.1
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
X-List-Received-Date: Wed, 20 Feb 2019 08:57:00 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
index ff99574..1a1ca54 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
 
-SRCREV = "bfc82d5242855628b826018479df00e0ec4e8360"
-PV = "1.7.0"
+SRCREV = "34e6ff6218bb0372eb545f886dec96dd3d20be47"
+PV = "1.7.1"
 
 SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
-- 
2.7.4


