Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E222E77331
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 02:17:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u152HdkY024575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 18:17:39 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Feb 2016 18:17:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:16:57 +0800
Message-ID: <7a099f1f9ff07d9b0ff8dc4e4cb010e122ee9810.1454638380.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454638380.git.jackie.huang@windriver.com>
References: <cover.1454638380.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/5] jikes: fix the license name
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
X-List-Received-Date: Fri, 05 Feb 2016 02:17:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The license is: IBM Public License Version 1.0
and it is named IPL-1.0 instead of IBM in common-licenses.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/jikes/jikes_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
index c05b0f6..0c33118 100644
--- a/recipes-core/jikes/jikes_1.22.bb
+++ b/recipes-core/jikes/jikes_1.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Java compiler adhering to language and VM specifications"
 HOMEPAGE = "http://jikes.sourceforge.net/"
 PRIORITY = "optional"
 SECTION = "devel"
-LICENSE = "IBM"
+LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = " \
                     file://COPYING;md5=2d52359fd0d8f0c3e371e4cd19b213c0 \
                     file://doc/license.htm;md5=43506e48033a385dc0936f620ae2c745 \
-- 
1.9.1


