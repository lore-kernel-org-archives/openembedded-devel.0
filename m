Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1N7b9n-00012I-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 21:48:14 +0100
Received: by ewy5 with SMTP id 5so3334757ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 12:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=wyjNwdvGvOos4h3hVjsdCPPteyhloTrlrmRPX1wC8ZU=;
	b=oq6irUrmyWgchMykn4J7CnEyMn/sZEobsaHuMmPM8d4QBvKrUZyeSCLgvZwqrKz+/+
	I1lzdMK3quUJbCWTieQ7Wxg8idySD0IeQlUa2SDUj+g7KyBJbHdSRvG12HPibVMapmsg
	sj0bW1znJkO4bxILe8xx2mdCl7/HdnrVoFMPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LvCRxJXeGZKEbLhqUvpd++LqnXeQ2KeTQOWGbiQdQuSlmBnV+er03lUq6HpPEUbbzd
	xlpLX3kV870bHDGnfM++8XiIhDnKFdD2kmF0vA71yjPIxYnL4KbKjkja8BLULKGgx8Ba
	Me/3emuJW7K4h0ZFXgB9HjEiUe1fCDOYjHA2k=
MIME-Version: 1.0
Received: by 10.216.86.137 with SMTP id w9mr2821382wee.104.1257799611458; Mon, 
	09 Nov 2009 12:46:51 -0800 (PST)
Date: Mon, 9 Nov 2009 15:46:51 -0500
Message-ID: <f96d234e0911091246n7183d1b8tace0318e32670386@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-11-02 to 2009-11-09
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
X-List-Received-Date: Mon, 09 Nov 2009 20:48:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-11-02 to 2009-11-09

Alexandre Tisserant (1):
  gecko-mediaplayer: make ai-flash.js work with midori as well

Andrea Adami (6):
  kexecboot-cfg: Deploy default icon. Bump PR.
  kexecboot-cfg: Center OpenEmbedded 32x32 icon.
  kexecboot: remove older releases incompatible with new boot.cfg.
  checksums.ini: purge deprecated kexecboot entries.
  kexecboot-cfg: sync boot.cfg with upstream. Bump PR.
  kexecboot_git: bump to 40e5be92f045f2a7cfc918f4b1acc42f6cc013e9 and

Artur Wronowski (2):
  libpar2: new recipe; multi-part archives library
  nzbget: new recipe; a command-line based binary newsgrabber for nzb files

Brijesh Singh (6):
  gstreamer-ti svn: bump up svn rev and add boot script
  bc-cat-omap 0.1.0: add recipe to build bc-cat module.
  libgles-omap3.inc: use libpvrPVR2D_FRONTWSEGL.so
  task-gstreamer-ti: do not install gst-ti on am3517 platform
  ti-demo-x11-image: add task and image for build x11 based demo image for =
TI
  ti-dmai_svn: bumup svn rev

Chris Larson (3):
  prelink: pull in /etc/cron.daily/prelink in the postinst.
  autofs: switch to a .inc.
  opkg: Don't prompt for user input from stdin if it's not a tty.

David Lanzend=C3=B6rfer (1):
  linux-replicant: new recipe; kernel tree for HTC devices

David-John Willis (7):
  omap3-pandora.conf: Merge in latest machine file.
  omap3-pandora.conf: Line endings.
  u-boot-omap3pandora: Bump SRCREV to fix issue with loading without an EXT=
 bo
  xserver-xorg-conf: Update xorg.conf for the omap3-pandora. i.e. cut out a=
 lo
  avahi: Bump packages to 0.6.25 (security fix) and add checksums.
  xfce4-panel: Add new upstream 4.6.2 release and checksums.
  tracker: Add 0.6.95 release and series of patches to support cross compil=
e.

Frans Meulenbroeks (32):
  myththemes: created recipe
  cdparanoia: created svn recipe
  taglib: also install .tcc files in staging
  mythplugins: added mythmusic; fixed configure patch, remove unneeded Myth=
Bac
  mythplugins: fixed remaining staging issues
  mysql: fixed mysql_config in staging
  mythplugins: added zoneminder, cleaned up images in do_stage
  qt4-x11-free.inc: bumped PR to force recompilation so it uses the fixed m=
ysq
  mysql: changed postinstall: pid file goes to /var/run/mysql i.s.o /var/ru=
n a
  mythplugins: add zoneminder package
  mythtv: added dependency to glibc-gconv-utf-16
  mysql: moved pid dir from /var/run/mysql to /var/lib/mysql as /var/run is=
 cr
  mysql5: created recipe
  mythtv: added mc.sql; introduced database package for that one (similar t=
o d
  xmltv: moved from 0.5.54 to 0.5.56
  checksusm: added checksum for xmltv 0.5.56
  libxml-twig-perl: forgot to bump PR, here it is
  mysql5: added missing file misc.m4.patch
  mysql5: added DEPENDS to -native, reworked packaging
  grun: added recipe (created by tovarish, bugzilla 5067)
  texi2html: added recipe contributed by Lynn Lin (bugzilla #4759)
  help2man: added recipe created by Lynn Lin (bugzilla #4774)
  mysql5: fixed packaging

Henning Heinold (2):
  cmake.bbclass: use staging from autotools too
  boost: add new version 1.4.0

Holger Hans Peter Freyther (1):
  base.bbclass: Better error message in case the Config Parser fails

Jeremy Lain=C3=A9 (4):
  linux-2.6.31: update boc01 RTC driver for upstream submission
  ntp-4.2.4p7: invoke ntpdate using if-up.d, not an init script
  ntp-4.2.4p7: make it possible to call hwclock from ntpdate if-up.d script
  bitbake.conf: add support for "cpio.lzma" images

Jeremy Puhlman (2):
  neon: Add m4 dir to autoreconf.
  autofs: pass RANLIB into the build.

Khem Raj (4):
  proxy-libintl_20080418.bb: Fix QA error missing GNU_HASH
  uclibc-nptl: Update to latest tip of branch
  eglibc_svn.bb: Update to latest svn tip.
  x86.conf: Fix typo in comments

Koen Kooi (59):
  checksums: merge in checksums from openpandora repo
  abiword: fix shlib packaging
  firefox: add 3.5.4
  abiword 2.8.1: package abicollab certs as well
  firefox 3.5.4: fixup .pc files
  angstrom feed sorter: fix typo
  angstrom feed builder: clean iso-codes as well
  gecko-mediaplayer: update for ff 3.5.4
  dsplink: remove reference to asm/page.h
  angstrom uboot scripts: change to mem=3D99M for omap3 since gst-ti is les=
s hun
  xserver-xorg-conf: simply touchbook config
  gst-plugins: blacklist -static for meta packages as well
  libxml-parser-perl: add 2.36
  angstrom feed builder: also clean perl and perl-native during architectur=
e c
  libgles-omap3: adjust for future releases
  gthumb: fix packaging
  gecko-media-player: add missing patch
  opkg: bump SRCREV to r240
  expedite, evas: don't turn of the GL engine forcefully
  efl: bump SRCREV to 43437
  e* bbclass: fix up PACKAGES (again!)
  exalt: update to current form
  linux-omap 2.6.29: backport some relocations from .31, this is needed if =
you
  omap3 machines: don't drag in omap3-sgx-modules by default
  opencv: bump SRCREV to just after 2.0.0 release
  u-boot: fix beagle fw_env.conf
  gnome-themes: delete obsolete versions
  mythtv 0.22rcX: only add glibc-gconv stuff for glibc build
  boost 1.36: various ARM fixups:
  asio: bump PR to get boost fixes
  angstrom: raise default pref in mplayer recipe as well
  checksums: sort and add missing checksum
  squashfs-tools: fix up native version
  linux-omap-pm 2.6.29: cleanup some touchbook stuff
  gdm: tweak initscript and add grep to depends since busybox grep doesn't =
do
  gdm: add tcp-wrappers to DEPENDS, fix typo in initscript
  sqlite3: add 3.6.20
  omap3-touchbook: ship both omapfb and fbdev drivers
  xserver-xorg-conf: switch to fbdev driver for touchbook till the vrfb bug=
 ge
  gecko-mediaplayer: fix packaging
  linux-omap-pm 2.6.29: add hack to get asoc to register on the touchbook
  arora: add 0.10.1. Arora is a qtwebkit based browser.
  arora: factor common stuff into .inc and add qt4/embedded version
  libxml-twig-perl: as noted previously, upstream are idiots and keep repla=
cin
  firefix: add 3.5.5
  gecko-mediaplayer: adjust for firefo 3.5.5
  angstrom package uploader: update blacklist
  gecko-mediaplayer: remove fragile hardcoded symlink
  nautilus: add 2.28.1
  sqlite3: add dep on tcl-native
  gnome-icon-theme: clean out old versions, having some off them (but not a=
ll)
  gnome-icon-theme: bump PR
  gnome bbclass: delete more scrollkeeper junk
  gnome-system-tools, gnome-terminal: bump PR to get rid of scrollkeeper ju=
nk
  gnome-icon-theme: while I'm at it, run it through oe-stylize
  asciidoc: add 8.5.1
  u-boot: fix touchbook fw_env.config

Marcin Juszkiewicz (9):
  matchbox-config-gtk: sync with Poky
  linux-bug: bump SRCREV, enable more modules
  openvpn: added 2.1rc20 and enabled reading passwords from file
  usbutils: added 0.86
  checksums.ini: added usbutils and openvpn
  transmission: added 1.76
  transmission: improve packaging
  transmission: fix breakage of "r3" version - GUI in PN-gui, daemon in PN
  java.bbclass: fixed oe_jarinstall for broken symlinks

Martin Jansa (1):
  eglibc: updated armv4t-interworking.patch

Matthew Dombroski (1):
  qmake2.bbclass: Add lupdate and lrelease.

Michael 'Mickey' Lauer (1):
  conf/machine/htcdream.conf: mention commercial device names in descriptio=
n

Michael Smith (1):
  fastjar 0.98: add non-native recipe

Otavio Salvador (1):
  chicken.inc: fix install and compilation issues

Paul Eggleton (1):
  qte: fix build failure with modern kernels due to removal of asm/page.h

Petr =C5=A0tetiar (5):
  geodegx: Linux 2.6.31.4
  geodegx: Fix glibc configure error
  libgsf: fix compile error, add missing dependency on gtk+
  obex-data-server: fix compile error, add missing dependency on gtk+
  wv: fix compile problem

Ricardo Salveti (1):
  eject-2.1.5: adding HOMEPAGE and fixing SRC_URI

Robert Nelson (1):
  linux-omap 2.6.29: fix FIFO issues with large transfers on the MUSB contr=
oll

Robert P. J. Day (3):
  usermanual: Aesthetic fix in chapter 1.
  User manual typoes and aesthetics, chapter 2 only.
  User Manual: Warn readers about mmap and SELinux issue.

Sebastian Spaeth (6):
  connman: include connman_0.46 (mv'd from connman_0.19)
  connman: add checksums for 0.46
  vala: add version 0.7.8 and checksums
  vala-native: add 0.7.8
  vala vala-native: Make use of GNOME_MIRROR in SRC_URI

Stanislav Brabec (11):
  linux-rp-2.6.26 for spitz and akita: Added netfilter support. Disabled tw=
o d
  gpsd: Removed custom do_stage.
  mplayer-svn: Worked around internal compiler error on iwmmxt.
  angstrom-2008.1.conf: Must use mplayer-svn, anything older is incompatibl=
e w
  prismstumbler-0.7.3+0.7.4pre1: Use much simper and more robust libgps che=
ck.
  balsa-2.4.1: Depends on gnome-icon-theme.
  lame: Fix possible linking QA error.
  lame: Update to version 3.98.2.
  gdb-7.0: Always use --enable-static to work-around possible linking probl=
ems
  ncurses: Always use --enable-static to work-around possible linking probl=
ems
  gnome-icon-theme-2.28.0: Set it as arch-independent package.

Steffen Sledz (1):
  busybox-1.11.3: undefined reference __cpu_to_be16 fixed for busybox-stati=
c

Thomas Kunze (1):
  tune-strongarm.inc: add EXTRA_FEED_ARCHS

Bugs fixed:

bug_id resolution        short_desc
481 FIXED        GPE-mini-browser scrolls page when spacebar pressed
in text entry field
1010 FIXED       gpesyncd is missing po/POTFILES.in
1105 INVALID     RFE: Timer app
1650 FIXED       task-base does not install ohci-hcd module for usbhost mch=
ines
3589 WONTFIX     OE don' t create root image with ext3 FS on AMD64
5123 FIXED       meta-toolchain-gpe-1.0-autobuild
5023 FIXED       Missing depencies of package python-email
4759 FIXED       new recipe texi2html_1.78.bb
4774 FIXED       new recipe help2man_1.36.4.bb
5026 WONTFIX     dpkg_1.14.23.bb un-fetchable
5061 FIXED       gpe-scap-1.3 mips-strdup patch
5067 FIXED       New recipe for gRun
5327 INVALID     gcc-cross-intermediate-4.4.1-r6.1: oe_runmake failed.

Bugs opened:

bug_id resolution        short_desc


