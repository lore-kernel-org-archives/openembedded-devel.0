Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OPO5z-0007W9-Fh
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 01:02:05 +0200
Received: (qmail invoked by alias); 17 Jun 2010 22:57:21 -0000
Received: from p508878A5.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.120.165]
	by mail.gmx.net (mp035) with SMTP; 18 Jun 2010 00:57:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18FNYVkJKUFuQJaBEwoDZ0CiWBfbksf5uVXsk69uI
	uR4cWtsOJgrtAy
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 00:55:03 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201006161433.54486.schnitzeltony@gmx.de>
	<201006171458.29759.schnitzeltony@gmx.de>
	<hvd85i$8ce$1@dough.gmane.org>
In-Reply-To: <hvd85i$8ce$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201006180055.03306.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce 4.6.2 recipes
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
X-List-Received-Date: Thu, 17 Jun 2010 23:02:05 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46rom ef9f072f440a245dc6dcd9ab5ca8b82d7b1e243b Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Fri, 18 Jun 2010 00:26:42 +0200
Subject: [PATCH] Bump xfce recipes to version 4.6.2


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 recipes/xfce-base/exo_0.3.107.bb           |   28 +++++++++++++++++++++++++
 recipes/xfce-base/libxfce4menu_4.6.2.bb    |   12 ++++++++++
 recipes/xfce-base/libxfce4util_4.6.2.bb    |   18 ++++++++++++++++
 recipes/xfce-base/libxfcegui4_4.6.4.bb     |   17 +++++++++++++++
 recipes/xfce-base/thunar_1.0.2.bb          |   28 +++++++++++++++++++++++++
 recipes/xfce-base/xfce-terminal_0.4.5.bb   |   16 ++++++++++++++
 recipes/xfce-base/xfce-utils_4.6.2.bb      |   30 ++++++++++++++++++++++++=
+++
 recipes/xfce-base/xfce4-appfinder_4.6.2.bb |   11 ++++++++++
 recipes/xfce-base/xfce4-panel_4.6.4.bb     |   30 ++++++++++++++++++++++++=
+++
 recipes/xfce-base/xfce4-session_4.6.2.bb   |   22 +++++++++++++++++++
 recipes/xfce-base/xfce4-settings_4.6.5.bb  |   16 ++++++++++++++
 recipes/xfce-base/xfconf_4.6.2.bb          |   16 ++++++++++++++
 recipes/xfce-base/xfdesktop_4.6.2.bb       |   21 +++++++++++++++++++
 recipes/xfce-base/xfwm4_4.6.2.bb           |   31 ++++++++++++++++++++++++=
++++
 14 files changed, 296 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xfce-base/exo_0.3.107.bb
 create mode 100644 recipes/xfce-base/libxfce4menu_4.6.2.bb
 create mode 100644 recipes/xfce-base/libxfce4util_4.6.2.bb
 create mode 100644 recipes/xfce-base/libxfcegui4_4.6.4.bb
 create mode 100644 recipes/xfce-base/thunar_1.0.2.bb
 create mode 100644 recipes/xfce-base/xfce-terminal_0.4.5.bb
 create mode 100644 recipes/xfce-base/xfce-utils_4.6.2.bb
 create mode 100644 recipes/xfce-base/xfce4-appfinder_4.6.2.bb
 create mode 100644 recipes/xfce-base/xfce4-panel_4.6.4.bb
 create mode 100644 recipes/xfce-base/xfce4-session_4.6.2.bb
 create mode 100644 recipes/xfce-base/xfce4-settings_4.6.5.bb
 create mode 100644 recipes/xfce-base/xfconf_4.6.2.bb
 create mode 100644 recipes/xfce-base/xfdesktop_4.6.2.bb
 create mode 100644 recipes/xfce-base/xfwm4_4.6.2.bb

diff --git a/recipes/xfce-base/exo_0.3.107.bb b/recipes/xfce-base/exo_0.3.1=
07.bb
new file mode 100644
index 0000000..41c2a58
=2D-- /dev/null
+++ b/recipes/xfce-base/exo_0.3.107.bb
@@ -0,0 +1,28 @@
+DESCRIPTION=3D"Xfce extensions and framework library with session manageme=
nt support"
+DEPENDS =3D "libxfce4util hal liburi-perl-native python-native cairo"
+SECTION =3D "x11"
+PR =3D "r1"
+
+inherit xfce46 python-dir
+
+XFCE_VERSION =3D "4.6.2"
+
+SRC_URI +=3D " \
+    file://exo-no-tests.patch \
+    file://configure.patch \
+"
+
+# Note: Python checking is broken
+do_configure_prepend() {
+	sed -i -e s:'`$PKG_CONFIG --variable=3Ddefsdir pygtk-2.0`':\"${STAGING_DA=
TADIR}/pygtk/2.0/defs\":g ${S}/configure.in
+}
+
+FILES_${PN} +=3D "${datadir}/xfce4/ \
+                ${PYTHON_SITEPACKAGES_DIR}/* \
+                ${prefix}/share/pygtk/2.0/defs/exo-0.3/exo.defs \
+"
+
+FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/*/.debug/*"
+
+SRC_URI[md5sum] =3D "3a92cca0c99ee940db4410891c9e8498"
+SRC_URI[sha256sum] =3D "0a12ac124bad67c8de7135f7052641239ed640884a71612930=
f99c425bede2a3"
diff --git a/recipes/xfce-base/libxfce4menu_4.6.2.bb b/recipes/xfce-base/li=
bxfce4menu_4.6.2.bb
new file mode 100644
index 0000000..663944a
=2D-- /dev/null
+++ b/recipes/xfce-base/libxfce4menu_4.6.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION=3D"a freedesktop.org compliant menu library for Xfce4"
+HOMEPAGE=3D"http://www.xfce.org/projects/libraries"
+DEPENDS =3D "gettext pkgconfig libxfce4util intltool"
+RDEPENDS_${PN} =3D "gtk+ libxfce4util"
+
+LICENSE=3D"LGPL-2 FDL-1.1"
+PR =3D "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] =3D "ff10cacb76803ee37159e3a43345f0d1"
+SRC_URI[sha256sum] =3D "62352be57318d6f241c4f6e4b6f9303d0b80246ea8f6e4753a=
962360a9965162"
diff --git a/recipes/xfce-base/libxfce4util_4.6.2.bb b/recipes/xfce-base/li=
bxfce4util_4.6.2.bb
new file mode 100644
index 0000000..67aba2e
=2D-- /dev/null
+++ b/recipes/xfce-base/libxfce4util_4.6.2.bb
@@ -0,0 +1,18 @@
+# libxfce4util OE build file
+
+DESCRIPTION =3D "Basic utility library for Xfce4"
+SECTION =3D "x11/libs"
+LICENSE =3D "GPL"
+DEPENDS =3D "glib-2.0 xfce4-dev-tools "
+PR =3D "r0"
+
+inherit xfce46
+
+EXTRA_OECONF +=3D "--disable-dependency-tracking --disable-static --with-b=
roken-putenv=3Dyes"
+
+MACROS=3D"m4/X11.m4 m4/debug.m4 m4/depends.m4 m4/i18n.m4"
+
+FILES_${PN}-dev +=3D " ${datadir}/xfce4/m4"
+
+SRC_URI[md5sum] =3D "9c3129d827d480f0906c575e7a13f1e9"
+SRC_URI[sha256sum] =3D "ae2e7ed1000bb0b3589643a39a65e6ab64c9ee198045e7b272=
604986f2e18c83"
diff --git a/recipes/xfce-base/libxfcegui4_4.6.4.bb b/recipes/xfce-base/lib=
xfcegui4_4.6.4.bb
new file mode 100644
index 0000000..255f482
=2D-- /dev/null
+++ b/recipes/xfce-base/libxfcegui4_4.6.4.bb
@@ -0,0 +1,17 @@
+# libxfcegui4 OE build file
+
+DESCRIPTION =3D "Xfce4 Widget library and X Window System interaction"
+DEPENDS =3D "gettext pkgconfig intltool virtual/libx11 libxfce4util xfconf=
 dbh libxml2 gtk+ libglade"
+RDEPENDS_${PN} =3D "xfconf startup-notification "
+
+SECTION =3D "x11/libs"
+PR =3D "r0"
+
+inherit xfce46
+
+LEAD_SONAME =3D "libxfcegui4.so.4"
+
+FILES_${PN} +=3D "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${da=
tadir}/xfce4/mime ${datadir}/icons/hicolor"
+
+SRC_URI[md5sum] =3D "88de59b222cb9977f93a4c61011c1e1f"
+SRC_URI[sha256sum] =3D "c37e407dc00fb87dc16758d53e69edeac7b32aa76c5fcad2b7=
84cf22f58af421"
diff --git a/recipes/xfce-base/thunar_1.0.2.bb b/recipes/xfce-base/thunar_1=
=2E0.2.bb
new file mode 100644
index 0000000..d35c44d
=2D-- /dev/null
+++ b/recipes/xfce-base/thunar_1.0.2.bb
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "File manager for the Xfce Desktop Environment"
+HOMEPAGE=3D"http://thunar.xfce.org"
+DEPENDS =3D "exo dbus-glib libexif xfce4-panel libice libsm gamin"
+RDEPENDS_${PN} =3D "libxfcegui4 exo dbus-glib libexif xfce4-panel libice l=
ibsm gamin"
+RRECOMMENDS_${PN} =3D "shared-mime-info"
+SECTION =3D "x11"
+PR =3D "r0"
+
+inherit xfce46
+
+XFCE_VERSION =3D "4.6.2"
+
+SRC_URI =3D "http://www.us.xfce.org/archive/xfce-${XFCE_VERSION}/src/Thuna=
r-${PV}.tar.bz2"
+
+S =3D "${WORKDIR}/Thunar-${PV}/"
+
+EXTRA_OECONF +=3D "--disable-dependency-tracking --enable-dbus"
+
+FILES_${PN} +=3D "${libdir}/thunarx-1/*.so \
+		${libdir}/thunarx-1/*.la \
+                ${datadir}/dbus-1 \
+                ${datadir}/thumbnailers \
+                ${datadir}/Thunar \
+                ${datadir}/xfce4"
+FILES_${PN}-dbg +=3D "${libdir}/thunarx-1/.debug/ ${libexecdir}/xfce4/pane=
l-plugins/.debug/"
+
+SRC_URI[md5sum] =3D "c91073202d373a1f9951a1240083c36d"
+SRC_URI[sha256sum] =3D "75829b34a68346b33f66882bedc9794d580c200d11af225418=
85750459b55c03"
diff --git a/recipes/xfce-base/xfce-terminal_0.4.5.bb b/recipes/xfce-base/x=
fce-terminal_0.4.5.bb
new file mode 100644
index 0000000..2d5f94e
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce-terminal_0.4.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Terminal emulator for the Xfce desktop environment"
+DEPENDS =3D "exo vte dbus-glib gtk+"
+RDEPENDS_${PN} +=3D "gnome-pty-helper"
+PR =3D "r0"
+
+inherit xfce46
+
+SRC_URI =3D "http://www.xfce.org/archive/src/apps/terminal/0.4/Terminal-${=
PV}.tar.bz2 \
+"
+
+S =3D "${WORKDIR}/Terminal-${PV}"
+
+FILES_${PN} +=3D "${datadir}/Terminal"
+
+SRC_URI[md5sum] =3D "3c707628e2e97c6d9566cd74d400036a"
+SRC_URI[sha256sum] =3D "92fddcbc1422076672d8ec61832793d4ceea2fc0db7d724a6a=
cde0ec2bac8893"
diff --git a/recipes/xfce-base/xfce-utils_4.6.2.bb b/recipes/xfce-base/xfce=
=2Dutils_4.6.2.bb
new file mode 100644
index 0000000..08048c4
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce-utils_4.6.2.bb
@@ -0,0 +1,30 @@
+DESCRIPTION=3D"Xfce4 Utilities"
+DEPENDS =3D "virtual/libx11 libxfcegui4"
+SECTION =3D "x11"
+PR =3D "r0"
+
+inherit xfce46
+
+FILES_${PN} +=3D " \=20
+        ${bindir}/* \
+        ${datadir}/dbus-1/* \
+        ${datadir}/xfce4/AUTHORS \
+        ${datadir}/xfce4/BSD \
+        ${datadir}/xfce4/COPYING \
+        ${datadir}/xfce4/GPL \
+	${datadir}/xfce4/INFO* \
+        ${datadir}/xfce4/LGPL \
+        ${datadir}/xfce4/AUTHORS.html \
+        ${datadir}/xfce4/BSD.html \
+        ${datadir}/xfce4/COPYING.html \
+        ${datadir}/xfce4/GPL.html \
+	${datadir}/xfce4/INFO.html \
+        ${datadir}/xfce4/LGPL.html \
+        ${datadir}/xsessions/xfce.desktop \
+"
+
+# NOTE:  This package takes a --with-browser for the default browser
+# NOTE:  Works with gdm also gtkhtml
+
+SRC_URI[md5sum] =3D "5d23407700d7e8c9751e17a5bc955109"
+SRC_URI[sha256sum] =3D "54efc2038bfbd5acaadfc91ed91fb3dfd6cec64f9402f364ac=
cce7bcafe2ba7a"
diff --git a/recipes/xfce-base/xfce4-appfinder_4.6.2.bb b/recipes/xfce-base=
/xfce4-appfinder_4.6.2.bb
new file mode 100644
index 0000000..a73383d
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce4-appfinder_4.6.2.bb
@@ -0,0 +1,11 @@
+# xfce4-appfinder build file
+
+DESCRIPTION=3D"Xfce4 Application Finder"
+DEPENDS=3D"libxfcegui4 libxfce4menu thunar"
+SECTION =3D "x11"
+PR =3D "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] =3D "7752e43578b821e35010bcd3762da166"
+SRC_URI[sha256sum] =3D "a1bf35b838922a7f81f588c727a6ef2f56b1bed0c46f7c36b2=
09ac336f7e492a"
diff --git a/recipes/xfce-base/xfce4-panel_4.6.4.bb b/recipes/xfce-base/xfc=
e4-panel_4.6.4.bb
new file mode 100644
index 0000000..fe402b8
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce4-panel_4.6.4.bb
@@ -0,0 +1,30 @@
+# xfce4-panel OE build file
+
+DESCRIPTION =3D "Xfce4 Panel"
+DEPENDS =3D "virtual/libx11 startup-notification libxfcegui4 libxml2 exo l=
ibwnck"
+SECTION =3D "x11"
+PR =3D "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] =3D "82f10a42aefca4cc26a6633e7478cc65"
+SRC_URI[sha256sum] =3D "cc9b70bdc73ab80f46655a34cdbaf876a67cd90b50230cbf4d=
77a3106a5c54e7"
+
+EXTRA_OECONF +=3D " --enable-startup-notification"
+
+do_install() {
+    oe_runmake DESTDIR=3D${D} install
+}
+
+python populate_packages_prepend() {
+	plugin_dir =3D bb.data.expand('${libdir}/xfce4/panel-plugins/', d)
+	plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)
+	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+	                  '${PN} plugin for %s', extra_depends=3D'', prepend=3DTr=
ue,
+	                  aux_files_pattern=3D['${datadir}/xfce4/panel-plugins/%s=
=2Edesktop',
+	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
+	                                     '${datadir}/icons/hicolor/48x48/apps=
/*-%s.png',
+	                                     '${bindir}/*%s*'])
+}
+
+PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-base/x=
fce4-session_4.6.2.bb
new file mode 100644
index 0000000..c85bb8c
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop Env=
ironment"
+DEPENDS =3D "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
+SECTION =3D "x11"
+
+PR =3D "r0"
+
+inherit xfce46
+
+RDEPENDS_${PN} =3D "iceauth xfce-utils xinit dbus-x11"
+
+FILES_${PN} +=3D "${libdir}/xfce4/splash/engines/*.so"
+FILES_${PN} +=3D "${datadir}/xfce4/tips/*"
+FILES_${PN} +=3D "${datadir}/themes/Default/balou/*"
+
+FILES_${PN}-dbg +=3D "${libdir}/xfce4/splash/engines/.debug/*.so"
+FILES_${PN}-dbg +=3D "${libdir}/xfce4/splash/engines/.debug/*.a"
+
+FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.la"
+FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.a"
+
+SRC_URI[md5sum] =3D "9d9890130e45e0e9476591ed9ba2c9d5"
+SRC_URI[sha256sum] =3D "725e269254c34c530acb670f5ccd0fd69b57cbe9f2176abd84=
99fc5d6dcd30a8"
diff --git a/recipes/xfce-base/xfce4-settings_4.6.5.bb b/recipes/xfce-base/=
xfce4-settings_4.6.5.bb
new file mode 100644
index 0000000..65e4869
=2D-- /dev/null
+++ b/recipes/xfce-base/xfce4-settings_4.6.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Xfce4 settings"
+HOMEPAGE =3D "http://www.xfce.org"
+SECTION =3D "x11/wm"
+LICENSE =3D "GPL-2"
+
+DEPENDS =3D "virtual/libx11 virtual/xserver libxi libwnck xrandr exo libxf=
ce4util libxfcegui4"
+
+PR =3D "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] =3D "f988cb732913b5fbc115ad7105d2231e"
+SRC_URI[sha256sum] =3D "1601b8d2cac5d931c39bed7e331c5bd91018d0e56663295e7a=
083a2c78fe168b"
+
+RDEPENDS_${PN} =3D "xfconf exo"
+
diff --git a/recipes/xfce-base/xfconf_4.6.2.bb b/recipes/xfce-base/xfconf_4=
=2E6.2.bb
new file mode 100644
index 0000000..3db4c91
=2D-- /dev/null
+++ b/recipes/xfce-base/xfconf_4.6.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Xfce configuration daemon and utilities"
+HOMEPAGE =3D "http://www.xfce.org"
+SECTION =3D "x11/wm"
+LICENSE =3D "GPL-2"
+
+DEPENDS =3D "libxfce4util"
+RDEPENDS_${PN} =3D "libxfce4util"
+
+PR =3D "r0"
+
+inherit xfce46
+
+FILES_${PN} +=3D "${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+
+SRC_URI[md5sum] =3D "5ff93c15077c6dbbcd38c437bc1ab2ef"
+SRC_URI[sha256sum] =3D "7b2635abc33ae6a76145238ed27557bc1ff91b1a5ee0757962=
f798a66d56f478"
diff --git a/recipes/xfce-base/xfdesktop_4.6.2.bb b/recipes/xfce-base/xfdes=
ktop_4.6.2.bb
new file mode 100644
index 0000000..c3a3bca
=2D-- /dev/null
+++ b/recipes/xfce-base/xfdesktop_4.6.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "Xfce4 Desktop Manager"
+SECTION =3D "x11/base"
+
+DEPENDS =3D "virtual/libx11 exo libxfcegui4 xfce4-panel thunar gtk+"
+RDEPENDS_${PN} =3D "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
+PR =3D "r0"
+
+inherit xfce46
+
+do_configure() {=20
+   oe_runconf
+}
+
+FILES_xfdesktop-backdrops =3D "${datadir}/xfce4/backdrops/*"
+FILES_${PN} +=3D "${libdir}/xfce4/panel-plugins/*.so \
+                ${libdir}/xfce4/panel-plugins/xfce4-menu-plugin \
+                ${datadir}/xfce4/panel-plugins/*.desktop"
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug"
+
+SRC_URI[md5sum] =3D "e800ea9fee7a5c5eaf2ae96e23a83e3a"
+SRC_URI[sha256sum] =3D "cd760f95486ba3f1c6d0179bb10a4c21c99c1d459dd8265823=
fed85f7376a3fb"
diff --git a/recipes/xfce-base/xfwm4_4.6.2.bb b/recipes/xfce-base/xfwm4_4.6=
=2E2.bb
new file mode 100644
index 0000000..3ea7f52
=2D-- /dev/null
+++ b/recipes/xfce-base/xfwm4_4.6.2.bb
@@ -0,0 +1,31 @@
+# xfwm4 OE build file
+
+DESCRIPTION=3D"Xfce4 Window Manager"
+SECTION =3D "x11/wm"
+PR =3D "r0"
+
+inherit xfce46 update-alternatives
+
+FILES_${PN} +=3D "${datadir}/xfwm4/defaults ${datadir}/xfwm4/themes/defaul=
t.keys/*"
+
+DEPENDS =3D "startup-notification virtual/libx11 libxpm libxfce4util libxf=
cegui4"
+RDEPENDS_${PN} =3D "xfwm4-theme-default"
+
+EXTRA_OECONF +=3D " --enable-startup-notification"
+
+PACKAGES_DYNAMIC +=3D "xfwm4-theme-*"
+
+python populate_packages_prepend () {
+	themedir =3D bb.data.expand('${datadir}/themes', d)
+	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s=
', allow_dirs=3DTrue)
+}
+
+ALTERNATIVE_NAME =3D "x-window-manager"
+ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
+ALTERNATIVE_PATH =3D "${bindir}/xfce4-session"
+ALTERNATIVE_PRIORITY =3D "30"
+
+FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/xfwm4/.debug/*"
+
+SRC_URI[md5sum] =3D "3e6c0c54b028b6ea60e865e55ecdf3f8"
+SRC_URI[sha256sum] =3D "212819ee03c24635f79d50930284c422469e22489952d0b286=
e6fe5af2155828"
=2D-=20
1.5.3.4


