Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.198])
	by mail.openembedded.org (Postfix) with SMTP id BED2470A61
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 12:40:33 +0000 (UTC)
Received: (qmail 6785 invoked by uid 510); 9 Aug 2014 12:40:26 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=cuagnhsIt6pUNBidEwPzLrxnKxd6eh2aoxGTfbyf9PDtanvB+vnkSLBjbkO+NIE8hHkZ60ZV5HdYFHNwm4jtqhgcWvLzqk/FnoAJh1IGKgER+QArw+lyQB+83xJEqp4XnTXfkNfOgGxR06BF7uROZxqIZgDS2+R0G3qZtDbdLPI=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160204.53E616BA.0065, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 9 Aug 2014 12:40:25 -0000
Message-ID: <20140809124025.6627.qmail@f4mail-235-198.rediffmail.com>
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 122.177.212.189 by rediffmail.com via HTTP;
	09 Aug 2014 12:40:25 -0000
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Error: package not found in the base feeds
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
X-List-Received-Date: Sat, 09 Aug 2014 12:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,I am getting following error:Error: spread not found in the base feeds (genericx86_64 x86_64 noarch any all).Error: liburiparser not found in the base feeds (genericx86_64 x86_64 noarch any all).

Please help to resolve the same.
Regards,Himanshu
From martin.jansa@gmail.com  Sat Aug  9 16:08:28 2014
Return-Path: <martin.jansa@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CD89570A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:27 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so6786766wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pzSUyCO/wjEB5vf/q48p5gjZXDIvvPDl5Dvww6NXDyk=;
	b=keurbZmVDOXH7kd3/PeKapqLRueExXmY03y1iZVFYp264av+B6HR0g/uWQR/Zhkqc+
	aSSnE83AzG3ihl+asAcfyezD3dP80ilpCaEXR448S8jZ8vOie/1YU5SoobFeoI1S9jXF
	2U6i7JEod9QWnHWdT+m1QH1a0Q17rcMvpXJgK4GOlyYTUngLRPTjKhNuJYAh3GAHZ9Ct
	eSuTRNg5rqc2Ap/hUZYxRBUK0BaKUygAfrac1reI5M5dw0iuRrXPCBAVN5F9a3WwBx1A
	qqZKNuoPKqQPEUIlWz1aVbnFKb+j13NZiUnCD6ZEQChX1yhEDl6cWgZM2RjoFbzrg8AE
	dUNA==
X-Received: by 10.180.14.170 with SMTP id q10mr2097306wic.56.1407600508078;
	Sat, 09 Aug 2014 09:08:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xn12sm20415885wib.13.2014.08.09.09.08.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:22 +0200
Message-Id: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [oe] [meta-oe][PATCH 01/36] libungif: remove and use giflib
	everywhere
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:28 -0000

* giflib says it's API and ABI compatible with libungif
  which was in wide use while the LZW compression algorithm was
  patented.

* the selection between giflib and libungif wasn't ever determinictic
  because of conflicts in sysroot
* resolves couple of undeterministic dependencies and:
  WARNING: The recipe giflib is trying to install files into a shared area
  when those files already exist. Those files and their manifest location
  are:
   sysroots/qemuarm/usr/include/gif_lib.h
      Matched in manifest-qemuarm-libungif.populate_sysroot
      Please verify which package should provide the above files.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libungif/libungif_4.1.4.bb  | 16 ----------------
 meta-oe/recipes-graphics/fbida/fbida_git.bb          |  2 +-
 meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb |  2 +-
 3 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libungif/libungif_4.1.4.bb

diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
deleted file mode 100644
index aa05653..0000000
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "shared library for GIF images"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-4.x/libungif-${PV}/libungif-${PV}.tar.bz2"
-SRC_URI[md5sum] = "76865bc1bed90ecb5992a1edcc4d6c15"
-SRC_URI[sha256sum] = "708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d6ecfca5a6bd4d332"
-
-inherit autotools lib_package
-
-PACKAGES =+ "${PN}-utils"
-
-FILES_${PN}-utils = "${bindir}/*"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index f4dd01d..41c14b8 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "STRIP="
 
 PACKAGECONFIG ??= "gif png"
-PACKAGECONFIG[gif] = ",,libungif"
+PACKAGECONFIG[gif] = ",,giflib"
 PACKAGECONFIG[png] = ",,libpng"
 PACKAGECONFIG[tiff] = ",,tiff"
 PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
index 6d57da7..e826e05 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
-DEPENDS = "jpeg tiff libpng zlib libungif"
+DEPENDS = "jpeg tiff libpng zlib giflib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
 
-- 
2.0.4


