Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJ3HQ-0003Du-Bg
	for openembedded-devel@openembedded.org; Thu, 09 Aug 2007 10:22:04 +0200
Received: from Powerbook-2.local (vpn006062.vpn.utwente.nl [130.89.6.62])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l798J61R029069 for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Aug 2007 10:19:09 +0200
Message-ID: <46BACDDA.8020606@dominion.kabel.utwente.nl>
Date: Thu, 09 Aug 2007 10:18:34 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2007 08:22:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

antti.andreimann@mail.ee:
    xf86-video-nsc: add missing define, close #2715
    libxslt: add 1.1.21, closes #2701
    libxml2: update to 2.6.29, closes #2702

cbrake@openembedded.org:
    compulab-pxa270-2.6.22: add 2.6.22 kernel

core.ldf@gmail.com:
    lighttpd: added pcre support - closes #2692

crofton@openembedded.org:
    exmap-console : Update from Poky. Builds now.
    libtool : Add bb files for libtool-1.5.24 support. This version seems to
    libnfnetlink_0.0.30.bb : Add libtoolize --force to rebuild libtool file in tarball.
    libnfnetlink : Add support for the libnfnetlink library.

daniel@openembedded.org:
    openmoko-theme-standard2_svn.bb: Bump PR so the new theme is picked up
    openmoko-session2.bb: Bump PR so the new session file gets installed.

florian@openembedded.org:
    gpe-bootsplash: Fix text
    gpe-bootsplash: Update logos in order to reflect latest GPE release.
    gpe-task-base: Back to Vera fonts... Dejavu is too big.
    linux-hackndev-2.6: bump PR
    linux-hackndev-2.6: Update palmtx defconfig to make it build again.
    meta-gpephone: Remove obsolete dependency.
    task-gpephone: Get rid of obsolete dependency task.
    gpesyncd: Add 2.0
    task-gpe-base: fix RDEPENDS
    libmimedir: Add 0.4 2
    preferred-gpe-versions-2.8.inc: Some more numbers...
    gpe-filemanager: add 0.30
    preferred-gpe-versions-2.8.inc: update keylaunch version
    addressbook: Add SVN recipe
    libabenabler: Add SVN recipe
    tslib: Add dummy ts.conf for htctornado
    xrandr: Remove patch that does not apply any more.
    gpe-image: Update dependencies
    gpe-task-base: Adjust dependencies
    task-gpephone: Adjust dependencies.
    gpephone-image: Depend on virtual/xserver
    preferred-gpe-versions-2.8.inc: Fill it with versions...
    gpe-package: add 0.4

hrw@openembedded.org:
    disapproval of revision '88c64741ce48efad01b051c81bcb07df08267748'
    palm machine configs: fix names in comments
    linux 2.6.22: Alix boards use bzImage kernels
    alix: added machine config for PC Engines Alix1c board
    linux: added 2.6.22 with config for PC Engines Alix1c board
    openmoko-dialer2: depend on gstreamer for ringtones
    gstreamer: added meta package from Poky to get plugins grouped
    patch.bbclass: give empty file for quilt so it will not use config from user homedir -
closes #2704 (code from Poky)
    lsof: upgraded to 4.78
    makedepend-native:  add DEPENDS on xproto-native - spotted by Crofton
    linux-rp 2.6.21: fix poodle build - close #2682
    ttf-dejavu: really ship aliases file
    ttf-dejavu: updated to 2.18, added fontconfig aliases support
    libw100,vincent: fixed SRC_URI - SSL certificate is for *.svn.sourceforge.net not for
*.svn.sf.net
    lighttpd: update to 1.4.16, drop older

ifaistos@openembedded.org:
    packages/asterisk/asterisk_1.4.7.bb : New package asterisk 1.4.7
    packages/asterisk/asterisk_1.2.24.bb: New package asterisk_1.2.24
    packages/xorg-lib/libx11 : Fix makekeys generation on all libx11 bb packages
    packages/xorg-lib/libx11_1.1.2.bb : Fix an issue when building for Efika, where it used

jbs@bandos.homelinux.com:
    opie-i18n: update to 1.2.3 - closes #2693

jluebbe@lasnet.de:
    packages/openmoko2/openmoko-today2_svn.bb: RDEPEND on eds ecal server to fix crashes

joaquinduran@adtelecom.es:
    cups: update to 1.2.12, closes #2705

koen@openembedded.org:
    autoconf: make 2.61 the default, as discussed on the mailinglist
    asterisk: add missing files
    asterisk 1.4.7: try to make conform a bit more to the styleguide
    fffmpeg svn: fix build
    eglibc: use eglibc-package.bbclass
    eglibc: add eglibc-package.bbclass based on glibc-package.bbclass
    cairo: add pixman to DEPENDS for git version
    pixman: add 0.9.4
    angstrom-2008.1: fix typo in comments
    angstrom: add 2008.1 file, see comments within
    update-rc.d: merge in ${D} cleanups from poky
    matchbox-panel-2: .a and .la files go into -dev packages, not into -dbg packages
    seppuku.bbclass: fix indentation
    roadmap: add missing patch
    roadmap: add gtk2 version
    linux 2.6.22: add AVR32 support
    hildon-thumbnail: add 0.11
    mce-dev: add 1.5.6
    libhildonmime: add 1.9.5
    osso-gwconnect: add 1.0.8
    osso-thumbnail: add 0.7
    hildon-libs: add 0.15.1 (from launchpad, the nokia site is too hard to navigate)
    libosso-help: add 2.1.2
    libhildonhelp: add 1.9.1
    gtkhtml: fix QA issues
    osso-ic: add internet connection lib for maemo
    angstrom: move include so it can override more parts
    eglibc-intermediate: add completely untested eglibc-intermediate
    angstrom-eglibc: add more defines to stop glibc from ending up in staging
    eglibc-initial: add completely untested recipe (copy of glibc-initial 2.6)
    angstrom-x11-base-depends: remove RDEPENDS on virtual/x11, apps link to it anyway
    libx11: remove RPROVIDES
    pkgconfig-native: reinstate default pref
    openmoko-terminal: fix PV
    xscrnsaverh: xextension -> libxext
    xserver-kdrive-omap: remove it, it has been replaced by the xomap version
    ipaq-sleep: xextensions -> libxext
    autoconf 2.61: disable parallel make
    libsndfile: update to 1.0.17
    angstrom: use full x11 till the feeds have been cleared of packages depending on it
    bridge-utils: update to 1.2
    angstrom: adjust xorg versions
    Xorg: drop stale recipes X11R7* in PV. Those aren't needed anymore after the Xorg
cleanup from poky was merged
    pkgconfig: add missing patch
    pkgconfig: sync with poky
    binconfig.bbclass: more munging
    openmoko2.bbclass: remove SRCDATE=tomorrow
    pidgin: port OE branding patch to libpurple
    mtn: symlink test
    abiword 2.5: fix packaging
    angstrom-x11-base-depends: mark as machine specific
    zaurusd: add patch for finding tslib 1.0 pkgconfig file
    Hal: merge improvements from poky, remove stale versions
    psplash: make openmoko psplash openmoko specific, not machine specific
    openmoko-today2: add libmokojournal2 to depends
    xserver-kdrive 1.3.0.0: apply w100 patches
    xserver-kdrive-imageon 1.2.0: reset COMPATIBLE MACHINE
    angstrom-x11-base-depends: don't rdepends on virtual/x11
    kdrive (imageon) 1.2.0: apply xcalibrate patch needed for recent changes
    xorg-xservers: remove RPROVIDES=virtual/xserver, that should help people seeing
kdrive-git being built
    thcrut: fix depends
    brutefir: add alsao to depends
    compulab-pxa270 2.6.20: include linux.inc to get EABI magic
    tslib: bump version to 1.0 (from poky)
    shared-mime-info: fix postinst, update to 0.22
    sane-srcdates: fix xcalibrate SRCDATES
    xtscal: work with recent xcalibrate changes (from poky)
    xserver-kdrive-image: xcalibrate -> libxcalibrate

lenehan@openembedded.org:
    p3scan 2.9.05d: Fix up configure.in to work with the recently updated

marek.vasut@gmail.com:
    libqpe: use proper var for CVS version
    libopie2: use proper var for CVS version

mickeyl@openembedded.org:
    openmoko-terminal2: supply sane font defaults to mrxvt
    matchbox-panel2 ship plugin *.la in debug package (QA fix)
    gtk+: drop 2.10.9 to 2.10.12, promote 2.10.14 as the new default version
    uboot-openmoko|linux-gta01: softlink to the latest binary in the deploy directory
    gst-plugins-bad 0.10.5 fix compiling (see upstream bug #454078)
    add dbus-c++[-native], a native C++ binding to the DBUS API
    gstreamer update:
    psplash: smooth bar corners in OpenMoko version
    gst-meta-base: remove gnomevfs stuff
    task-openmoko: add openmoko-feedreader2 and neod
    uboot-openmoko: pinpoint GIT revision
    sane-srcdates.inc: webkit builds again
    sane-srcdates.inc: add sane srcdate for webkit (it breaks shortly after that)
    add openmoko-terminal2, using mrxvt instead of gtkterm2
    mrxvt: add no-debug-x patch as per mrxvt author's recommendation
    uboot-mkimage-openmoko-native: catch up with renaming
    openmoko2.bbclass: add support for daemons
    rename u-boot[-mkimage]-gta01[-native] to u-boot[-mkimage]-openmoko[-native]
    gtk+ 2.10.14 adjust PACKAGE_ARCH when using OVERRIDES
    openmoko2: add neod
    busybox: remove OpenMoko specifics, we track angstrom using OVERRIDES
    psplash: use openmoko override instead of fic-gta01
    gtk+: apply lower-quality-scaling on fic-gta0[12] to squeeze some more performance out
of it
    sysvinit|tslib: remove openmoko specifics (we now use angstrom as per OVERRIDE)
    openmoko.conf: add angstrom as additional OVERRIDE
    fic-gta0[12].conf: always generate little endian jffs2 images
    tslib: recommend pointercal also for openmoko
    conf/openmoko.conf: change DISTRO name to make openmoko override active
    busybox: add openmoko specifics
    sysvinit: add openmoko specifics
    base-files: add openmoko specifics
    psplash: add missing default psplash-bar-img.h (thanks Bernado for spotting)
    openmoko: ship psplash
    psplash: add OpenMoko branding
    ttf-dejavu 2.18 remove aliases functionality until hrw commits the missing files

nicolas.ferre@rfo.atmel.com:
    at91sam9263ek.conf: tweak MACHINE_FEATURES and EXTRA_IMAGECMD

pH5@openembedded.org:
    angstrom-x11-image: replace openmoko-dialer with openmoko-dialer2
    oprofile: add 0.9.3, update cvs, drop 0.9.1 left-overs
    xcb: cleanup and update

raj.khem@gmail.com:
    eglibc: fix staging, SRC_URI and add a backport fix from gcc
    linux-omap1.inc : Use kernel uImage target instead of creating uImage from vmlinux in
bb file.

rpurdie@openembedded.org:
    bitbake.conf: Weakly assign DL_DIR so it can be set from the environment (from poky)
    base.bbclass: Tweaks from Poky (extra comment, lib handling bugfix to not clobber a
variable name and unset DISTRO (to unbreak setting DISTRO as an environment variable)
    gtk-icon-cache: Add comment from poky's version
    bitbake.conf: Merge in section and dependency setting for -dbg and -dev packages (from
poky). Start to allow multiple entries in PKG_CONFIG_PATH (from poky)
    lsof: Build fixes from poky to avoid /usr/include/
    package_deb/rootfs_deb.bbclass: Sync fixes from Poky
    zaurus-2.6: Create an install kit when generating images (from bug #2690 with
modifications)
    zaurus: Rename included conf files to .inc
    git: 1.4.4.2 -> 1.5.2.3 (from poky)
    base.bbclass: Add dependency on git-native for git packages
    patch.bbclass: Add minrev and maxrev support for patches, cleanup maxdate and mindate
support

rwhitby@nslu2-linux.org:
    slugos: Made sure the IXP modules are in the rootfs, and bumped the slugos revision in
preparation for testing before a binary release
    ixp4xx-kernel: built the ixp4xx-npe module into the kernel, so it can accept a
microcode image found in an MTD partition
    ixp4xx-kernel: Bumped svn rev to pick up new defconfig

stefan@openembedded.org:
    xcb-util_git.bb: Fix typo for include file.

woglinde2@openembedded.org:
    cacao: first support of cacao in oe
    midpath: inital support for midpath
    git: fix runtime issues
    git: fix building of git 1.5.2.3



Bugs fixed:
bug_id resolution	 short_desc
2717 FIXED	 Error for tag missing while parsing XXXX_git.bb files.
1001 WONTFIX	 bluez/bluez-utils-dbus_2.25.bb bcm203x problem
1195 WORKSFORME	 faad2-2.0-r1 is not gcc4 safe
1955 FIXED	 quilt does not get built properly with bb1.8 multithreading
2384 FIXED	 wrong uClibc.machine for simpad
2512 FIXED	 base-files has simpad-specific files
2540 FIXED	 Asterisk 1.4.x recipe
2552 FIXED	 Zaurus C3000 drains battery on stand-by
2633 FIXED	 autoconf-2.61 in OE doesn't handle OE site properly
2682 FIXED	 Fixed poodle_pm-r3.patch to compile for linux-rp-2.6.21
2690 FIXED	 Script to make zaurus images usable
2692 FIXED	 lighttpd bb file is configured --without-pcre but pcre is required to read the
conf
2693 FIXED	 Opie i18n packages need updating to 1.2.3
2701 FIXED	 [PATCH] updated libxslt to 1.1.21
2702 FIXED	 [PATCH] updated libxml2 to 2.6.29
2703 INVALID	 unable to compile kdrive 1.3.0.0
2704 FIXED	 native-quilt reads .quiltrc
2705 FIXED	 Updating cups .bb files
2707 FIXED	 compulab 2.6.20 kernel needs eabi
2715 FIXED	 [PATCH] Fix xf86-video-nsc driver on xserver-xorg 1.2.0 and later
2720 INVALID	 cannot adjust CPU speed


Bugs opened:
bug_id resolution	 short_desc
2713 	 get rid references to temporary directories on installed system
2714 	 [PATCH] lock mtd-utils to a specific git version so builds will not break unexpectedly
2716 	 package puzz-le-2.0.0: failed
2718 	 cm-x270 kernel 2.6.20 support for rtc
2719 	 lsof_4.78.bb compile fails with missing selinux/selinux.h
2722 	 Seppuku.bbclass triggers recursion error
2723 	 makedepend do_compile problem: No rule to make target `makedepend.@APP_MAN_SUFFIX@'
2724 	 makeinfo-native depends on util-macros-native
2725 	 Gpe login respawn continuosly

In total 9 bugs have been created and 21 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGus3aMkyGM64RGpERAsfIAKCud7ETzRL/u70p28v05HIO3h71bwCgnGwv
ZdqYWYrWub3aTGaBtg7Gcvw=
=Q6fW
-----END PGP SIGNATURE-----


