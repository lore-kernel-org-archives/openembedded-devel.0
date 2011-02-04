Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PlNWg-0008En-Od
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:24:48 +0100
Received: by pvd12 with SMTP id 12so416963pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=UjgxW1UTyU21pKioZ+Ysou2DBykqGKu1Iy9DrxUyjNA=;
	b=ZJ+5atROI63X/8j4PJRaLGpP8GJjSeh0+0fWFh1YayprnjBXGldBkhjBsKG3oXWz1+
	/dLRs5YIyb3wDIyWbOFMywjm3six4S65zXLfox1WKbJOJouWCNNfhNiVbpZBVBotDRDz
	uqJNIhQ9Nq+n3Ta2AYYgSDV3TVUx4Fetc286E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=GEaMyLI+VMOKKjaKl+65chIgW+th3loKWDIRfILl452/BuraQnyzwEiry0VmiutD8G
	89AFIcFzkdSQGwFMJZAlSgxCLWcLUjzYchC3xGwG9qIn9L94g3wZ6Jhkcwt/Diw8p2nV
	ORXCHXelao3d3H1IPTLKO+WADKn/1alxUP8Gs=
MIME-Version: 1.0
Received: by 10.142.163.19 with SMTP id l19mr40634wfe.202.1296833026391; Fri,
	04 Feb 2011 07:23:46 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 4 Feb 2011 07:23:46 -0800 (PST)
Date: Fri, 4 Feb 2011 10:23:46 -0500
Message-ID: <AANLkTi=7rXwOkt7HybRDGbp+5xAo8hu0a6zKhD_5h2Wm@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for org.openembedded.dev, 2011-01-24 to 2011-01-31
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
X-List-Received-Date: Fri, 04 Feb 2011 15:24:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2011-01-24 to 2011-01-31

Alessandro Sappia (1):
  qt-demo-init: Corrected a typo in qtdemo-init script

Alex Ferguson (1):
  midpath: Make sdl-fixes patch external

Andrea Adami (13):
  linux-kexecboot: reset DEFAULT_PREFERENCE =3D "-1"
  klibc: move to latest 1.5.21
  MAINTAINERS: add committer's entry.     Signed-off-by: Andrea Adami <andr=
ea.
  initramfs-module-kexecboot: fix RDEPENDS after kexec-tools changes.
  task-devimage: fix RDEPENDS on kexec-tools.
  task-shr-feed: fix RDEPENDS on kexec-tools.
  slugos-packages: Fix reference to kexec-tools package.
  linux-kexecboot: add more Zaurus defconfigs for testing 2.6.37
  linux-kexecboot: new round of cleaning for 2.6.37 Zaurus defconfigs
  linux-kexecboot: move SRCREV and bump to 2.6.38-rc2
  linux-kexecboot_git: refresh Zaurus defconfigs
  linux-kexecboot_git: update Zaurus defconfigs for 2.6.38-rc2
  linux-kexecboot_git: return to DEFAULT_PREFERENCE=3D"-2"

Andreas Oberritter (25):
  python-zopeinterface-3.5.1: fix packaging
  module.bbclass: fix RDEPENDS version syntax
  char-driver: fix RDEPENDS version syntax
  gpio-event: fix RDEPENDS version syntax
  hostap: fix RDEPENDS version syntax
  klibc: fix RDEPENDS version syntax
  madwifi: fix RDEPENDS version syntax
  networkmanager: fix RDEPENDS version syntax
  prism54: fix RDEPENDS version syntax
  python: fix RDEPENDS version syntax
  robostix: fix RDEPENDS version syntax
  robostix-module: fix RDEPENDS version syntax
  sablevm: fix RDEPENDS version syntax
  shfs: fix RDEPENDS version syntax
  wifistix: fix RDEPENDS version syntax
  wireshark: fix RDEPENDS version syntax
  char-driver: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${=
KERNE
  gpio-event: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${K=
ERNEL
  madwifi: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${KERN=
EL_VE
  prism54: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${KERN=
EL_VE
  robostix: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${KER=
NEL_V
  robostix-module: depend on kernel-${KERNEL_VERSION} instead of kernel (=
=3D ${K
  wifistix: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D ${KER=
NEL_V
  module.bbclass: depend on kernel-${KERNEL_VERSION} instead of kernel (=3D=
 ${KE
  kernel.bbclass: Add kernel-* to PACKAGES_DYNAMIC

Chris Larson (8):
  bitbake.conf: include bin dirs from BBPATH in PATH
  Move stage-manager-* into bin/ rather than a recipe
  Add install wrapper rather than coreutils-native
  cml1: fix the case of the variables in menuconfig
  siteinfo: add linux-gnu os
  file: make 5.04 relocatable
  bin/install: use '.' not source, and use -eq not =3D=3D
  openswan: fix build with install wrapper

Denis 'GNUtoo' Carikli (2):
  xfdesktop 4.6.2: fix compilation
  xserver-xorg-conf: htcdream: switch to htcdream version of the US keyboar=
d

Frans Meulenbroeks (2):
  tzcode: moved to 2011a
  tzdata: updated to 2011a

Jeff Lance (2):
  matrix-gui-common: Support SVG icons
  matrix-gui: Update to the latest SRCREV

Khem Raj (17):
  udev: Remove duplicate udev firmware loading rule
  opkg-utils_svn.bb: Sync with yocto
  classes/package_ipk.bbclass,classes/sourceipk.bbclass: Use opkg-utils-nat=
ive
  recipes/meta recipes/tasks: Replace ipkg-utils with opkg-utils
  slugos.inc: Dont lock SRCDATE for ipkg, its not used anymore
  ipkg-utils: Remove the recipes
  classes: Replace ipkg-make-index with opkg-make-index
  bitbake.conf,nylon.conf,openwrt-sdk.conf: Use opkg-build instead of ipkg-=
bui
  angstrom/personal-feed.sh,angstrom/sort.sh: Replace ipkg-make-index with =
opk
  stage-manager: Use opkg utilities
  Recipes: Replace ipkg-utils with opkg-utils
  uclibc: Add copysignl implementation for powerpc to uclibc
  samba: Fix build issue on uclibc/arm/thumb
  git: Upgrade recipes from 1.7.0.2 -> 1.7.3.5
  libpng.inc: Fix unfetchable SRC_URI
  glib-2.0-native_2.22.1.bb: It should not be used anymore after BBCLASSEXT=
END
  uclibc_git.bb: Remove patches applied upstream and update to latest git/m=
ast

Klaus Kurzmann (1):
  task-shr-feed: add sflphone-common

Koen Kooi (16):
  linux-omap4: tweak panda defconfig a bit
  htop: update to 0.9
  xf86-video-omapfb: bump SRCREV a bit
  xf86-video-omapfb: bump SRCREV to latest, apply patches to keep XV workin=
g
  opencv,opencv-samples: add 2.2
  gstreamer: add 0.10.32
  gst-plugins-base: add 0.10.32
  gst-plugins-bad: add 0.10.21
  omapfbplay: import 3 patches from git to fix playing weird sized videos
  omapfbplay: fix patch dir
  x-load-git: add header to beagle name patch
  linux-omap 2.6.37: add Laurents ISP patchset
  avahi: integrate python into main recipe
  libgles-omap3: add 4.03.00.01 release
  x-load git: bump SRCREV, refresh patches
  u-boot git: move overo to 2010.12

Leon Woestenberg (2):
  p2020rdb: New Freescale QorQ P2 machine, based on p1020rdb (P1)
  adb4000.conf: New machine, kernel and u-boot support.

Martin Jansa (29):
  libxp: move from 1.0.0 to 1.0.1
  pixman: upgrade from 0.21.2 to 0.21.4
  e-base: bump EFL_SRCREV a bit
  libxi: upgrade from 1.4.0 to 1.4.1
  xbiff: upgrade from 1.0.2 to 1.0.3
  git-1.7.3.5: fix git-less-hardlinks.diff and rename files dir to git-1.7.=
3.5
  e-base: prepare for releases
  efl: remove unused files/mkinstalldirs
  places: remove patch with really old maxrev
  e-wm: drop patches with really old maxrev
  evas: introduce 1.0.0
  edje: introduce 1.0.0
  embryo: introduce 1.0.0
  edbus: introduce 1.0.0
  eet: introduce 1.4.0
  eeze: introduce 1.0.0
  efreet: introduce 1.0.0
  ecore: introduce 1.0.0
  eina: introduce 1.0.0
  python-edbus: simplify recipe
  esmart,eflpp,entrance: move to obsolete
  ewl: move to obsolete
  exml, enhance: move to obsolete
  ecore: fix checksum
  waker: fix build without ecore_string_init and ecore_string_shutdown
  e-tasks: add patch for changed genlist_item_insert_before api
  mplayer_git: bump SRCREV
  MAINTAINERS: fix my entry
  xserver-xorg: upgrade from 1.9.3.901 to 1.9.3.902 (1.9.4 RC2)

Martin Panter (1):
  Fail if the cpio command is missing (v3)

Mike Westerhof (6):
  SlugOS: slugos.inc, task-slugos.bb - Debugging improvements     Adds devs=
hel
  SlugOS: sysconf - pass along hostname to DHCP server     This change will=
 re
  SlugOS: slugos-init -- add boot/kexec script for kernel development     (=
thi
  SlugOS: Bump up to SlugOS 5.7 with kernel 2.6.29     - drop CONFIG_SYSFS_=
DEP
  SlugOS: sysconf - change cpio usage from "crc" format to "newc" format   =
  (
  SlugOS: initscripts - rework reboot for clean kexec     (Borrowed extensi=
vel

Ryan D Phillips (1):
  bind: Add DISTRO_FEATURES support for ipv6

Scott Garman (1):
  sudo: upgrade to 1.7.4p6

Simon Busch (10):
  initscripts-shr: remove devtmpfs initscript for palmpre machine
  shr-image: use default IMAGE_DEV_MANAGER and not devtmpfs
  palmpre machine: add udev-compat preferred provider
  udev-162: add udev-compat configuration for palmpre machine
  linux-palmpre: adopt to new kernel version and bump SRCREV
  palmpre machine: bump kernel PR
  xserver-nodm-init: reorder xserver-nodm to start position 90 for shr dist=
rib
  palmpre machine: split MACHINE_EXTRA_DEPENDS into lines
  palmpre machine: add compat-wireless-2.6-old to MACHINE_EXTRA_RDEPENDS
  shr-autorev.inc: add libshr-glib

Stefan Schmidt (5):
  buglabs-ppp-scripts: Some scripts to enable BUG for different broadband p=
rov
  angstrom-jalimo.conf: Bump icedtea6-native version to 1.7.6
  felix: Add recipes for the felix OSGi implementation
  concierge: Add OSGi R3 implementation and service tracker
  buglabs-osgi: BugLabs OSGi modules

Tom Rini (7):
  openssl.inc: Simplify our check for a 'linux' OS.
  p2020rdb: Add xserver-xorg stuff
  openswan: Fix a build race in libipsecconf
  Revert "bind: Add DISTRO_FEATURES support for ipv6"
  python-native: Mangle shebang-invoking scripts
  slugos.inc: Use ?=3D on SOURCE_MIRROR_URL
  base.bbclass: Update build_summary for bitbake 1.8.x

V=EDctor Manuel J=E1quez Leal (3):
  minimal.conf: inherit devshell task
  python-scons_1.3.0: add missing dependencies
  python-scons_1.3.0: fix licence type


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5498 FIXED       Problem with glib-2.0-native under distro minimal

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


