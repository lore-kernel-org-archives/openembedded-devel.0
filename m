Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 828D7706A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38X030281; Fri, 18 Jul 2014 09:43:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4lWhuVA1NU3l; Fri, 18 Jul 2014 09:43:06 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gx2N030256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006ja-6J; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:37 +0100
Message-Id: <1405672966-25729-18-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 18/27] efl: Use automake foreign for cpu/elmdentica/enjoy/ephoto/exalt-client/flame/forecasts/places/rain/uptime
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:25 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-efl/recipes-efl/e17/cpu/configure.patch       | 13 ++++++++++
 meta-efl/recipes-efl/e17/cpu_svn.bb                |  2 ++
 .../recipes-efl/e17/elmdentica/configure.patch     | 13 ++++++++++
 meta-efl/recipes-efl/e17/elmdentica_svn.bb         |  2 ++
 meta-efl/recipes-efl/e17/enjoy/configure.patch     | 13 ++++++++++
 meta-efl/recipes-efl/e17/enjoy_git.bb              |  1 +
 meta-efl/recipes-efl/e17/ephoto/configure.patch    | 13 ++++++++++
 meta-efl/recipes-efl/e17/ephoto_svn.bb             |  2 ++
 .../recipes-efl/e17/exalt-client/configure.patch   | 28 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |  2 +-
 meta-efl/recipes-efl/e17/flame/configure.patch     | 13 ++++++++++
 meta-efl/recipes-efl/e17/flame_svn.bb              |  2 ++
 meta-efl/recipes-efl/e17/forecasts/configure.patch | 13 ++++++++++
 meta-efl/recipes-efl/e17/forecasts_svn.bb          |  4 +---
 meta-efl/recipes-efl/e17/places/configure.patch    | 13 ++++++++++
 meta-efl/recipes-efl/e17/places_svn.bb             |  2 ++
 meta-efl/recipes-efl/e17/rain/configure.patch      | 13 ++++++++++
 meta-efl/recipes-efl/e17/rain_svn.bb               |  2 ++
 meta-efl/recipes-efl/e17/uptime/configure.patch    | 13 ++++++++++
 meta-efl/recipes-efl/e17/uptime_svn.bb             |  4 +---
 20 files changed, 161 insertions(+), 7 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/cpu/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/elmdentica/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/enjoy/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/ephoto/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/exalt-client/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/flame/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/forecasts/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/places/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/rain/configure.patch
 create mode 100644 meta-efl/recipes-efl/e17/uptime/configure.patch

diff --git a/meta-efl/recipes-efl/e17/cpu/configure.patch b/meta-efl/recipes-efl/e17/cpu/configure.patch
new file mode 100644
index 0000000..87c85de
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/cpu/configure.patch
@@ -0,0 +1,13 @@
+Index: cpu/configure.ac
+===================================================================
+--- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
++++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
index c0ad6a4..14eb08f 100644
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ b/meta-efl/recipes-efl/e17/cpu_svn.bb
@@ -6,3 +6,5 @@ PV = "0.0.1+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
 require e-module.inc
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/elmdentica/configure.patch b/meta-efl/recipes-efl/e17/elmdentica/configure.patch
new file mode 100644
index 0000000..79a981b
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/elmdentica/configure.patch
@@ -0,0 +1,13 @@
+Index: elmdentica/configure.ac
+===================================================================
+--- elmdentica.orig/configure.ac	2014-07-17 21:46:14.712566207 +0000
++++ elmdentica/configure.ac	2014-07-17 21:51:34.960574935 +0000
+@@ -3,7 +3,7 @@
+ AM_CONFIG_HEADER(config.h)
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AC_PROG_CC
+ AC_GNU_SOURCE
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index e7b61a5..20a4849 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -17,3 +17,5 @@ PV = "0.9.9+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 RDEPENDS_${PN} = "${PN}-themes"
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/enjoy/configure.patch b/meta-efl/recipes-efl/e17/enjoy/configure.patch
new file mode 100644
index 0000000..6e0ed74
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/enjoy/configure.patch
@@ -0,0 +1,13 @@
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2014-07-17 21:48:51.284570474 +0000
++++ git/configure.ac	2014-07-17 21:53:39.104578318 +0000
+@@ -26,7 +26,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6 dist-bzip2)
++AM_INIT_AUTOMAKE([dist-bzip2 foreign])
+ AC_CONFIG_HEADERS(config.h)
+ _XTERM_COLORS
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta-efl/recipes-efl/e17/enjoy_git.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
index bc3168e..297cbd5 100644
--- a/meta-efl/recipes-efl/e17/enjoy_git.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -22,6 +22,7 @@ inherit e gettext
 SRC_URI = " \
     git://git.enlightenment.org/apps/enjoy.git \
     file://0001-always-use-position-as-percent-and-define-a-1-second.patch \
+    file://configure.patch \
 "
 S = "${WORKDIR}/git"
 
diff --git a/meta-efl/recipes-efl/e17/ephoto/configure.patch b/meta-efl/recipes-efl/e17/ephoto/configure.patch
new file mode 100644
index 0000000..59466f8
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/ephoto/configure.patch
@@ -0,0 +1,13 @@
+Index: ephoto/configure.ac
+===================================================================
+--- ephoto.orig/configure.ac	2014-07-17 21:48:51.028570467 +0000
++++ ephoto/configure.ac	2014-07-17 21:52:56.120577146 +0000
+@@ -27,7 +27,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6 dist-bzip2)
++AM_INIT_AUTOMAKE([dist-bzip2 foreign])
+ AM_CONFIG_HEADER(src/bin/config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index cea6f39..3255ab8 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -15,3 +15,5 @@ SRCNAME = "${PN}"
 
 # autotools-brokensep
 B = "${S}"
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/exalt-client/configure.patch b/meta-efl/recipes-efl/e17/exalt-client/configure.patch
new file mode 100644
index 0000000..d4ff801
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/exalt-client/configure.patch
@@ -0,0 +1,28 @@
+Index: exalt-client/configure.ac
+===================================================================
+--- exalt-client.orig/configure.ac	2014-07-17 21:46:14.712566207 +0000
++++ exalt-client/configure.ac	2014-07-17 21:47:56.880568991 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.8)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
+@@ -29,7 +29,6 @@
+ 
+ m4_ifdef([AM_GNU_GETTEXT], [
+ AM_GNU_GETTEXT([external])
+-po_makefile_in=po/Makefile.in
+ AM_CONDITIONAL([HAVE_PO], [true])
+ ],[
+ AM_CONDITIONAL([HAVE_PO], [false])
+@@ -101,6 +100,5 @@
+ src/Makefile
+ module.desktop
+ e_modules-exalt-client.spec
+-$po_makefile_in
+ ], [
+ ])
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index 2c7e530..f708601 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -22,4 +22,4 @@ FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/*/*/*.a"
 FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
  
-
+SRC_URI += "file://configure.patch"
\ No newline at end of file
diff --git a/meta-efl/recipes-efl/e17/flame/configure.patch b/meta-efl/recipes-efl/e17/flame/configure.patch
new file mode 100644
index 0000000..87c85de
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/flame/configure.patch
@@ -0,0 +1,13 @@
+Index: cpu/configure.ac
+===================================================================
+--- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
++++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index b674a5d..58c79a8 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -11,3 +11,5 @@ do_configure_prepend() {
     sed -i -e /po/d ${S}/configure.ac
     sed -i -e s:\ po::g ${S}/Makefile.am
 }
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/forecasts/configure.patch b/meta-efl/recipes-efl/e17/forecasts/configure.patch
new file mode 100644
index 0000000..87c85de
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/forecasts/configure.patch
@@ -0,0 +1,13 @@
+Index: cpu/configure.ac
+===================================================================
+--- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
++++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
index a030952..473bdb9 100644
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ b/meta-efl/recipes-efl/e17/forecasts_svn.bb
@@ -7,6 +7,4 @@ PR = "${INC_PR}.0"
 
 require e-module.inc
 
-
-
-
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/places/configure.patch b/meta-efl/recipes-efl/e17/places/configure.patch
new file mode 100644
index 0000000..f8f4834
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/places/configure.patch
@@ -0,0 +1,13 @@
+Index: places/configure.ac
+===================================================================
+--- places.orig/configure.ac	2014-07-17 21:51:01.276574017 +0000
++++ places/configure.ac	2014-07-17 21:52:07.096575810 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.8)
++AM_INIT_AUTOMAKE([foreign])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ AM_CONFIG_HEADER(config.h)
+ 
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 6a6184b..54f0e01 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -12,3 +12,5 @@ do_configure_prepend() {
 
 # Calls /usr/bin/eject for media
 RRECOMMENDS_${PN} += "eject"
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/rain/configure.patch b/meta-efl/recipes-efl/e17/rain/configure.patch
new file mode 100644
index 0000000..87c85de
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/rain/configure.patch
@@ -0,0 +1,13 @@
+Index: cpu/configure.ac
+===================================================================
+--- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
++++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index 0e990d5..cf67a4c 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -12,3 +12,5 @@ do_configure_prepend() {
     sed -i -e /po/d ${S}/configure.ac 
     sed -i -e s:\ po::g ${S}/Makefile.am
 }
+
+SRC_URI += "file://configure.patch"
diff --git a/meta-efl/recipes-efl/e17/uptime/configure.patch b/meta-efl/recipes-efl/e17/uptime/configure.patch
new file mode 100644
index 0000000..87c85de
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/uptime/configure.patch
@@ -0,0 +1,13 @@
+Index: cpu/configure.ac
+===================================================================
+--- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
++++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
+@@ -10,7 +10,7 @@
+ AC_CANONICAL_HOST
+ AC_ISC_POSIX
+ 
+-AM_INIT_AUTOMAKE(1.6)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
index a296a5e..5c9bfa9 100644
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ b/meta-efl/recipes-efl/e17/uptime_svn.bb
@@ -7,6 +7,4 @@ PR = "${INC_PR}.0"
 
 require e-module.inc
 
-
-
-
+SRC_URI += "file://configure.patch"
-- 
2.0.2


