Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C52537CFC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 01:16:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2M1GFxH021071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:16:15 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 21 Mar 2019 18:16:14 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2019 21:16:12 -0400
Message-ID: <20190322011613.32505-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/2] imagemagick: fix typo in summary
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
X-List-Received-Date: Fri, 22 Mar 2019 01:16:14 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
index af219abdb..37d5a637a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
@@ -1,4 +1,4 @@
-SUMMARY = "ImageMagick is an image convertion toolkit"
+SUMMARY = "ImageMagick is an image conversion toolkit"
 SECTION = "console/utils"
 HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
-- 
2.17.0


