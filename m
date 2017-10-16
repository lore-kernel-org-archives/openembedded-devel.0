Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F24C977DE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 06:29:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9G6TivH019242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 23:29:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 15 Oct 2017 23:29:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Oct 2017 14:14:34 +0800
Message-ID: <20171016061434.28306-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] imagemagick: 7.0.7-1 -> 7.0.7-7
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
X-List-Received-Date: Mon, 16 Oct 2017 06:29:44 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
index 62f0e023e..669534eaa 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 BASE_PV := "${PV}"
-PV .= "_1"
+PV .= "_7"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
-SRCREV = "b601ab2f2e355350b14ca72753684cbeeef7ffcf"
+SRCREV = "e12602b39b5e778240d286b6f9bbbc0fe3fb26c5"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


