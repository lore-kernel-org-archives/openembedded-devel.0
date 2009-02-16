Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LZ5M0-0005rQ-Oa
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 16:25:53 +0100
Received: by rv-out-0708.google.com with SMTP id b17so1952484rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Jmwf6r+FjNIaIVXfhNkMoQ+oK7aglxlm71RvGjQNlnA=;
	b=g3O7Zj36MpD3n4sVwSGJ/nxzdb2D0GwM8O5SW+CjsPRkK2A+AYy/FJ70sEq3CeG2ia
	a8L7UFuh05Hotp/WMwbDbdFodUpdJRMXeZwnM8egPWzu/0Xx8dGG3wBe61gahS5rtOzP
	XHSqZc20b1l+VEeVBiFlcy8PcNTwTe+URcDl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=f1bjr6CfMdn3H4vLDhfAmmr7kZhD9t8FibGNOEJxxbcVm+sIW6phx0wBYr+lb7zfo+
	9f/rzfJMRCIq8Pl6rRpZQGbc96WwjhNg9GpUB+iFKcXftnVQ/GiSHV9WxM5t2X0J+Neq
	nq9ZzRB1kTds4F7SREYAegoV3TnVqbTYPWlzM=
MIME-Version: 1.0
Received: by 10.140.207.2 with SMTP id e2mr1976310rvg.148.1234797840113; Mon, 
	16 Feb 2009 07:24:00 -0800 (PST)
Date: Mon, 16 Feb 2009 10:24:00 -0500
Message-ID: <f96d234e0902160724s6e07e19bn357ac7ec41d1c204@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-02-09 to 2009-02-16
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
X-List-Received-Date: Mon, 16 Feb 2009 15:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-02-09 to 2009-02-16

Angus Ainslie (1):
      sane-srcrev.inc: bump qi rev on milestone5 branch

Bernhard Guillon (3):
      blackbox: fix path in libbt.pc and bump PR
      aufs: fix cross compiling, delete old patch and bump PR
      build-feeds.sh: add task-xqtlauncher

Claudio Mignanti (1):
      Signed-off-by: Khem Raj <raj.khem@gmail.com>

Denis 'Gnutoo' Carikli (2):
      added some checksums,see my next commit for details on the pax
utils checksum
      pax-utils: fixed 404 not found

Diego Dompe (2):
      dsplink: add dmai 1.20 support
      dmai 1.20: more fixes

Elena Grandi (2):
      mutagen 1.15: new recipe
      checksums.ini: checksum for mutagen 1.15

Frans Meulenbroeks (15):
      python-coherence: add python-inotify dependency
      wt: added HOMEPAGE to recipe
      python-coherence: moved to svn 1161, added dependency on
python-twisted-protocols
      opkg: fix bug that occured with file names of exactly 100 chars
in the tar file
      busybox: fix tar problem with filenames that are exactly 100 bytes
      zope: removed twisted subdir during install;
      zope-native: added
      python_divmodepsilon: added native recipe
      python-divmodaxiom: added recipe (checksums are already there)
      python-coherence: added dependency on axiom
      angstrom/build-feeds.sh: added w3cat
      python-pycrypto: upgraded to svn; this fixes some bugs and adds
functionality
      Revert "python-pycrypto: upgraded to svn; this fixes some bugs
and adds functionality"
      python-pycrypto: updated to git version, fixes bugs and adds function=
ality

Gregoire Gentil (1):
      Signed-off-by: Khem Raj <raj.khem@gmail.com>

Ihar Hrachyshka (1):
      ruby: Fixed ruby 1.8.5 compilation problem

Jan L=FCbbe (2):
      bluez4: update to 4.29
      linux-openmoko-devel: bump sane srcrev to current andy-tracking

Jeremy Lain=E9 (8):
      checksums.ini: add entries for busybox 1.3.2 patches
      linux-2.6.27: refresh patches for boc01
      u-boot-1.3.2: update patches for boc01
      u-boot-1.3.2: prune obsolete patches for boc01
      u-boot-1.3.2: enable watchdog on boc01
      dnsmasq: update to version 2.47

Khem Raj (9):
      alsa-utils_1.0.18: Check for strlcat and stlcpy functions during conf=
igure
      alsa-utils: Delete unused alsa-utils-strl-funcs-non-static.patch
      avahi_0.6.24.bb: New recipe

Koen Kooi (31):
      angstrom feed sorter: move feed browser updating and source
stripping out of the loop
      angstrom feed builder: add wt
      python-twisted-native: zap RDEPENDS_${PN} as well
      python 2.6.1: add softft fix from libffi, this hopefully makes
python-ctypes work on ARMs with fpu and softfp
      angstrom image builder: remove deprecated altboot stuff, we have
kexecboot now
      ogre-egl: fix packaging
      webkit-gtk: switch to libsoup backend (segfaults are gone) to
get cookies working with midori
      x11 images: remove phone feature hacks
      wgois: add 1.2.0 release
      ogre-egl: build samples against a modern toolkit and package them
      clutter 0.8+svn: move to git
      libgles-omap3: make 06 default now
      clutter: add 0.8 file
      angstrom 2009.X: fix avr32 build
      busybox: bandaid for avr32
      checksums.ini: add bitbake 1.8.12
      beagleboard: add ubifs params and document how to get them if
you have access to the real hardware
      angstrom distro config: clean up armv7a a bit and document
DISTRO_ vars so people don't needlessly create forks just to keep
avahi out of an image
      dsplink: bump PR
      dsplink: add patch to replace sed magic
      dmai: apply patches
      qhull: add 2003.1
      dmai 1.20: pass in staging incdir
      dmai: work around xdc bug
      xserver-xorg-conf: add config for overo
      tetgen: add 1.4.2

Leon Woestenberg (1):
      contrib/artwork: New OpenEmbedded logo artwork replacing old logo SVG=
s.

Lynn Lin (4):
      Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Signed-off-by: Khem Raj <raj.khem@gmail.com>

Marcin Juszkiewicz (18):
      alsa-state: ship proper asound.conf for AT91SAM9263-EK board
      sanity.bbclass: do not fail if /bin/sh is not symlink
      checksums.ini: added some entries
      kaeilos: first attempt to make new Angstrom based distro
      kaeilos-version: first version (based on angstrom-version)
      kaeilos: use xserver-kdrive 1.3.0.0
      kaeilos: remove Avahi from system
      kaeilos: use busybox 1.13.2
      kaeilos: use mdev
      base-files: added KaeilOS issue(.net) files
      psplash: added KaeilOS logo
      busybox: added kaeilos config (copy of Angstrom one)
      busybox: added KaeilOS config for 1.13.2
      ronetix-pm926*: added configs for Ronetix boards
      ronetix: drop alsa from system
      linux: added 2.6.25.20 for Ronetix boards
      netbase: use static IP for eth0 on ronetix boards
      at91: dropped not used kernel recipe

Marco Cavallini (1):
      linux: added ronetix-pm9263 board support for 2.6.28

Michael 'Mickey' Lauer (20):
      vala[-native]: add patch to make ByteArray usable (pending
upstream inclusion)
      pyflakes: 0.2.1 -> 0.3.0
      sane-srcrevs.inc: bump fso-abyss
      libgsm0710: new recipe; a lightweight GSM 07.10 protocol engine
      fso-abyss: bump to 0.2.1+git; add dependency on libgsm0710
      fso-autorev.inc: add abyss and libgsm0710
      task-base: introduce BLUETOOTH_MANAGER, so we can use task-base,
but still speficy the preferred bluetooth bunch
      vala-terminal: bump version number
      ezx-gen-blob: add svn recipe; WIP
      e2fsprogs: move 1.41.2 to nonworking
      preferred-om-2008-versions: bump python-pygobject[-native]
      preferred-om-2008-versions.inc: bump libtool and automake
      moko-autorev.inc: s/tichy/paroli/, and add qi
      python-pygobject 2.16.0: add rdependency on python-textutils
(thanks emdete); remove default preference of -1
      qi: make it build working binaries
      fso-autorev.inc: fix typo
      preferred-om-2008-versions.inc: bump pkgconfig[-native]
      om-gta03.conf: add machine configuration for the forthcoming
Openmoko GTA03
      libframeworkd-glib: bump version
      fso-abyss: version 0.3.0 supports a config file

Michal Hrusecky (1):
      Signed-off-by: Khem Raj <raj.khem@gmail.com>

Mike Westerhof (15):
      SlugOS: slugos.inc - nail boost preferred version down since
newer one won't build
      SlugOS: slugos-init - add /sbin/setup-optware.sh
      SlugOS: busybox - update defconfig to re-enable the z and j
options for tar
      SlugOS: setup-optware.sh - whitespace fix.
      SlugOS - enable --hash-style=3Dgnu option for SlugOS and packages.
      opkg-nogpg-nocurl: change default tmpdir from /tmp to /root
      slugOS: reinstate netatalk
      SlugOS: separate the PREFERRED_VERSIONS into its own conf file
      SlugOS: meta-toolchain-slugos - add base libs for the SDK, first iter=
ation
      ntfs-3g: updates the NTFS-3G package to use the latest release
      sshfs-fuse: bump up to upstream version 2.2
      SlugOS: add sshfs-fuse to the SlugOS package feeds
      ntfs-3g: 1.0 version is deprecated; set DEFAULT_PREFERENCE to -1
      at76c503a-modules: add patch to build on 2.6.27 kernels.
      SlugOS: add bluez4 to the package feeds.

Otavio Salvador (10):
      dhcp: add initscript in dhcpd 3.0.2
      xf86-video-geode: add 2.11.0
      parted: revamp 1.8.8 recipe
      rt61-firmware: add 1.2
      cups: add 1.3.8.
      package.bbclass, package_ipk.bbclass: add dynamic depends on
locale packages (ipk specific)
      parted: drop versions up to 1.8.8
      sun-jre6: add 1.6.0.10
      flash-plugin: add 10.0.12.36

Philip Balister (2):
      nrlolsr : Add recipe for nrlolsr. Need for
http://www.maniacchallenge.org contest.

Rod Whitby (8):
      task-openmoko-feed: Disabled python-lightblue since it doesn't exist.

Roger Monk (1):
      dsplink: massive build cleanup and improvements. readme.txt added

Roman I Khimov (3):
      rpm2cpio: change SRC_URI to something that doesn't change
      tnef: Add 1.4.5
      icecc.bbclass: base fix for cross and native builds, patch/9

Roman Khimov (3):
      bison-native_2.3.bb: Copy all bison data
      Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Signed-off-by: Khem Raj <raj.khem@gmail.com>

Steffen Sledz (2):
      oxnas: kernel params for detailed uart configuration
      MAINTAINERS: sledz added

Thomas Gstaedtner (1):
      euphony: bump 0.1.2 -> 0.1.3

Thomas Kunze (6):
      kexecboot.inc: move kexecboot-cfg
      bumb task-boot RP to pull kexecboot-cfg
      linux_2.6.28: add collie patches
      collie.conf: change PREFERED_PROVIDER for kernel
      kexecboot-cfg: fix C&P error
      linux_2.6.28: change collie defconfig

Tim 'timtim' Ellis (16):
      checksums.ini: Add more checksums and sort
      perl: Add some extra perl modules (needed for zoneminder):
      checksums.ini: Add samba 3.2.8
      samba: Various updates:
      linux-n1200: Add usb webcam modules
      linux-orion: 2.6.27.10 =3D> 2.6.28.4, add usb webcam modules
      checksums.ini: Add linux patch-2.6.28.4
      linux-linkstationppc: Fix last commit, 2.6.27.10 =3D> 2.6.28.4,
add usb webcam modules
      samba: Remove package smbfs from > 3.2.4 as these utilities
don't exist anymore. Fix a linking issue for samba-ads-3.3.0 by
reverting some changes
      iscsi-target: Fix for 2.6.29 too
      mpeg-encode: Add package, optional utility for zoneminder
      libv4l: 0.5.7.bb -> 0.5.8
      checksums.ini: Add libv4l 0.5.8
      libsys-mmap-perl: Add package and native version

Tom Rini (16):
      mingw-runtime{,-headers}: Add 3.15.2
      checksums: Add ltp, lmbench (both from downloads.sf.net) and
mingw-rt 3.15.2
      bitbake.conf: Add a 'ubi' image target and update 'ubifs' target
to take args
      module-base: Fix the test on KERNEL_OBJECT_SUFFIX
      module_strip: When picking module suffix, use KERNEL_MAJOR_VERSION.
      mingw-make-canadian-sdk: Add this so we have a 'make' for mingw
      bitbake.conf: Add UBI_VOLNAME to allow distros to set the volume
name for the ubi volume
      ltp: Add 20090131 version
      ltp: Add DEPENDS on zip-native to 20090131
      lmbench: Fix config file location in lmbench-run add RDEP on
debianutils, bump PR
      udev-124: Sanitize permissions.rules and remove warning about leading=
 /.
      udev-{092,097,100}: Sanitize permissions.rules
      package_ipk.bbclass: Add missing : from
a045dfacf6f2541e0f410d9d109581f181303756
      busybox: Add a 'mountall' file and install for
CONFIG_FEATURE_MOUNT_FSTAB=3Dy

lynnlin (1):
      mktemp: new recipe; safe temp directory from shell scripts.
closes OE #4746

ssz (1):
      machines: oxe810 renamed to oxnas

stanislav (1):
      vlc: --enable-realrtsp option added

woglinde (1):
      alsa-utils: QA-fix for m4 syntax

Bugs fixed:

bug_id resolution        short_desc
4087 WONTFIX     bluez-gnome_0.24.bb fails to build
4501 FIXED       compiling linux kernel with gcc 4.3.x
4531 WONTFIX     avahi-0.6.22 link fails - rpl_realloc undefined
4574 FIXED       Libosso compilation fails
4592 WORKSFORME  USE_NLS variable has no effect for uClibc
configuration when building on Fedora 6/7 host
4595 FIXED       new recipe - evtest-1.23
4659 FIXED       new package mini-httpd_1.19.bb
4660 FIXED       Yasr bitbake recipe
4699 WORKSFORME  opkg-nogpg_svn.bb fails to build.
4716 FIXED       libssh_0.20.bb
4718 FIXED       pax-utils(-native) 0.1.13 not fetchable
4746 FIXED       new recipe mktemp_1.6.bb
4752 FIXED       minicom-2.3
4772 FIXED       replace task-bootstrap with task-base in jlime-opie.bb
4789 FIXED       fakeroot_1.9.6 missing checksum for a debian mirror
4791 FIXED       add a patch for package_tar.bbclass
4814 WONTFIX     qemu fails to build on ubuntu 8.10
5000 FIXED       glibc 2.7 fails to build
5007 FIXED       glibc-initial 2.7 missing
5012 FIXED       bison-native-2.3 missing data
5017 INVALID     angstrom-2008.1: desktop-file-utils-native_0.14.bb
build failure - wants libdb-4.2.so

Bugs opened:

bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


