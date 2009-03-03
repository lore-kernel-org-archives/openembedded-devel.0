Received: from [209.85.198.234] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LeXdd-0004wP-Ky
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 17:38:38 +0100
Received: by rv-out-0506.google.com with SMTP id g9so398815rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=qxpReIP18OzKh0o/pDedmQvv/D+KVBFIevh/uTeRYbU=;
	b=B3c+4ynFAfv8blZ3nqvNPPTQ5Y+Gm0bE2zkRpSea+FIJowePNCDQxRV+op/qnYxRK2
	SiWTnVWpWGMooEhgpy0LjeW39oLgvKC9cuD3IQ8E2aWQ7aexsHUGDHPB2hXMwyNCUlkY
	/r5QqM0U4VAtgkx3YjiEZJ5RW8m+Bjs1VNx3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VZoseiia+BhuGJW1sN6BPJa5MbMNaoASaFm1HKdvi76PdLKPZMQZ2pKX2MqrFD/OQl
	zUA9BWT4+uCmpe4oNuOY08L5ECo0cQudCVrhWTt1iTX5WUaVH8CZYxNXtJDrvHlLKbAD
	eglj8jj9rOlDYaE5X3HcCJw89BpDWZfUfP2OQ=
MIME-Version: 1.0
Received: by 10.141.28.4 with SMTP id f4mr3626034rvj.37.1236098073417; Tue, 03 
	Mar 2009 08:34:33 -0800 (PST)
Date: Tue, 3 Mar 2009 11:34:33 -0500
Message-ID: <f96d234e0903030834k52b9dbdbp3ad738e253f6db3c@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-02-23 to 2009-03-02
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
X-List-Received-Date: Tue, 03 Mar 2009 16:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-02-23 to 2009-03-02

Andrea Adami (2):
      initramfs-kexecboot-image: clean image-specific stuff right here
      linux-rp_2.6.26: build libertas wifi modules for supported Zaurus

Bernhard Guillon (2):
      libsdl-qpe: fix configure.in,Makefile.am and bump PR

Cliff Brake (3):
      checksums.ini: add checksum for pengutronix canutils

Dmitry 'MAD' Artamonow (2):
      xdiskusage: xdiskusage shows disk space usage information, it
can produce a PostScript version of the display.
      xdiskusage: xdiskusage shows disk space usage information, it
can produce a PostScript version of the display.

Elena Grandi (1):
      tuxtype 1.7.3: new recipe

Frans Meulenbroeks (17):
      bluez: add dependency on libusb
      midori: changed PV in recipe to make sure ordering is ok
      blues4: undo previous (faulty) commit; apologies for any inconvenienc=
e!
      anstrom/build-feeds.sh: added cron
      cdrtools-native: changed SRC_URI from ftp: to http: as ftp: did
not work any more
      cdrtools-native: bumped PR, fixed HOMEPAGE
      cdrtools-native: fixed LICENSE
      cdrkit: created package; cmd line tools to create CDs/DVDs
      cdrkit: fix install issue
      pmount: updated to 0.9.18
      cdrtools-native: fixed LICENSE
      cdrkit: created package; cmd line tools to create CDs/DVDs
      cdrkit: fix install issue
      pmount: updated to 0.9.18
      added ivman and pmount to angstrom build-feeds.sh

Jeremy Lain=E9 (17):
      u-boot-1.3.2: update keypad support for boc01
      linux-2.6.27: update keypad support for boc01
      linux-2.6.27: improve boc01 EEPROM support
      udev-124: remove boc01-specific mount.sh
      qtopia4core.bbclass: depend qt-embedded, qtopia-core is obsolete
      qt4: get rid of bogus qtopia-core-4.4.3 package
      qt_packaging.inc: make phonon4-dev honour QT_LIBINFIX
      qt4: split qt-embedded and qtopia-core
      qt-embedded: restore qtopia4core.bbclass, add qt4e.bbclass
      linux-2.6.27: improve boc01 EEPROM support
      udev-124: remove boc01-specific mount.sh
      qtopia4core.bbclass: depend qt-embedded, qtopia-core is obsolete
      qt4: get rid of bogus qtopia-core-4.4.3 package
      qt_packaging.inc: make phonon4-dev honour QT_LIBINFIX
      qt4: split qt-embedded and qtopia-core
      qt-embedded: restore qtopia4core.bbclass, add qt4e.bbclass
      checksums.ini: add entry for libsidplay-1.36.59.tgz

Khem Raj (11):
      checksums: Remove spurious control characters in ++DFB-0.9.25.tar.gz =
url
      checksums: Add base-passwd checksum
      checksums.ini: Add checksums for fakeroot_1.12.1.tar.gz and
netbase-4.21.tar.gz
      preferred-om-2008-versions.inc: Use pidgin version 2.5.3
      checksums: Remove spurious control characters in ++DFB-0.9.25.tar.gz =
url
      checksums: Add base-passwd checksum
      checksums.ini: Add checksums for fakeroot_1.12.1.tar.gz and
netbase-4.21.tar.gz
      rx1950.conf: Add missing quote in MACHINE_FEATURES
      checksums.ini: Add checksum entry for docbook-dsssl-1.79.tar.bz2

Koen Kooi (26):
      gstreamer-ti: bump SRCREV
      gstreamer-ti: bump to r126 to make gstreamer autoplug and playbin wor=
k
      checksums: add fakeroot 1.12.1
      task-gstreamer-ti: add gst-plugins-bad
      automake: rediff path_prog_fixes for 1.10
      checksums.ini: add more sums
      gstreamer-ti: bump to r127
      checksums: add more sums
      gstreamer-ti: catch up with site rename, pass in username and passwd
      checksums: add fakeroot 1.12.1
      task-gstreamer-ti: add gst-plugins-bad
      automake: rediff path_prog_fixes for 1.10
      checksums.ini: add more sums
      gstreamer-ti: bump to r127
      checksums: add more sums
      gstreamer-ti: catch up with site rename, pass in username and passwd
      usermanual: fix 'nochunk' types
      gnome-device-manager: add 0.2
      linux-omap-pm: add cpufreq support for omap3evm, update defconfig
      omap3evm: prefer -pm kernel, add ubifs stuff
      gstreamer-ti + depends: bump PR for omap3evm kernel change
      bluez4: update to 4.31
      opkg*: bump to r201 as per RFC on oe-devel ml

Leon Woestenberg (1):
      rt-tests: Moved from 0.21 to 0.28.

Lukas Gorris (5):
      linux-msm7xxxx upadte defconfigs
      linux-msm7xxxx don't create .cpio.gz images
      linux-msm7xxxx: update SRCREV and SRCURI, don't install the
upstream defconfigs in favor of Xfbdev compatibility
      linux-msm7xxxx: add htcnike

Michael 'Mickey' Lauer (41):
      base-passwd: 3.5.19 -> 3.5.20
      netbase: debian mirrors no longer carry this, change SRC_URI
      automake[native] 1.10: make default
      ezx-gen-blob: add svn version which finally compiles
      fso-abyss: needs libgsm0710mux now
      libgsm0710muxd: new recipe; gsm 07.10 multiplexer engine
      netbase 4.21: bring PR back as spotted during the review by Crofton
      elementary: merge
      elementary: and back again
      efl.bbclass: touch config.rpath which is necessary for newer automake
      docs: import usermanual from org.openembedded.documentation.
      pkgconfig[-native]: 0.23 is the new default one
      linux-openmoko-devel: bump to latest andy-tracking; remove
patches applied upstream
      minimal.conf: use newer glibc and gcc
      vala: touch gobject.vala.stamp before compiling; apparantly
there's a timeglitch in the tarball. Closes OE
      gnome-vfs 2.22.0: fix *.a and *.la packaging
      sane-srcdates.inc: remove first bunch of SRCDATES for cvs
packages that are no longer existing
      frameworkd-devel: use mickey/ogsmd-new-timeout branch for now
      linux-openmoko-2.6.28: build out of the stable branch; bump to latest
      sane-srcrevs: bump linux-openmoko-2.6.28
      linux-openmoko-2.6.28: remove patches that have been applied upstream
      qi: enable build debug output again and bump to latest version
      minimal.conf: blatantly steal the collective wisdom (and I admit
it must have
      ncurses: modernize and fix packaging problems
      coreutils: make 6.0 the new default
      automake: update to 1.10.2
      coreutils: add 7.1. Not thoroughly tested yet, hence DP=3D-1
      sane-toolchain.inc: fix typo in binutils version
      linux.inc: fix the infamous 'install ./-m0644: file not found' error
      busybox-static 1.11.3: make it more convenient to maintain the
static version
      qt4[e|x11].bbclass: set ARM_INSTRUCTION_SET to arm
      qmake2-native: revert patch that broke qmake2 finding its spec files
      python-dweba: new recipe; successor to python-spyro. adjust
task-python-everything
      python-pylinda: change SRC_URI to mirror
      moin: no longer needs install hack
      dtn: fix packaging and constrain arm instruction set
      python-pygtk 1.2: fix -dev packaging
      bluez4: hci usb patch no longer necessary
      gpe-gallery: svn version is the new default; convert to SRCREV
      vte: stage all for libvte

Mike Westerhof (2):
      SlugOS: reinstate fakeroot 1.9.6 and set as the PREFERRED_VERSION
      SlugOS: reinstate fakeroot 1.9.6 and set as the PREFERRED_VERSION

Otavio Salvador (17):
      initramfs-module-ext3: use mkdir -p to create mount path
      initramfs-module-aufs: use mkdir -p to create mount path
      initramfs-uniboot: add support to start a shell and enable debug
      initramfs-uniboot: call depmod if the image lack a dep file
      psplash: improve how to detect boot param to avoid the psplash starti=
ng
      initramfs-module-psplash: allow psplash to be disabled using boot par=
am
      e2fsprogs: add 1.41.4
      psplash.inc: set PR for force the updating of branded packages
      psplash-openmoko: fix package compilation since it lacked
logo-math.patch at SRC_URI
      e2fsprogs (1.41.4): fixes PR to r1, sorry
      ica-bin (10.6): use rpm2cpio.pl since rpm2cpio doesn't exist anymore
      psplash: use virtual/psplash to specify which psplash package to inst=
all
      psplash.inc: only provides virtual/psplash at ${PN}
      toscoterm: bump sane srcrev
      flash-plugin: bump to 10.0.22.87
      dhcdbd: fix SRC_URI since it has been moved
      conf/bitbake.conf: use --no-check-certificate to avoid errors
when wgetting from https

Philip Balister (7):
      checksums.ini : Add checksum for libnetfitler_queue-0.0.16.tar.bz2.
      checksums.ini : Add checksum for base-passwd-3.5.20.
      tzcode-native : Add checksums for txcode and tzdata.
      checksums.ini : Add checksum for libnetfitler_queue-0.0.16.tar.bz2.
      checksums.ini : Add checksum for base-passwd-3.5.20.
      tzcode-native : Add checksums for txcode and tzdata.
      checksums.ini : Add checksum for resolvconf_1.43.tar.gz.

Stanislav Brabec (8):
      matchbox-panel: Prevent crashes in system-monitor applet (just a
work-around).
      mc: Updated to 4.6.2 + openSUSE and Debian UTF-8 patches.
      mc-4.6.2: Miscelaneous fixes:
      mc: Added checksum, removed obsolete line in mc.inc.
      vte: Updated to 0.16.14. Added desktop file. Fixed sub-packages
dependencies.
      mc-4.6.2: Miscelaneous fixes:
      mc: Added checksum, removed obsolete line in mc.inc.
      vte: Updated to 0.16.14. Added desktop file. Fixed sub-packages
dependencies.

Steffen Sledz (3):
      checksums.ini: checksums for another e2fsprogs-1.41.4 url added
      checksums.ini: checksums for another e2fsprogs-1.41.4 url added
      neon: use gnutls-2.patch to fix the building with newer gnutls releas=
es

Theodore A. Roth (8):
      getting_oe.xml: Update documentation.
      getting_oe.xml: Update getting openembedded section.
      getting_oe.xml: Add Configuring OpenEmbedded section.
      getting_oe.xml: Update "Building Software" section.
      getting_oe.xml: Update documentation.
      getting_oe.xml: Update getting openembedded section.
      getting_oe.xml: Add Configuring OpenEmbedded section.
      getting_oe.xml: Update "Building Software" section.

Tom Rini (4):
      apt-native: Add perl-native to depends, change from +=3D to =3D, bump=
 PR
      dpkg-native: Add dpkg-native.inc, set PERL_LIBDIR, fixup
dpkg-architecture, bump PRs.
      dpkg-native: Last change broke thing (oops), we need to set PERL
to ... and RDEPENDS=3D"".

andrea (1):
      initramfs-kexecboot-image: get rid of all binaries...be small!

mwester (2):
      SlugOS: set version on dev branch to 5.4-alpha now
      SlugOS: set preferred version for gstreamer as well

woglinde (7):
      update-alternatives: update to newer version of dpkg
      libpng: add version 1.2.35
      libpng: add version 1.2.35
      update-alternatives: update to newer version of dpkg
      libpng: add version 1.2.35
      libpng: add version 1.2.35

Bugs fixed:

bug_id resolution        short_desc
4562 FIXED       New package - xdiskusage-1.48
5013 FIXED       python 2.6 fails do_compile for bigendian machines
5035 FIXED       source archive for fakeroot 1.9.6 no longer downloadable
5039 FIXED       netbase 4.21 no longer downloadable
5042 FIXED       vala doesn't cross-compile
5046 FIXED       rx1950 machine conf typo

Bugs opened:

bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


