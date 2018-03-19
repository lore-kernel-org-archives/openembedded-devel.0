Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id D737F789D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:37 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id o8so20013265wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AaGqxuvbLoGhc7B6c1kaYNOT3p0ibUZBqzmf5itQ8T8=;
	b=MPy+dflOcKaKCr9t+UgqufrUlcklBekU5QtylHpeKxlVbfi9FrTQJeAFJlZXTzruF8
	l1Rx7YhaZrpIXSZGeRBsH4q8NOeQqm5goUMXnkvmPUvBpD8sdhcCkW7KvumY1V0/qaSL
	/11MPhW8ZOgqHvVR1O10gGk78L3zUT4ooBME+7HPh+5V+epWMA6cSjeoVytY9G09Z2N/
	CQ+zQRcxvHXfrp76zdCASPHfOSYp7RJEYK7jmzpH3XR6d0cv3ABH8J3EatPqW2jk22Fl
	yiesySGdqgr+b6nc624Sy0F+S3lu3/0Nd3/OUSIltFg0nph3T+dMsQMvTxdMX/JMH/zu
	NofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AaGqxuvbLoGhc7B6c1kaYNOT3p0ibUZBqzmf5itQ8T8=;
	b=igBwVQ9qCY3mwjRi3Iwhv7K5i3prBD5aK1ldrjJbmYWfY+sYLr8WdiLeBe8nBVFoCA
	ScD8drjyNQLVAE8A1Dygfn7StVSkHHn09VJxpNY3pdpF/akH+SL63dafix+jIHFFEXAl
	Xy47vxWZxU83Bs4z8uYqMAY9iyUPu+T5vsBeIxpmNcMcyb1yjW1y6riVv1lSu074wmQL
	GxwtaKsKyHb4+M/QTLfH3bCXpcQawrCJ7p1sKCUiAh/eBQdLbVC+Kqt9q0nvPFKTqv7W
	0/FkYMgaVo5i27H3QHhI+b5pL6YymIe/BAH6ZnvDj1ZqYwhq7cOb43cd+3Z86Ymexy6o
	w21Q==
X-Gm-Message-State: AElRT7G21tIqiBd0Lec4Z8U6BLGPiHmNsWwPXUMHBURh5d3UaPSeRaKa
	hOBIYVcNt1UBEL8G1oIq2wXLIw==
X-Google-Smtp-Source: AG47ELvsmj107wqO3Fn8ahMqBAGHf8sawUcMY9m8VZ6IQxxYVfowAOxsUHPQS+f81x+dEJTevzHCLA==
X-Received: by 10.223.176.171 with SMTP id i40mr10049251wra.246.1521491378302; 
	Mon, 19 Mar 2018 13:29:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:08 +0100
Message-Id: <20180319202911.30760-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/17] gnome-themes: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last release was in 2011. That was a gnome 3 port which was
not continued.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-themes/drop-localedir-override.patch     | 22 ---------
 .../themes/gnome-themes/iconpath-option.patch      | 52 ----------------------
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    | 39 ----------------
 3 files changed, 113 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch b/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
deleted file mode 100644
index e37482b97..000000000
--- a/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Causes locale file to be installed in /usr/locale instead of /usr/share/locale
-
-Apply the same fix as in evolution-data-server:
-https://git.gnome.org/browse/evolution-data-server/commit/configure.ac?id=ec46c763e9342f604b7228c660623d271dfeb101
-
-Upstream-Status: Pending
-
-diff -uNr gnome-themes-2.32.1.orig/configure.in gnome-themes-2.32.1/configure.in
---- gnome-themes-2.32.1.orig/configure.in	2015-09-18 15:01:25.152055729 +0200
-+++ gnome-themes-2.32.1/configure.in	2015-09-18 15:09:03.312072156 +0200
-@@ -19,11 +19,6 @@
- 
- AM_GLIB_GNU_GETTEXT
- 
--# AM_GLIB_GNU_GETTEXT above subst. $DATADIRNAME
--# this is the directory where the *.{mo,gmo} files are installed
--localedir='${prefix}/${DATADIRNAME}/locale'
--AC_SUBST(localedir)
--
- # Workaround to make aclocal get the right flags
- AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")
- 
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch b/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
deleted file mode 100644
index 1b4096dd0..000000000
--- a/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-
-The patch is ported from sato-icon-theme.
-
-pkg-config will only search the target sysroot and we want the native script. This 
-patch adds an option to allow the path to the tool to be specified.
-
-Upstream-Status: Pending
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- configure.in |   26 ++++++++++++++++----------
- 1 file changed, 16 insertions(+), 10 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 5f7a18c..e8fc31e 100644
---- a/configure.in
-+++ b/configure.in
-@@ -74,16 +74,22 @@ AC_ARG_ENABLE([icon-mapping],
- ICONMAP="true"
- if test "x$enable_mapping" != "xno"; then
-    UTILS_REQUIRED=0.8.7
--
--   AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
--   PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED, have_utils=yes, have_utils=no)
--   if test "x$have_utils" = "xyes"; then
--      UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
--      ICONMAP="$UTILS_PATH/icon-name-mapping"
--      AC_MSG_RESULT([yes])
--   else
--	AC_MSG_RESULT([no])
--   	AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install gnome-themes])
-+   PKG_PROG_PKG_CONFIG()
-+   AC_ARG_WITH(iconmap,
-+   	    AC_HELP_STRING([--with-iconmap=<dir>], [The location of the icon-name-mapping script to use]),
-+   	    ICONMAP=$withval, ICONMAP="")
-+   if test "x$ICONMAP" = "x"; then
-+      AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
-+      PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED, have_utils=yes, have_utils=no)
-+      if test "x$have_utils" = "xyes"; then
-+         UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
-+         ICONMAP="$UTILS_PATH/icon-name-mapping"
-+
-+         AC_MSG_RESULT([yes])
-+      else
-+         AC_MSG_RESULT([no])
-+         AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install gnome-themes"])
-+      fi
-    fi
- fi
- AC_SUBST(ICONMAP)
--- 
-1.7.9.5
-
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
deleted file mode 100644
index c1ecc23f7..000000000
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "GNOME themes"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
-
-PR = "r3"
-
-SECTION = "x11/gnome"
-DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native \
-           glib-2.0 intltool-native libxml-simple-perl-native \
-           glib-2.0-native \
-"
-RDEPENDS_${PN} = "adwaita-icon-theme"
-
-EXTRA_OECONF += "--enable-all-themes \
-    --with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping \
-"
-
-inherit distro_features_check gnomebase perlnative
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
-FILES_gnome-theme-crux = "${datadir}/themes/Crux ${datadir}/icons/Crux"
-FILES_gnome-theme-highcontrast = "${datadir}/themes/HighContrast ${datadir}/icons/HighContrast"
-FILES_gnome-theme-highcontrastinverse = "${datadir}/themes/HighContrastInverse ${datadir}/icons/HighContrastInverse"
-FILES_gnome-theme-highcontrastlargeprint = "${datadir}/themes/HighContrastLargePrint ${datadir}/icons/HighContrastLargePrint"
-FILES_gnome-theme-highcontrastlargeprintinverse = "${datadir}/themes/HighContrastLargePrintInverse ${datadir}/icons/HighContrastLargePrintInverse"
-FILES_gnome-theme-largeprint = "${datadir}/themes/LargePrint ${datadir}/icons/LargePrint"
-FILES_gnome-theme-mist = "${datadir}/themes/Mist ${datadir}/icons/Mist"
-
-FILES_${PN} += "${datadir}/themes ${datadir}/icons"
-
-SRC_URI += "file://iconpath-option.patch \
-    file://drop-localedir-override.patch \
-"
-SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
-SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
-GNOME_COMPRESS_TYPE="bz2"
-
-- 
2.14.3


