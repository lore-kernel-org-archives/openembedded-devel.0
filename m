Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 535E77E3A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 14:29:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4TETUZA000997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 07:29:30 -0700 (PDT)
Received: from fidler.wrs.com (128.224.56.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 07:29:30 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 May 2019 10:29:29 -0400
Message-ID: <20190529142929.26419-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] imagemagick: update from 7.0.8-43 to 7.0.8-47
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
X-List-Received-Date: Wed, 29 May 2019 14:29:33 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
index f235db094..4ee06d77f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=05ff94b3ff59fe6fa7489fa26e3d9142"
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "_43"
+PV .= "_47"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
-SRCREV = "723c2bd9cc716a9267a8afe08354d67bb60dabd5"
+SRCREV = "b672df7a44b0ab0219b1fa78b3673c2810ddd374"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


