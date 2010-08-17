Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OlNOG-0007my-Ut
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 16:43:53 +0200
Received: by ewy7 with SMTP id 7so3113031ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=2sYMPpycPwLulfIH3hwVLQJ9MMwMNyGhbJuplmYuFsE=;
	b=en+SXkVLjWkukRhPKmBBKUfWJM/0m5md/yhglgXSRGG1b8CW7ryQOCEgikNV0/aUU/
	8JT+RL+bQADNaiacX669ZXkQupE8UnlCOrFyzPme1H6mU60MNYJVD/BWUJ3L8hLhLnSG
	WGXQzaWrBFPkNiGpilAGJ38SaJXjkuTdEnSEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=D6yfDVdX8wMBXxHu+ZNFmZC/diybB7WRNZENBAbbgE8zUEnPAI4ansYFCDeOsqvbmp
	ajxKyIcStJNsBmTpIDnunoCJ3l/NsYyWZqI+Z0NR2Z47zQhQ//CaCduV4aJoleygMZUt
	GLSoVZU8pxs88XaXPymCes/H+tBDU4/UBNPoU=
MIME-Version: 1.0
Received: by 10.216.86.15 with SMTP id v15mr5761549wee.9.1282056191058; Tue,
	17 Aug 2010 07:43:11 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 17 Aug 2010 07:43:07 -0700 (PDT)
Date: Tue, 17 Aug 2010 10:43:07 -0400
Message-ID: <AANLkTi=h6KO6cOBo8fFa4Upu6z0R9rmJKQQSA7+9=piK@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-08-09 to 2010-08-16
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
X-List-Received-Date: Tue, 17 Aug 2010 14:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-08-09 to 2010-08-16

Andrea Adami (4):
  klibc: remove old unused 1.5 and 1.5.15 recipes.
  klibc: remove now unused OE losetup patch (upstream since 1.5.17)
  kexecboot: bump to 5e020abcb38b7dcfeb1eed2350a4221e7bda7020
  klibc: bump to 1.5.19

Christian R=FCb (1):
  advancedcaching: new version 0.6.1.5

Enrico Scholz (1):
  ncurses: swapped installation of widec and narrowc headers

Frans Meulenbroeks (208):
  cdparanoia: oe-stylize
  tgt: oe-stylize
  mythtv: removed tabs
  cdstatus: removed tabs
  MAINTAINERS: updated my entry
  openmoko: removed distro
  openmoko: removed distro
  mokoslug.conf: removed distro
  angstrom-2007-for-openmoko.inc: removed
  MAINTAINERS: removed openmoko distro maintainer as openmoko has been term=
ina
  alsa: removed old versions
  abiword: removed 2.5.2; 3 years old and default pref -1
  autoconf: remove a few old unused versions
  zziplib: remove old versions
  zeroconf 0.6.1: removed (5 years old)
  zeroconf: renamed files to zeroconf-0.9
  cdparanoia_9.8alpha.bb: removed old version
  dpkg: remove old unpinned versions
  urjtag: added git version
  mythtv: upgraded to SRCREV 25609
  serload-native: Removing legacy staging
  genboot-native: Removing legacy staging
  gcc4.2.x: patch Makefile.in for cross compile badness
  sdcc: removed old version
  libidl: remove old version 0.8.10
  intltool: removed old versions
  intltool/files: removed; was only used by now removed recipes
  gmp: removed old versions
  preferred-om-2009-versions.inc: removed; unused and om is not supported a=
ny
  gcc4.5: patch Makefile.in for cross compile badness
  guile: removed unused 1.8.5 and 1.8.6
  orbit2: removed old versions
  coreutils: removed old versions
  devio: removed some old versions
  libtool: removed some old versions
  php: removed some old versions
  apt: remvoed old 0.7.3 version
  m4: removed old version 1.4.8
  dtc: removed old 1.1 version
  gcc4.3.x: patch Makefile.in for cross compile badness
  gcc4.4.x: patch Makefile.in for cross compile badness
  sqlite: removed 3.6.2 and 3.6.5
  patchutils: remove old versions
  raptor: added recipe
  flickcurl: moved to 1.19, updated deps
  hamlib: remove old version
  xfsprogs: removed old version
  xscreensaver: removed old version
  zsh: remove old version
  openvpn: removed old versions
  openswan: removed old version
  openssh: remove old versions; these have security vulnerabilities that ar=
e s
  hostap: remove 0.4.4
  quilt: remove old versions
  quagga: remove old versions
  qemu: removed old version
  mt-daapd: removed old versions
  libmusicbrainz: remove old versions
  enchant: remove old versions
  chicken: removed old versions
  c-ares: removed old versions
  wxwidgets: removed FILESDIR
  cmake: remove old versions
  xvidcap remove old versions
  xvidcap: fixed up DEPENDS
  opie-dagger: moved to nonworking; depends on sword which is in nonworking
  nonworking/php: removed
  nonworking/icecast: removed
  nonworking/e2fsprogs:removed
  e2fsprogs: remove old versions
  minisip: moved to nonworking
  obsolete/quilt: removed; newer version exists in recipes
  obsolete/zd1211: newer version in recipes
  xvidcap: moved to 1.1.7
  xvidcap_1.1.7rc1.bb: deleted, apparently missed it in my previous commit
  vim: remved FILESDIR from inc; renamed patches dir
  vim: removed old patch
  zlib: renamed and split files dir
  zd1211: removed files dir
  zziplib: removed stale patch file
  zziplib moved files dir to zziplib
  zenity: removed old version
  pyorbit: remove old version
  libbonobo: removed old versions
  libbonoboui: remove old versions
  libwnck: remove old versions
  metacity: remove old version
  libgnomeui: removed old versions
  libgnomeprintui; remove old versions
  libgnomeprint: remove old versions
  libgnomecanvas: remove old versions
  libgnomecups: remove old versions
  libgnomekbd: remove old versions
  libgnome: remove old versions
  cheese: remove old versions
  at-spi: remove old versions
  epiphany-extensions: remove old versions
  epiphany: remove old versions
  gconf: remove old versions
  gconf-editor: remove old versions
  gdm: remove old versions
  gedit-plugins: remove old versions
  gedit: remove old versions
  gnumeric: remove old versions
  goffice: remove old versions
  gvfs: remove old versions
  system-tools-backends: remove old versions
  libxklavier: remove old versions
  libunique: remove old versions
  libsoup-2.4: remove old versions
  libsoup: remove old versions
  liboobs: remove old versions
  libgweather: remove old versions
  libgtop: remove old versions
  libgsf: remove old versions
  libgdata: remove old versions
  libart-lgpl: remove old versions
  gnome-applets: remove old versions
  gnome-bluetooth: remove old versions
  gnome-common: remove old versions
  gnome-control-center: remove old versions
  gnome-cups-manager: remove old versions
  gnome-desktop: remove old versions
  gnome-doc-utils: remove old versions
  gnome-dvb-daemon: remove old versions
  gnome-games: remove old versions
  gnome-keyring: remove old versions
  gnome-media: remove old versions
  gnome-menus: remove old versions
  gnome-mime-data: remove old versions
  gnome-panel: remove old versions
  gnome-power-manager: remove old versions
  gnome-python-desktop: remove old versions
  gnome-python-extras: remove old versions
  gnome-python: remove old versions
  gnome-session: remove old versions
  gnome-settings-daemon: remove old versions
  gnome-system-monitor: remove old versions
  gnome-system-tools: remove old versions
  gnome-terminal: remove old versions
  gnome-utils: remove old versions
  glibc-2.0: removed 2.16 recipes
  glibc-2.0: removed 2.18 recipes
  nss: remove old versions
  firefox: removed 2.0.0.3
  firefox: removed 3.0.* versions
  firefox: removed 3.1.* versions
  firefox: removed 3.5.* versions
  firefox 3.6:: remove old versions
  gtk+: remove 2.12 versions
  gtk+: remove 2.8 versions
  gtk+: remove old versions
  midori: remove old versions
  midori: missed a dir with patches
  networkmanager: remove old versions
  bluez4: remove old versions
  transmission: remove old versions
  pango: remove old versions
  pangomm: remove old versions
  evince: remove old versions
  cairomm: remove old versions
  cairo: remove old versions
  libsvg-cairo: remove old versions
  cairo-directfb: remove old versions
  busybox 1.2, 1.3:: remove old versions
  nautilus: remove old versions
  nautilus-cd-burner: remove old versions
  freetype: remove old versions
  make: removed version 3.80
  update-alternatives-dpkg: remove old versions
  apt: remove old versions
  boost: remove old versions
  boost-jam-native: remove old versions
  classpath: remove old versions
  curl: remove old versions
  db: remove old versions
  dbus: remove old versions
  dbus-glib: remove old versions
  docbook-sgml-dtd*native: remove old versions
  dpkg: remove old versions
  fontconfig: remove old versions
  genext2fs: remove old versions
  gsoap: remove old versions
  htmldoc[-gui]: remove old versions
  icon-naming-utils-native: remove old versions
  m4: remove old versions
  mpfr: remove old versions
  omniorb: remove old versions
  openssl: removed old 0.9.8 versions; these have security vulnerabilities
  python-cython 0.12: remove old versions
  python-pygobject 2.16.0: remove old versions
  qt4* removed 44.3 version
  gcc-csl-arm-2006q1.inc commented out fortran patch
  u-boot_1.3.2.bb: fixed patch filename
  wlan-ng-modules.inc: removed commended out patch (does not exist in tree)
  wpa-supplicant-0.6.inc: removed commended out patch (does not exist in tr=
ee)
  time: removed 2 commented out patches (not in tree
  python: removed sitebranding patches which were ocmmented out
  openldap: removed commented out non existing patch
  removed commented out patch (file not present either)
  mamona/gcc-noemu-4.1.1: removed old non working version
  glibc-2.6.1: added missing files
  linux-rt_2.6.24.bb: removed commented out, non-existing patch
  ilinux_2.6.23.bb removed commented out, non-existing patch
  opensimpad/openzaurus: removed patches (see below)
  Revert "openssl: removed old 0.9.8 versions; these have security vulnerab=
ili
  Revert "docbook-sgml-dtd*native: remove old versions"

Henning Heinold (1):
  libcgroup: correct the license and use the final release

Henri Bragge (1):
  gsnmp-0.3.0: fix quoting in autoconf macros

Jason Kridner (10):
  netbase: beagleboard: auto configure xM Ethernet
  beagleboard-test-image: add additional packages
  beagleboard-test-image: add devmem2
  angstrom-uboot-scripts: debugged beagleboard validation boot/user scripts
  beagleboard-test-scripts: updated to latest
  beagleboard-test-scripts: added new scripts
  u-boot: beagleboard: adjusted clocks to match PSP
  mplayer: bump PR for packages depending on jpeg which changed .so name wi=
th
  u-boot/angstrom-uboot-scripts/beagleboard-test-image: increase ramdisk
  beagleboard-test-image: add dsplink

Khem Raj (5):
  preferred-om-2008-versions.inc: Update PREFERRED_VERSION for libftdi conf=
use
  libx11_1.3.2.bb: Use Os in DEBUG_OPTIMIZATION for thumb
  klibc: Remove do_stage
  klibc: Fix staging and PR
  srctree.bbclass: Also account fot deptask

Koen Kooi (11):
  Revert "angstrom: jpeg 8b doesn't build, prefer 6b for the time being"
  omap3-sgx-modules: add patch to fix texture width detection
  gupnp: add 0.13.4
  gupnp-av: add 0.5.9
  rygel: add 0.6.0
  lmbench: fix build
  metacity: bump PR     gnome-panel: bump PR
  octave: check in WIP recipe for 3.2.4
  opkg: bump SRCREV to 550, fixes a segfault and some symlink truncation is=
sue
  xorg-xserver: bump PR
  angstrom: pin openssl to 1.0.0

Lukas M=E4rdian (1):
  libphone-ui(-shr): bump SRCREV to the 0.0.1 release

Martin Jansa (25):
  shr: cleanup distro config a bit
  pidgin: add 2.7.2 version
  xfsprogs: add 3.1.2 version
  nano: add version 2.2.5 and fix for using system ncursesw
  elementary-theme-gry: bump SRCREV
  linux(-kexecboot)-2.6.35: upgrade to latest stablepatch 2.6.35.1
  xfsprogs: stage dev headers, used later by xfsdump
  xfsdump: add recipe
  task-shr-feed: add xfsdump
  xfsdump: add xfsprogs to DEPENDS
  bash: bump PR after ncurses upgrade
  task-shr-feed: add numberx and neomis
  eglibc: build with -ggdb3 as workaround for alignment traps
  xorg: add latest versions for 2010-08-12
  qt-4.7.0-beta1: move to beta2
  navit: bump SRCREV a bit
  htop: RRECOMMENDS ncurses-terminfo
  joe: RRECOMMENDS ncurses-terminfo
  nano: RRECOMMENDS ncurses-terminfo
  procps: RRECOMMENDS ncurses-terminfo
  task-shr-feed: add supertux-qvga wesnoth
  pidgin: 2.7.2->2.7.3
  preferred-xorg-versions: remove include files for old releases
  shr: blacklist all 2.4 kernels, because of multiple ERRORs it shows in ev=
ery
  estardict: add version 0.3

Simon Busch (7):
  tzcode-native: bump version to 2010k
  tzdata: bump version to 2010k
  lvm2: rebase all recipes on a global lvm2.inc recipe
  lvm2.inc: add patch to fix building
  lvm2.inc: add machine specific configuration file
  lvm2: add configuration file for palmpre machine
  lvm2.inc: remove unnecessary EXTRA_OECONF_arm line from recipe

Stanislav Brabec (1):
  initscripts: Fixed empty machine_id returned on some devices.

Stefan Schmidt (2):
  pointercal: Add bug20 support and bump PR
  firmware: Add recipe to work with the marvell-sdio-tf-fw

Tom Rini (7):
  gcc-configure-cross.inc: Drop --with-local-prefix and --with-gxx-include-=
dir
  binutils.inc: Drop spurious CC definition.
  bitbake.conf: Add ext[23].bz2 images
  initscripts-slugos: Switch to FILESPATHPKG =3D.
  openjdk-6-common.inc: Switch to FILESPATHPKG =3D.
  squashfs-tools.inc: Switch to FILESPATHPKG =3D.
  squashfs-tools: Switch to BBCLASSEXTEND, drop legacy staging, bump PR

Vitus Jensen (3):
  canutils: remove old version 4.0.4
  libsocketcan: remove old version 0.0.7
  canutils: update to version 4.0.6


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-08-09 to 2010-08-16


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


