Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 963DD6EFE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:16:58 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so611418eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5PYog+EWALRIyhuY6R5RRi0PEa2hXUPUZtjnjtGwo28=;
	b=OXsWDJhyPONjSyGFHE04zc7nsyk+LogG+XvpoKy8V6/5jmdeIDPzMWWFqfnltEBPSB
	yzbjhx47wdRyEFS8o0a4IVv8SHYQC8864NHnsjxhORkyzU7Mt5pCkH1jpRkjLfevKnHM
	oe/UF6LhmIhuoShCmVnjOCW7lY8xpiUA8ybQNg96CX0uJLX/3Q4kMYz6hGt61XezIfQq
	LovgSOAJ8+h6RXommz70Tn7YQoDuPmOFbYY66ISx2bTP/rVP351O8RvN9yl/oM7Fo83u
	DXlP0Fcoc2iJs7Tpgt5tLcyFSpwWi7YnPckCdGqd4EcttmYvkurI+8hP/VgjlpV/W9lB
	hf5w==
X-Received: by 10.14.105.9 with SMTP id j9mr6875878eeg.71.1394039818901;
	Wed, 05 Mar 2014 09:16:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i47sm11325093eeg.6.2014.03.05.09.16.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:16:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 18:17:03 +0100
Message-Id: <1394039823-8893-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] recipes: bump PRs and remove PRINCs
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
X-List-Received-Date: Wed, 05 Mar 2014 17:17:01 -0000

* resolves following warnings:
  WARNING: Use of PRINC 17 was detected in the recipe meta-openembedded/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_git.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-smartphone/meta-android/recipes-bsp/chroot-script/chroot-script_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-core/systemd/systemd-serialgetty.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/screen/screen_4.0.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb (or one of its .bbappends)
  WARNING: Use of PRINC 11 was detected in the recipe openembedded-core/meta/recipes-bsp/keymaps/keymaps_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 11 was detected in the recipe openembedded-core/meta/recipes-core/systemd/systemd-compat-units.bb (or one of its .bbappends)
  WARNING: Use of PRINC 12 was detected in the recipe openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 13 was detected in the recipe openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-extended/pam/libpam_1.1.6.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe meta-openembedded/meta-efl/recipes-efl/efl/entrance_svn.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-bsp/formfactor/formfactor_0.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 5 was detected in the recipe meta-openembedded/meta-oe/recipes-core/meta/distro-feed-configs.bb (or one of its .bbappends)
  WARNING: Use of PRINC 5 was detected in the recipe openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-core/packagegroups/packagegroup-base.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-boot.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 7 was detected in the recipe meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb (or one of its .bbappends)
  WARNING: Use of PRINC 7 was detected in the recipe openembedded-core/meta/recipes-core/udev/udev-extraconf_1.0.bb (or one of its .bbappends)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/entrance_svn.bb                               | 2 +-
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb                  | 2 ++
 meta-gpe/recipes-support/fbreader/fbreader_git.bb                      | 2 ++
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb                   | 2 +-
 meta-oe/recipes-core/meta/distro-feed-configs.bb                       | 2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb                   | 1 +
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb                     | 2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb                            | 2 +-
 meta-oe/recipes-navigation/navit/navit.inc                             | 2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                                  | 2 +-
 meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend          | 1 -
 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend  | 2 --
 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend  | 2 --
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend  | 2 --
 meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend | 2 --
 meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend        | 2 --
 meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb         | 2 +-
 17 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 6e1f78c..198fe03 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
-PR = "r4"
+PR = "r7"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 98b9814..e9ead0f 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -5,6 +5,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
 
+PR = "r1"
+
 SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
 file://Makefile.patch \
 file://gcc45.patch"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
index 7bb826c..763889a 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
@@ -7,6 +7,8 @@ DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libf
 SRCREV = "2cf1ec0e306e1122dbed850bfa005cd59a6168ee"
 PV = "0.99.5+gitr${SRCPV}"
 
+PR = "r1"
+
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://github.com/geometer/FBReader.git;protocol=http;branch=master \
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index cebad44..cfc61d4 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -6,7 +6,7 @@ SECTION = "audio"
 
 DEPENDS = "libpng libav libsndfile1"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index 29739c2..dde8656 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Configuration files for online package repositories aka feeds"
-PR = "r1"
+PR = "r6"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
index a4e8b70..829c3b2 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
@@ -7,6 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PV = "0.0.1"
+PR = "r1"
 
 SRC_URI = "file://mplayer.conf"
 
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 3c80782..63ee55e 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -22,7 +22,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "arm"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r10"
+PR = "r13"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index e78f80e..97f3354 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r7"
+PR = "r14"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
     file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index a90203a..8b63bba 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -13,7 +13,7 @@ RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${P
 RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
 
 PE = "1"
-INC_PR = "r9"
+INC_PR = "r11"
 
 inherit autotools gettext
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 64dfd03..c2e1007 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -4,7 +4,7 @@ DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r2"
+INC_PR = "r4"
 
 
 S = "${WORKDIR}/LVM2.${PV}"
diff --git a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
index 36b83e0..bc40c60 100644
--- a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,5 +1,4 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 7}"
 
 SRC_URI += " file://keymaps.service"
 
diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index d3f4775..5b6e559 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index 495fffa..da01b05 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
index e9e09d3..1dd6d58 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
@@ -3,8 +3,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 3}"
-
 SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
 SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
 SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index 5efba3e..765f4b3 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -1,7 +1,5 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC := "${@int(PRINC) + 2}"
-
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
index 5b9181b..db55082 100644
--- a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 # Register with logind to make screen/tmux/etc work
 do_install_append() {
     echo "session required    pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
index 73f4e6e..6a66ac2 100644
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r1"
+PR = "r18"
 
 inherit systemd
 SYSTEMD_SERVICE_${PN} = ""
-- 
1.9.0


