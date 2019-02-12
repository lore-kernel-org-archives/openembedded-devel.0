Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D30D87BE41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 21:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1CLRmBx028471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 13:27:48 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 12 Feb 2019 13:27:47 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Feb 2019 16:27:45 -0500
Message-ID: <20190212212745.6773-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] imagemagick: add homepage and description
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
X-List-Received-Date: Tue, 12 Feb 2019 21:27:48 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
index 46cc78ed7..af219abdb 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
@@ -1,5 +1,8 @@
-SUMMARY = "ImageMagick is an image convertion tools"
+SUMMARY = "ImageMagick is an image convertion toolkit"
 SECTION = "console/utils"
+HOMEPAGE = "https://www.imagemagick.org/"
+DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
+editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-- 
2.17.0


