Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 860BE6D28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9e4Q4020761
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:40:05 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:40:04 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:39:12 +0800
Message-ID: <1543311554-293342-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
References: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/7] libblockdev: upgrade to 2.20
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
X-List-Received-Date: Tue, 27 Nov 2018 09:40:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
index 35f0cc0..2169c62 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools python3native gobject-introspection
 
-SRCREV = "0debeb45562ac3d8f6f43f6f942b238abab55be9"
+SRCREV = "cb308566c3c5222b8422f78997a1742713b265a9"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
 "
-- 
2.7.4


