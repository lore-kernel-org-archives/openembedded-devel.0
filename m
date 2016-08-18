Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6065776B7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:00:21 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so424667wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FYBgyB+Ndzs2tPvT1ZUhD5gRuk2m9Z6zDxs/VebYIVU=;
	b=w/JT6+rTSkBxdg3zqR/ctcrIgQ5ZDJfuE5DMuFepU/nLFJ6lvd0ohrOqN54tYrrfSH
	h2IaBktR0vwIVLdI5dqElfsJ2KsjwFZvmGzUOWO4CyH8vIuYInfnbCLdW78+2p5i5Vgh
	+P6jKs/RAll7WEDS2zljBHdSGtNUd8dEbmM70Gj7pDoi2QS7rdw2ElZhD3bYtbLH/+yZ
	SIdfFApUpefjxGs/+y4NUu2pghGLqYBtD5sVAR1C/mEF9HENJUq9cNZ1tXz+CMVSxu2Y
	yKDRohDSs+p3h4+muv8SH44CUHUPzLEfeMP3gDyFZJjJeC8Eix2oQG/nsIMbS9OXjeMz
	XZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FYBgyB+Ndzs2tPvT1ZUhD5gRuk2m9Z6zDxs/VebYIVU=;
	b=k6CzLPgD8QjIZwdGBi9966dMsfiwfDEOPrNSi78s9bRHOwIXd0+eF89sjSA+jWGYld
	QATu7udQfYfdYwyBXjoPVMPU4I77H/WSU/KNrVbTkSkDPlIm0Bo+mwe70xZbRchdQ3y5
	k+ZdpIBbxPZRihvywA3MjeOxEmsb+mHhHxON+mXaChecu5RPL78IhYFEVCyehyytpS2a
	keWaInoBUpeqYEGULtnSg01Aq6ZffEJsvdyf5JAQbzN3n4s7fUjRRxQ4SXMP5y+4/FzS
	oHeXwBruVeGUKIm5lwDJxsTynUflRydB4LTUisnkAxS23wFTtu5SibogzvLZUegfRBgK
	4/DA==
X-Gm-Message-State: AEkoouugVZp4rhFtU0sCYUz78v1TjpjpzfUKncdQow80XUWWNDN47ecp9LLhsQ2jsAKesg==
X-Received: by 10.194.72.226 with SMTP id g2mr2992834wjv.70.1471539620704;
	Thu, 18 Aug 2016 10:00:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id e12sm410910wmg.17.2016.08.18.10.00.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 10:00:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 19:00:12 +0200
Message-Id: <20160818170012.5819-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160818170012.5819-1-Martin.Jansa@gmail.com>
References: <20160818170012.5819-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] meta-oe: remove trailing spaces
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
X-List-Received-Date: Thu, 18 Aug 2016 17:00:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb             |  2 +-
 meta-efl/recipes-efl/e17/exalt-client_svn.bb                   |  2 +-
 meta-efl/recipes-efl/e17/news_svn.bb                           |  2 +-
 meta-efl/recipes-efl/e17/rain_svn.bb                           |  2 +-
 meta-efl/recipes-efl/efl/efl.inc                               |  2 +-
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb        |  2 +-
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb              |  2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb     |  2 +-
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb |  2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb         |  2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb              |  2 +-
 .../recipes-gnome/system-tools/system-tools-backends_2.10.2.bb |  2 +-
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb         |  2 +-
 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb   |  2 +-
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb           |  2 +-
 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         |  2 +-
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                 |  2 +-
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb        |  2 +-
 meta-networking/recipes-daemons/atftp/atftp_git.bb             |  4 ++--
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb                 |  4 ++--
 meta-networking/recipes-support/chrony/chrony_2.4.bb           |  4 ++--
 .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb      |  2 +-
 meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb   |  2 +-
 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb          |  4 ++--
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb       |  4 ++--
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb                  |  2 +-
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb                |  4 ++--
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb                  |  6 +++---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb            |  4 ++--
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb                 |  4 ++--
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb        |  4 ++--
 meta-oe/recipes-extended/sysdig/sysdig_git.bb                  |  2 +-
 meta-oe/recipes-extended/tiptop/tiptop_2.3.bb                  |  2 +-
 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb   |  2 +-
 meta-oe/recipes-kernel/crash/crash_7.1.5.bb                    |  2 +-
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb            |  2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb             |  2 +-
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb       |  2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb             |  2 +-
 meta-oe/recipes-support/emacs/emacs.inc                        |  4 ++--
 meta-oe/recipes-support/fftw/benchfft_3.1.bb                   |  2 +-
 meta-oe/recipes-support/fftw/fftw.inc                          |  2 +-
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb             |  2 +-
 meta-oe/recipes-support/lcov/lcov_1.11.bb                      |  2 +-
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb         |  2 +-
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb     |  2 +-
 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb           |  2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb                   |  2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.43.bb            |  2 +-
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb             |  2 +-
 meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb                |  4 ++--
 meta-oe/recipes-support/spitools/spitools_git.bb               |  2 +-
 meta-oe/recipes-support/upower/upower_0.99.4.bb                |  2 +-
 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb    |  2 +-
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb     |  2 +-
 meta-python/recipes-connectivity/gateone/gateone_git.bb        |  4 ++--
 meta-python/recipes-devtools/python/python-dateutil.inc        |  2 +-
 meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb     |  8 ++++----
 meta-python/recipes-devtools/python/python-ldap_2.3.9.bb       | 10 +++++-----
 meta-python/recipes-devtools/python/python-ldap_2.4.10.bb      |  2 +-
 meta-python/recipes-devtools/python/python-vobject_0.9.2.bb    |  4 ++--
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb         |  2 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb |  4 ++--
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb    |  2 +-
 64 files changed, 87 insertions(+), 87 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
index ae1b8a6..704e43d 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
@@ -18,7 +18,7 @@ SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http"
 S = "${WORKDIR}/${SRCNAME}/e"
 
 do_compile() {
-    # unfortunately hardcoded edje_cc in Makefile     
+    # unfortunately hardcoded edje_cc in Makefile
     sed -i "s#\tedje_cc#\t${STAGING_BINDIR_NATIVE}/edje_cc#g" Makefile
     make
 }
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index f708601..afed0e8 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -21,5 +21,5 @@ FILES_${PN} += "${libdir}/enlightenment/modules/*/*.desktop \
 FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/*/*/*.a"
 FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
- 
+
 SRC_URI += "file://configure.patch"
\ No newline at end of file
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
index f08cab6..3b652a6 100644
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ b/meta-efl/recipes-efl/e17/news_svn.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-    sed -i -e /po/d configure.ac 
+    sed -i -e /po/d configure.ac
     sed -i -e s:\ po::g Makefile.am
 }
 
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index cf67a4c..7e85442 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -9,7 +9,7 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-    sed -i -e /po/d ${S}/configure.ac 
+    sed -i -e /po/d ${S}/configure.ac
     sed -i -e s:\ po::g ${S}/Makefile.am
 }
 
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 31aff87..5436b40 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -105,7 +105,7 @@ python populate_packages_prepend () {
         output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
         description = 'Evas module %s',
         allow_dirs=True, recursive=False, extra_depends="" )
-        
+
         plugin_type = "cserve2"
         bb.note( "splitting packages for evas %s..." % plugin_type )
         basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
index 6121bcd..5fa5339 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
@@ -31,6 +31,6 @@ do_configure () {
 
 do_install () {
     export DIST_ROOT=${D}
-    oe_runmake install 
+    oe_runmake install
     oe_runmake install-dev
 }
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index b413722..49a2a2f 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -75,7 +75,7 @@ FILES_${PN} += " \
                 ${datadir}/${PN}-${SHRT_VER}/templates/Press-Release.awt \
                 ${datadir}/${PN}-${SHRT_VER}/certs \
                 ${datadir}/${PN}-${SHRT_VER}/ui \
-                ${datadir}/${PN}-${SHRT_VER}/xsl* \ 
+                ${datadir}/${PN}-${SHRT_VER}/xsl* \
                 ${datadir}/${PN}-${SHRT_VER}/mime-info \
                 ${datadir}/${PN}-${SHRT_VER}/Pr*.xml \
 "
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index fbcf76f..1fc1d4f 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SECTION = "x11/gnome"
 
-DEPENDS = "gnome-doc-utils-native gtk+3 dconf gconf glib-2.0 gnome-desktop3 gtk+ pango libwnck3 gnome-menus cairo libgweather3 dbus-glib librsvg libcanberra" 
+DEPENDS = "gnome-doc-utils-native gtk+3 dconf gconf glib-2.0 gnome-desktop3 gtk+ pango libwnck3 gnome-menus cairo libgweather3 dbus-glib librsvg libcanberra"
 
 inherit gtk-doc gnome gettext pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index e3f4916..94e0a63 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -21,7 +21,7 @@ do_configure_append() {
     for i in $(find ${S} -name "Makefile") ; do
         sed -i -e s:"GCONFTOOL = .*/usr/bin/gconftool-2":"GCONFTOOL = /usr/bin/gconftool-2":g $i
         sed -i -e s:"GCONF_SANITY_CHECK = set":"GCONF_SANITY_CHECK = /usr/libexec/gconf-sanity-check-2":g $i
-    done    
+    done
 }
 
 RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-ck-connector', '', d)}"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index b94f3da..94b00c1 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
 DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring intltool-native"
 
-inherit gnome 
+inherit gnome
 
 FILES_${PN} += "${libdir}/gtk-2.0/*/filesystems/lib*.so \
                 ${libdir}/libglade/*/lib*.so \
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index be79ec1..57935c5 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -24,6 +24,6 @@ EXTRA_OECONF = "\
     --with-bz2 \
 "
 
-RDEPENDS_${PN} = "gconf" 
+RDEPENDS_${PN} = "gconf"
 
 FILES_${PN} += "${datadir}/thumbnailers"
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
index 1693f37..745b558 100644
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
+++ b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
@@ -34,7 +34,7 @@ do_configure() {
 
 do_install_append () {
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/    
+    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/
 }
 
 INITSCRIPT_NAME = "system-tools-backends"
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 3aa743e..8c39ad7 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -27,7 +27,7 @@ FILES_${PN} += "${datadir}/themes ${datadir}/icons"
 
 SRC_URI += "file://iconpath-option.patch \
     file://drop-localedir-override.patch \
-" 
+"
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index df774ee..88f69ff 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -4,7 +4,7 @@ SECTION = "gpe/libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender" 
+DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender"
 PR = "r5"
 
 inherit gpe pkgconfig autotools gtk-doc
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index c978263..c806370 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -57,5 +57,5 @@ RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux b
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
                      busybox \
-                     coreutils \ 
+                     coreutils \
                     "
diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index d6465d7..d9ee439 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -10,7 +10,7 @@ SRCREV = "3fc7dfa68484"
 S = "${WORKDIR}/${BPN}"
 
 do_configure() {
-    sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh 
+    sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh
 }
 
 do_install() {
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 8142e16..0972b61 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -21,7 +21,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 EXTRA_OECONF = "\
     --enable-run-as-root \
-    --enable-xvideo \ 
+    --enable-xvideo \
     --disable-screen --disable-caca \
     --enable-httpd --enable-vlm \
     --enable-freetype \
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index ccb4494..1aff045 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -18,7 +18,7 @@ do_configure_append () {
 }
 
 do_install () {
-    sed -i s:m600:m\ 600:g Makefile    
+    sed -i s:m600:m\ 600:g Makefile
     oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr' install
     rm -f ${D}${sysconfdir}/vpnc/vpnc.conf #This file is useless
     install ${WORKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf
diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index 0556fe2..b222c34 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
            file://atftpd-0.7_unprotected_assignments_crash.patch \
            file://atftpd.init \
-           file://atftpd.service \   
+           file://atftpd.service \
            file://atftp-0.7-sorcerers_apprentice.patch \
 "
 S = "${WORKDIR}/git"
@@ -38,7 +38,7 @@ do_install_append() {
     install -d ${D}/srv/tftp
 
     rm ${D}${sbindir}/in.tftpd
-    
+
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
 }
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 4c5eed6..b9b8334 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -34,12 +34,12 @@ do_install() {
     install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi
     install -m 0644 kernel/iscsi_trgt.ko \
     ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi/iscsi_trgt.ko
-    
+
     # Userspace utilities
     install -d ${D}${sbindir}
     install -m 0755 usr/ietd ${D}${sbindir}/ietd
     install -m 0755 usr/ietadm ${D}${sbindir}/ietadm
-    
+
     # Config files, init scripts
     mkdir -p ${D}${sysconfdir}/iet
     install -m 0644 etc/ietd.conf ${D}/${sysconfdir}/iet/ietd.conf
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
index 6619e00..9698ae4 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -88,11 +88,11 @@ do_install() {
     # System V init script
     install -d ${D}${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
-    
+
     # systemd unit configuration file
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
-    
+
     # Variable data (for drift and/or rtc file)
     install -d ${D}${localstatedir}/lib/chrony
 
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index d65c88d..a14de46 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -21,7 +21,7 @@ do_install() {
     install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
     install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
-    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
     chown -R root:root ${D}${datadir}/mof/cimv${PV}/
     for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
         sed -i -e 's/\r//g' $i
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
index 7e07be0..31ca4d2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
 
 do_configure_prepend() {
-    # force to use fallback 
+    # force to use fallback
     sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
 }
 
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 3c69548..fdf54e3 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit autotools
 
-# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from 
+# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
 # Launchpad until the next release is available from Github.
 SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
 
@@ -22,5 +22,5 @@ PACKAGECONFIG[mysql] = "--with-mysql \
                         --without-mysql,mysql5"
 
 do_configure_prepend() {
-    touch ${S}/NEWS ${S}/AUTHORS 
+    touch ${S}/NEWS ${S}/AUTHORS
 }
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 21dd1de..a53fa69 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -22,7 +22,7 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
 
 #
-# The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom 
+# The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom
 # when writing image recipes.
 # It also avoids the choice between connman/networkmanager/ifupdown since that is an image feature, not a
 # distro feature.
@@ -38,7 +38,7 @@ RDEPENDS_${PN} = "\
 # The following section is split in 3:
 #   1) Machine features: kernel modules and userspace helpers for those
 #   2) Distro features: packages associated with those
-#   3) Nice to have: packages that are nice to have, but aren't strictly needed  
+#   3) Nice to have: packages that are nice to have, but aren't strictly needed
 #
 RRECOMMENDS_${PN} = "\
     ${MACHINE_EXTRA_RRECOMMENDS} \
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 87e524d..6940d2d 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -101,7 +101,7 @@ do_install () {
 
      install -m 0755 -d ${D}${sysconfdir}/avahi/services/
      install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
-     
+
      install -d ${D}${systemd_unitdir}/system
      install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
 }
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
index 4d677ef..e7a406f 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
@@ -20,7 +20,7 @@ RDEPENDS_${PN} = "ncurses"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_compile() {
-    oe_runmake -C src all  
+    oe_runmake -C src all
 }
 
 do_install_append() {
@@ -33,7 +33,7 @@ do_install() {
         TARGET=${D}${bindir} \
         WORKDIR=${D}${localstatedir}/local/iptraf \
         LOGDIR=${D}${localstatedir}/log/iptraf \
-        LOCKDIR=${D}${localstatedir}/run/iptraf 
+        LOCKDIR=${D}${localstatedir}/run/iptraf
 }
 
 FILES_${PN} += "${bindir} ${localstatedir} /run"
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
index ab15a7e..3eadbe4 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Templatized C++ Command Line Parser"
-HOMEPAGE = "http://tclap.sourceforge.net/" 
-LICENSE = "MIT" 
+HOMEPAGE = "http://tclap.sourceforge.net/"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
 
 SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
 SRC_URI = "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \
-" 
+"
 
 S = "${WORKDIR}/git"
 inherit autotools
diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index f5d056e..b848b06 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -29,10 +29,10 @@ PACKAGES = "libxerces-c \
     xerces-c-samples \
     xerces-c-samples-dbg \
     libxerces-c-staticdev \
-" 
+"
 
 FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
-FILES_libxerces-c-dbg = "${libdir}/.debug \ 
+FILES_libxerces-c-dbg = "${libdir}/.debug \
     ${prefix}/src/debug \
 "
 FILES_libxerces-c-dev = "${libdir}/lib*.la \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 524f2a5..d477f4b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     file://0003-Add-AArch64-support.patch;patchdir=../../ \
     file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
     file://0005-aarch64-64k-page.patch;patchdir=../../ \
-    file://0001-regenerate-configure.patch;patchdir=../../ \ 
+    file://0001-regenerate-configure.patch;patchdir=../../ \
     file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
     file://fix_milestone_compile_issue.patch \
     file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
@@ -46,7 +46,7 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
 
 # mozjs requires autoreconf 2.13
 do_configure() {
-    ( cd ${S} 
+    ( cd ${S}
       gnu-configize --force
       mv config.guess config.sub build/autoconf )
     ${S}/configure ${EXTRA_OECONF}
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 41626d1..84e465d 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.4.8-default-ecdh-curve-name.patch \
            file://sblim-sfcb-1.4.9-fix-ftbfs.patch \
            file://sfcb.service"
-           
+
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
@@ -58,7 +58,7 @@ do_install() {
     install -d ${D}${sysconfdir}/init.d
     mv ${D}${sysconfdir}/init.d/sfcb ${D}${sysconfdir}/init.d/sblim-sfcb
     sed -i -e 's/\/var\/lock\/subsys\/sfcb/\/var\/lock\/subsys\/sblim-sfcb/g' ${D}${sysconfdir}/init.d/sblim-sfcb
-    
+
     rm -rf ${D}${libdir}/sfcb/*.la
 }
 
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 717fab9..bc6fec0 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -30,6 +30,6 @@ EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
 
 FILES_${PN} += " \
     ${DIR_ETC}/* \
-    ${datadir}/zsh/* \ 
+    ${datadir}/zsh/* \
     ${prefix}/src/*  \
 "
diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
index 5a98116..d729de9 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
@@ -15,7 +15,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|powerpc).*-linux"
 do_configure_prepend () {
     # Two bugs in configure.ac when cross-compiling.
     # 1. The path of libxml2. Specify it in EXTRA_OECONF.
-    # 2. hw's value on other platforms. Replace it if the target is 
+    # 2. hw's value on other platforms. Replace it if the target is
     #    not i*86/x86_64.
     if ( echo "${TARGET_ARCH}" | grep -q -e 'i.86' -e 'x86_64' ); then
         sed -i 's= -I/usr/include/libxml2=='    ${S}/configure.ac
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 78c6564..74c066f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
            file://0001-fix-build-with-KMS-disabled.patch \
            file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
-           file://0001-glamo-driver-remove-references-to-mibstore.patch \   
+           file://0001-glamo-driver-remove-references-to-mibstore.patch \
            file://0004-glamo.h-use-const-for-jbt6k74_state_path.patch \
 "
 
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
index ce13b71..06fe1a8 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib readline"
 
 SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
-           file://7001force_define_architecture.patch \ 
+           file://7001force_define_architecture.patch \
            file://7003cross_ranlib.patch \
            file://0001-cross_add_configure_option.patch \
            file://sim-ppc-drop-LIBS-from-psim-dependency.patch \
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 20983a7..3a647bf 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -19,7 +19,7 @@ SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
 "
 
 SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
-SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690" 
+SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
 
 S = "${WORKDIR}/libmad-${PV}"
 
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 145497a..330dfd3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -139,7 +139,7 @@ do_configure() {
     sed -i 's|extra_cflags="-I. $extra_cflags"|extra_cflags="-I. -I${STAGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure
     export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
     ./configure ${EXTRA_OECONF}
-    
+
 }
 
 do_compile () {
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index d023c5d..d2058ba 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=377548
 
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
-# 
+#
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 35c891e..3ef1792 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -22,7 +22,7 @@ do_configure() {
     cp -R --no-dereference --preserve=mode,links -v ${S}/autoconf/configure.in ${S}
 
     if ! [ -d ${S}/platforms/${DISTRO} ] ; then
-        cp -R --no-dereference --preserve=mode,links -v ${S}/platforms/unknown ${S}/platforms/${DISTRO} 
+        cp -R --no-dereference --preserve=mode,links -v ${S}/platforms/unknown ${S}/platforms/${DISTRO}
     fi
 
     gnu-configize --force
diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index ffb5c50..012895e 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -14,7 +14,7 @@ X11DEPENDS = " \
     libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
     libxft libxpm libxrandr libxrender \
     gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
-" 
+"
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
@@ -55,7 +55,7 @@ do_compile_prepend() {
     if [ -e $treedir ];then
         rm -rf $treedir
     fi
-    
+
     mkdir -p $treedir/${base_libdir}
 
     if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
index d859386..3e06a5a 100644
--- a/meta-oe/recipes-support/fftw/benchfft_3.1.bb
+++ b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "FFTW benchmarks"
 SECTION = "libs"
 LICENSE = "GPLv2"
 
-# single precision fftw is called fftwf 
+# single precision fftw is called fftwf
 DEPENDS = "virtual/fftw"
 
 SRC_URI = "http://www.fftw.org/benchfft/benchfft-${PV}.tar.gz"
diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-support/fftw/fftw.inc
index 1522ea0..a0adf59 100644
--- a/meta-oe/recipes-support/fftw/fftw.inc
+++ b/meta-oe/recipes-support/fftw/fftw.inc
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
 do_configure_prepend() {
-    echo 'AM_PROG_AS' >> ${S}/configure.ac 
+    echo 'AM_PROG_AS' >> ${S}/configure.ac
 }
 
 PACKAGES =+ "lib${BPN}"
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index a4273fb..9e74df5 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[systemd] = "--enable-systemd=${datadir}/${BPN}, --enable-systemd=n
 PACKAGECONFIG[sha256] = "--enable-sha256, --enable-sha256=no, openssl-native, openssl"
 PACKAGECONFIG[lanplus] = "--enable-lanplus, --enable-lanplus=no, openssl-native, openssl"
 PACKAGECONFIG[landesk] = "--enable-landesk, --enable-landesk=no"
-PACKAGECONFIG[sensors] = "--enable-libsensors, --enable-libsensors=no" 
+PACKAGECONFIG[sensors] = "--enable-libsensors, --enable-libsensors=no"
 
 #build with some GPL code
 PACKAGECONFIG[gpl] = "--enable-gpl, --enable-gpl=no"
diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-support/lcov/lcov_1.11.bb
index 5f3b889..114bd84 100644
--- a/meta-oe/recipes-support/lcov/lcov_1.11.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.11.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "LCOV is a graphical front-end for GCC's coverage testing \
 tool gcov. It collects gcov data for multiple source files and creates \
 HTML pages containing the source code annotated with coverage information. \
 It also adds overview pages for easy navigation within the file structure. \
-LCOV supports statement, function and branch coverage measurement." 
+LCOV supports statement, function and branch coverage measurement."
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index e09a539..4460be2 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -1,4 +1,4 @@
-# (c) Copyright 2012  Hewlett-Packard Development Company, L.P. 
+# (c) Copyright 2012  Hewlett-Packard Development Company, L.P.
 
 SUMMARY = "a simple, small, minimal, C++ XML parser"
 HOMEPAGE = "http://www.sourceforge.net/projects/tinyxml"
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 3638019..b0091d6 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -48,7 +48,7 @@ PACKAGES =+ "${PN}-fancontrol"
 PACKAGES =+ "${PN}-cgi"
 RRECOMMENDS_${PN}-cgi = "lighttpd lighttpd-module-cgi"
 RDEPENDS_${PN}-cgi = "${PN}-sensord rrdtool"
-FILES_${PN}-cgi = "/www/*" 
+FILES_${PN}-cgi = "/www/*"
 
 # libsensors configuration file
 FILES_${PN}-libsensors = "${sysconfdir}/sensors.d/sensors.conf"
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index ecaae4c..b8e3a2d 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -35,7 +35,7 @@ do_install() {
     done
 }
 
-FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*" 
+FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*"
 FILES_${PN} += "${bindir} ${datadir}/opencv"
 
 PNBLACKLIST[opencv-samples] ?= "Depends on blacklisted opencv"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 83e7de8..ced066f 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -69,7 +69,7 @@ python populate_packages_prepend () {
     metapkg =  pn + '-dev'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     blacklist = [ metapkg ]
-    metapkg_rdepends = [ ] 
+    metapkg_rdepends = [ ]
     packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
index 8618365..284db65 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
@@ -71,7 +71,7 @@ EXTRA_OECONF += "--enable-crypt"
 # SLAPD BACKEND
 #
 # The backend must be set by the configuration.  This controls the
-# required database. 
+# required database.
 #
 # Backends="bdb dnssrv hdb ldap mdb meta monitor ndb null passwd perl relay shell sock sql"
 #
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
index 93cbdd7..f5896e6 100644
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -61,7 +61,7 @@ do_install() {
     install -d ${D}/etc/openwbem/openwbem.conf.d
     install -d ${D}/var/adm/fillup-templates
     install -m 644 etc/sysconfig/daemons/owcimomd ${D}/var/adm/fillup-templates/sysconfig.owcimomd
-    
+
     # fix up hardcoded paths
     sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/owcimomd.service
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
index d8b64b7..e997146 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
@@ -71,8 +71,8 @@ FILES_libpurple-dev = "${libdir}/libpurple*.la \
                        ${datadir}/aclocal"
 FILES_libpurple-dbg += "${libdir}/.debug/libpurple* \
                         ${libdir}/purple-2/.debug"
-FILES_libgnt         = "${libdir}/libgnt.so.* ${libdir}/gnt/*.so" 
-FILES_libgnt-dev     = "${libdir}/gnt/*.la" 
+FILES_libgnt         = "${libdir}/libgnt.so.* ${libdir}/gnt/*.so"
+FILES_libgnt-dev     = "${libdir}/gnt/*.la"
 FILES_libgnt-dbg     = "${libdir}/gnt/.debug"
 FILES_finch          = "${bindir}/finch"
 FILES_finch-dev      = "${libdir}/finch/*.la"
diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index a308e42..f808125 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -9,6 +9,6 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
 
 SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
-          
+
 inherit autotools
 
diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
index 861f17c..770f333 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF = " --with-backend=linux"
 do_configure_prepend() {
     sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
     sed -i -e 's: doc : :g' ${S}/Makefile.am
-}    
+}
 
 RDEPENDS_${PN} += "dbus"
 RRECOMMENDS_${PN} += "pm-utils"
diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
index 7fb7e22..1aed5e0 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
@@ -4,7 +4,7 @@ distribution takes its name from this module it now exists only to provide \
 TAP::Harness with an interface that is somewhat backwards compatible \
 with Test::Harness 2.xx. If you're writing new code consider using \
 TAP::Harness directly instead. \
-\ 
+\
 Emulation is provided for runtests and execute_tests but the \
 pluggable 'Straps' interface that previous versions of Test::Harness \
 supported is not reproduced here. Straps is now available as a stand \
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
index 45c7aaa..8bc00c4 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Perl interface to the libxml2 library"
-DESCRIPTION = "This module is an interface to libxml2, providing XML and HTML parsers \ 
+DESCRIPTION = "This module is an interface to libxml2, providing XML and HTML parsers \
 with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
 interface and a XML::XPath-like interface to XPath API of libxml2. \
 The module is split into several packages which are not described in this \
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 6a93f83..5323554 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -32,13 +32,13 @@ do_install_append() {
             < ${WORKDIR}/$file.in \
             > ${WORKDIR}/$file
     done
-    
+
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
 
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gateone
-    
+
     install -m 0755 -d ${D}${sysconfdir}/avahi/services/
     install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
 
diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 464e2e0..5c9355e 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -8,7 +8,7 @@ SRC_URI[md5sum] = "05ffc6d2cc85a7fd93bb245807f715ef"
 SRC_URI[sha256sum] = "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
 
 PYPI_PACKAGE = "python-dateutil"
-inherit pypi 
+inherit pypi
 
 PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
index ac5e563..dd9799f 100644
--- a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -1,12 +1,12 @@
-DESCRIPTION = "Epydoc is a tool for generating API documentation for Python modules, based on their docstrings" 
-LICENSE = "MIT" 
+DESCRIPTION = "Epydoc is a tool for generating API documentation for Python modules, based on their docstrings"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=011c0d78eb6054d731c879132d7313f0"
-HOMEPAGE = "http://epydoc.sourceforge.net/" 
+HOMEPAGE = "http://epydoc.sourceforge.net/"
 
 SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
 SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
 
-inherit pypi distutils 
+inherit pypi distutils
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
index 64e65eb..5a1a93f 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -1,12 +1,12 @@
-SUMMARY = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API" 
-LICENSE = "Python-style" 
+SUMMARY = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API"
+LICENSE = "Python-style"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-HOMEPAGE = "http://www.python-ldap.org/" 
-DEPENDS = "python openldap" 
+HOMEPAGE = "http://www.python-ldap.org/"
+DEPENDS = "python openldap"
 
 SRC_URI = "file://setup.cfg.patch"
 SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
 SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
 
 PYPI_PACKAGE = "python-ldap"
-inherit pypi setuptools  
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
index 0a6ae7e..5b3b8bd 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "http://www.python-ldap.org/"
 DEPENDS = "python openldap cyrus-sasl"
 
 PYPI_PACKAGE = "python-ldap"
-inherit pypi setuptools  
+inherit pypi setuptools
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
 SRC_URI[md5sum] = "a15827ca13c90e9101e5e9405c1d83be"
diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
index aa2ffdb..56f0112 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python package for parsing and generating vCard and vCalendar files"
-HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
+HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 
-LICENSE = "Apache-2.0" 
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[md5sum] = "ccf66aeb1c896d8c34ac62a8b4e7ecfb"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index 5bea876..be24998 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -86,7 +86,7 @@ do_install_append() {
     # Set 'ServerName' to fix error messages when restart apache service
     sed -i 's/^#ServerName www.example.com/ServerName localhost/' ${D}/${sysconfdir}/${BPN}/httpd.conf
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then 
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
     fi
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 28cfc7f..a182458 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -8,7 +8,7 @@ inherit packagegroup
 
 RDEPENDS_${PN} = " \
     xfwm4 \
-    xfce4-session \     
+    xfce4-session \
     xfconf \
     xfdesktop \
     xfce4-panel \
@@ -25,7 +25,7 @@ RDEPENDS_${PN} = " \
     xfce4-panel-plugin-showdesktop \
     xfce4-panel-plugin-systray \
     xfce4-panel-plugin-tasklist \
-    xfce4-panel-plugin-windowmenu \   
+    xfce4-panel-plugin-windowmenu \
     xfce4-settings \
     \
     xfce4-notifyd \
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index d5ed044..808e05e 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 SRCREV = "c6683cb2cff489c16c2c7b5eab4017bb461f07f1"
 S = "${WORKDIR}/git"
 PV = "4.12.0+git${SRCPV}"
- 
+
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
 PACKAGECONFIG ??= " \
-- 
2.9.2


