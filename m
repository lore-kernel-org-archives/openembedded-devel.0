Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2969177219
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 02:17:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u152HjI8026174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 18:17:45 -0800
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Feb 2016 18:17:44 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:17:01 +0800
Message-ID: <2f03718c165c5082f923e725bb1818214d459747.1454638380.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454638380.git.jackie.huang@windriver.com>
References: <cover.1454638380.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 5/5] classpath: fix the license
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
X-List-Received-Date: Fri, 05 Feb 2016 02:17:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There is no 'Classpath' license, set it as
the same with classpath-native.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/classpath/classpath.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 2be849b..01f7a4f 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/classpath/"
 SECTION = "libs"
 
 # GPLv2 + custom linking exception
-LICENSE = "Classpath"
+LICENSE = "GPL-2.0 & SAX-PD"
 
 PBN = "classpath"
 
-- 
1.9.1


