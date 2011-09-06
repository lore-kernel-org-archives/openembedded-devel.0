Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qSM-0000Xc-UH
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:52:30 +0200
Received: by mail-ey0-f173.google.com with SMTP id 7so4079380eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ALNr/0O9EmYWXPBgipmjb6Ug4fA+l/1l1gMBrXF0wcU=;
	b=LuXTJNGDbEIGESQ8sw0/Fbm2F0EfkGN1VCd2YgipraozDHmxANSCW/8VSMeYo9AG/o
	0xAily+01AdyiSDG/SqXX2WISLRzu243lx62+tyHsNbNJhd+GSY86A3K9DCywBoX0RiA
	u4NeGbvLbWvdzasIhdZWPdSIne2rOtiKMTqF4=
Received: by 10.213.25.211 with SMTP id a19mr1344770ebc.58.1315295252268;
	Tue, 06 Sep 2011 00:47:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i6sm13133560eeb.11.2011.09.06.00.47.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:47:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:43 +0200
Message-Id: <c17fe9bc7ed4096853ba160a67300b3c5e1dd02b.1315295094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
References: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 6/6] recipes-efl: update LIC_FILES_CHKSUM, Copyright was updated in r63187
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2011 07:52:31 -0000

* see http://trac.enlightenment.org/e/changeset/63187

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb       |    2 +-
 meta-efl/recipes-efl/efl/ecore.inc         |    2 +-
 meta-efl/recipes-efl/efl/edbus.inc         |    2 +-
 meta-efl/recipes-efl/efl/eet.inc           |    2 +-
 meta-efl/recipes-efl/efl/eeze.inc          |    2 +-
 meta-efl/recipes-efl/efl/efreet.inc        |    2 +-
 meta-efl/recipes-efl/efl/eina.inc          |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 meta-efl/recipes-efl/efl/embryo.inc        |    2 +-
 meta-efl/recipes-efl/efl/evas.inc          |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index cb7f445..2d0f44d 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas eina ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f523ab5986cc79b52a90d2ac3d5454a2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
 PR = "r19"
diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 9f3d1a4..96bc26c 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cb293be68319f9fcb179d7f3daae5fbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
 DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 \
            libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxprintutil"
 DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 8fe64d0..4f2e920 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
 DEPENDS = "dbus ecore"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c36b278587b5b7ac1f73c20b60212778"
+LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/eet.inc b/meta-efl/recipes-efl/efl/eet.inc
index 5b8ccb2..de17e05 100644
--- a/meta-efl/recipes-efl/efl/eet.inc
+++ b/meta-efl/recipes-efl/efl/eet.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "EET is the Enlightenment data storage library"
 DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4ca74999c2a19695474d532d2f2ac886"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index 5572836..5494d3c 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Eeze is a library to simplify the use of devices"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5388f2e926064f899c2481629ec3de18"
+LIC_FILES_CHKSUM = "file://COPYING;md5=315521fe061b6fd4290ef01db714a3c8"
 DEPENDS = "ecore eet udev"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/efreet.inc b/meta-efl/recipes-efl/efl/efreet.inc
index 227b620..9aaeaa7 100644
--- a/meta-efl/recipes-efl/efl/efreet.inc
+++ b/meta-efl/recipes-efl/efl/efreet.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Enlightenment freedesktop.org library"
 DEPENDS = "ecore"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=49e56d2cc74d0b06fce18906e6ebc9ae"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index c3f654d..c512530 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Eina is the Enlightenment data library"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=723bb07e0e90220fe8f03924969e5f4e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9cc092d35d7bbfcd986232cde130a551"
 
 BBCLASSEXTEND = "native"
 INC_PR = "r0"
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 1c8909f..fda1622 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=620edc2399d9155fc180a0adc2b0ab7c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cdc6c12b238ccd62635a7517dfe89438"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.7.0+svnr${SRCPV}"
 PR = "r11"
diff --git a/meta-efl/recipes-efl/efl/embryo.inc b/meta-efl/recipes-efl/efl/embryo.inc
index e307350..efd9319 100644
--- a/meta-efl/recipes-efl/efl/embryo.inc
+++ b/meta-efl/recipes-efl/efl/embryo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
 inherit efl
 
 LICENSE = "MIT BSD CompuPhase"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
+LIC_FILES_CHKSUM = "file://COPYING;md5=220a7f1107df42c62428d8ebe559ed14"
 
 BBCLASSEXTEND = "native"
 INC_PR = "r1"
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index bbe06cc..1328309 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=702a085dc863c1c7c1e909db7175f5bf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
 # can also depend on valgrind, libsdl-x11, directfb
 DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
 DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
-- 
1.7.6.1



