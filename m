Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id F0DB878A03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:39 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f125so9820408wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ldhQTMncaUR4D4wgunq6xkdZyRn+RG0rr0v+JiFYzsg=;
	b=tbS34tBxvsrdyf+XyHks06I7IqL9FrQEz85pr4LD92HRXv8VMsoIjIIoRukafNy5xW
	4UT36HEIWGBSgCEGPo5LbAP7MaeE+oJ7h/wZhqg9fy0K4WeKO7gkUJKDruuoqIutDpza
	+rPwmxwZPMXEpsL5VGy38w3dEV8RIb2rEPzKBiYIQYEA4z128CiF8XO9lfxSyirWaBnv
	9Lgh9OjffO9dPtMsea88nPHnVKVDpIJI099/7IiMzY9bVkLERpcVgWStE5ePuKOryzEp
	AyY5e3xWypK9v8lOnlBbLUhcS70h7qVv1aAbOAotXM7CT1rAuW/X1BhLNMtmXrHASyJy
	wAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ldhQTMncaUR4D4wgunq6xkdZyRn+RG0rr0v+JiFYzsg=;
	b=ghYITXLIJS15rYfYaC5wQpKjGkKbE3oootu8Od01vj5vsXbH63153g5B7VEIsj4nsd
	i80ai5OvE6k+NUf36Mz7fsRcV5zYZJ1ttCnpv+hDgoqLnispH9T5Gh962jPRjmu6AK2w
	naz3sx0MsWxWdzEO1aM4sle4uo0XpE0mmoYxVy8Oscu7pko/R0B696FnIF6Ds5CJVHEP
	wT7gaHz19tIWXQjzZw+EqT+O8bYvNLxsv/tMUuvXleCZ52TnEPTnOwDJPp2MQIhtAP9o
	oQDTUgmQKt5GhIwWU3JBVKMKM4A3kqK48HZEl3VTAU0PzIEhN/UGeEOoHhwMtMLjb5OO
	bJ3g==
X-Gm-Message-State: AElRT7EXVVFWB6obtzdVBHyXOVL2L7RkyW0lSbqKuJJSXac0OKDhLGvx
	u7hiZjuABGSRk240R/n1It3bAQ==
X-Google-Smtp-Source: AG47ELvwHz1PmLct3ppMudeo0cCiz7Y9CCHeYScxhB7hIimvyMwiGCQPtvSvvVQqh0tB6mU3c9kjtg==
X-Received: by 10.28.43.66 with SMTP id r63mr73077wmr.93.1521491380444;
	Mon, 19 Mar 2018 13:29:40 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:10 +0100
Message-Id: <20180319202911.30760-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/17] gtk-engines: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last stable release was in 2010

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtk-engines/files/glib-2.32.patch              | 23 ---------
 .../gtk-engines/files/substitute-tests.patch       | 37 ---------------
 .../gtk-engines/gtk-engines_2.20.2.bb              | 55 ----------------------
 3 files changed, 115 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb

diff --git a/meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch b/meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
deleted file mode 100644
index f0b878d37..000000000
--- a/meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 8d49a386f467cbf8e0842d2218126f643e50f834 Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Sun, 27 Nov 2011 14:24:57 +0000
-Subject: Fix build with glib 2.31: Only glib.h can be #include'd. Fixes bug #664914
-
-Upstream-Status: Backport
-
----
-diff --git a/engines/clearlooks/src/animation.c b/engines/clearlooks/src/animation.c
-index 1f7a41f..56a9286 100644
---- a/engines/clearlooks/src/animation.c
-+++ b/engines/clearlooks/src/animation.c
-@@ -28,7 +28,7 @@
- #include "animation.h"
- 
- #ifdef HAVE_WORKING_ANIMATION
--#include <glib/gtimer.h>
-+#include <glib.h>
- 
- struct _AnimationInfo {
- 	GTimer *timer;
---
-cgit v0.9.0.2
diff --git a/meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch b/meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
deleted file mode 100644
index 5c557ba68..000000000
--- a/meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd gtk-engines-2.20.2/configure.ac gtk-engines-2.20.2/configure.ac
---- gtk-engines-2.20.2/configure.ac	2010-10-01 15:42:37.000000000 +0300
-+++ gtk-engines-2.20.2/configure.ac	2013-08-20 02:50:27.930510565 +0300
-@@ -166,6 +166,9 @@
-
- AC_SUBST(DEVELOPMENT_CFLAGS)
-
-+AC_SUBST([exported_symbols_tests], [[$(EXPORTED_SYMBOLS_TESTS)]])
-+AC_SUBST([torture_test_tests], [[$(TORTURE_TEST_TESTS)]])
-+
- AM_CONFIG_HEADER([engines/support/config.h])
-
- AC_CONFIG_FILES([
-diff -Nurd gtk-engines-2.20.2/test/Makefile.am gtk-engines-2.20.2/test/Makefile.am
---- gtk-engines-2.20.2/test/Makefile.am	2010-09-19 18:18:21.000000000 +0300
-+++ gtk-engines-2.20.2/test/Makefile.am	2013-08-20 02:50:36.842510865 +0300
-@@ -66,7 +66,7 @@
- # Prefix with exported_
- EXPORTED_SYMBOLS_TESTS = $(patsubst %,exported_%,$(BUILD_ENGINES))
-
--TESTS += $(EXPORTED_SYMBOLS_TESTS)
-+TESTS += @exported_symbols_tests@
-
-
- #############################################################
-@@ -88,7 +88,7 @@
- TORTURE_TEST_TESTS = torture_buildin $(patsubst %,torture_%,$(TORTURE_TEST_ENGINES))
-
- # Add TORTURE_TEST_ENGINES to list of tests
--TESTS += $(TORTURE_TEST_TESTS)
-+TESTS += @torture_test_tests@
-
- # Possible other tests:
- #  - An extensive theme switch tests that loads/unloads the engine
diff --git a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
deleted file mode 100644
index 83aa74968..000000000
--- a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "GTK+ theme engines"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SECTION = "x11/base"
-DEPENDS = "intltool-native gtk+ gettext-native glib-2.0-native"
-
-PR = "r3"
-
-PACKAGES += "${PN}-schemas"
-PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
-
-RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
-RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
-RDEPENDS_gtk-theme-mist = "gtk-engine-mist"
-RDEPENDS_gtk-theme-crux = "gtk-engine-crux-engine"
-RDEPENDS_gtk-theme-lighthouseblue = "gtk-engine-lighthouseblue"
-RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
-RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
-RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
-
-FILES_${PN} = ""
-FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
-FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
-
-CFLAGS_prepend = "-DHAVE_ANIMATION "
-
-RDEPENDS_${PN}-dev = ""
-
-inherit gnomebase
-GNOME_COMPRESS_TYPE="bz2"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-# This picks stable releases in the 2.x series (but not 2.90 onwards,
-# which were GNOME 3 betas).
-UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
-
-python populate_packages_prepend() {
-    engines_root = os.path.join(d.getVar('libdir'), "gtk-2.0/2.10.0/engines")
-    themes_root = os.path.join(d.getVar('datadir'), "themes")
-
-    do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
-    do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
-    # TODO: mark theme packages as arch all
-}
-
-SRC_URI += "file://glib-2.32.patch \
-            file://substitute-tests.patch"
-SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
-SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-- 
2.14.3


