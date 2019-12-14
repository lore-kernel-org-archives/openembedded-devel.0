Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id B925F7E3BC
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 15:52:36 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l12so1851192qtq.12
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ETe7b6MGtlYGCyQR37QFRCuzd6Etr3WK4pEl1YFvf8E=;
	b=kBPdp+9D2b9nokbKScIkVYVN8Gmp2OihZXmcRNEj7KtvJFi9DOmAAu9FGEbeFkrDpk
	09RsN+B+U3yQ3xMoY8iab6UJir5sovyLxAk/DRdDf91UQswj2DOth0W16rtLfeVq9csS
	T7+EJwFqw4r5jHC0l3UhO8bYCbNQD7q1LaXbWo44gtOzKND3BYvfyt/B+d9gG6PBOcKD
	YeLO4DoCD/3Q+E5Fyg185QFMrGEFi1ufyfVI7+mXBUL8FmAH9IUw6IROr5bYGOrhDEhb
	v4/dRElRf3WQ7XbiV9CcfhtJc0h+P+VYe6787TY24BnrO1iFO1W4UDNYJlAU18Tc+f64
	A9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ETe7b6MGtlYGCyQR37QFRCuzd6Etr3WK4pEl1YFvf8E=;
	b=EzNw6kpo59moEO//B1z12cUwjcsSdCXz/3M5aBPTX5F3jh3dE+TTNiXFr2pfZYIPA/
	kQwcCLVD3/i0lm+3iyZBxhIGMRPsCZmCyJ8jkodmfu8uQtFQ49OF2q0FSloE6o5utw6A
	GSbwYNf2M+d205RGYwNBZ6oRLj3DQRciVZaNADcAaAsRlodHH9X56jB5j9KtQ8tuKvrZ
	LwlQY6pVIF2qd+5g420VvNRtpBHixTR6XT945FZQ/ayLEPg9GzSn92aEOOP/0NvmRoMM
	rc0ZRCC7dRv7lbJGFCvZWRagqptXdpn/Qn92PFnR5Mr1+9Vq8kqe+Kjop4T3iR1YsUqI
	VRxw==
X-Gm-Message-State: APjAAAVkwgQTyXo72LQV1UqVo4jrP/Bbl/kR/oK5LGjyiamm9ehSsuuF
	xuhYVXBRkvrhL66KGLwJN8Nj5pyLEXK9yxjTZeQ0Lyj4hHQ=
X-Google-Smtp-Source: APXvYqzt2rkPXDq6CO5asCBa90PUZejnRIY/qnbqB8K8yMuaY6UVcYPzzUSfoei1fBbHerwGpXDtKfLc+JbZySev4Yc=
X-Received: by 2002:ac8:6ca:: with SMTP id j10mr13820552qth.378.1576338757116; 
	Sat, 14 Dec 2019 07:52:37 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 07:52:11 -0800
Message-ID: <CAMKF1soB2OV9cXqGdz8iEgDRQv+PDLQ3rqGzwtNopLqP48SyDw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-10-03
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
X-List-Received-Date: Sat, 14 Dec 2019 15:52:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hello All

Attached is the status for master, everything is clean for once.

https://www.openembedded.org/wiki/Bitbake_World_Status_Dunfell

== Failed tasks 2019-12-13 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.report.20191214_074304.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemuarm64 (0) ===

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (0) ===
{| class=wikitable
|-
|| qemuarm || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm.20191213_215925.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm64.20191213_223826.log/
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86.20191213_215919.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86-64.20191213_223836.log/
||
|}

=== PNBLACKLISTs (18) ===


sources/meta-openembedded:
    * meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
directory"
    * meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
= "Kernel module Needs forward porting to kernel 5.2+"
    * meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb:PNBLACKLIST[lowpan-tools]
= "WARNING these tools are deprecated! Use wpan-tools instead"
    * meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
= "Kernel module Needs forward porting to kernel 5.2+"
    * meta-oe/recipes-extended/sysdig/sysdig_git.bb:PNBLACKLIST[sysdig]
= "configure: error: in
'TOPDIR/build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.4-r0/build/c-ares-prefix/src/c-ares'"
    * meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
"Needs forward porting to kernel 5.2+"
    * meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:PNBLACKLIST[vboxguestdrivers]
= "Needs forward porting to kernel 5.2+"


sources/meta-qt5:
    * recipes-python/pyqt5/python-pyqt5_5.13.2.bb:PNBLACKLIST[python-pyqt5]
= "Sip fails in do_configure sip: QOpenGLFramebufferObject is
undefined"


sources/meta-yoe:
    * conf/distro/yoe.inc:PNBLACKLIST[build-appliance-image] = "tries
to include whole downloads directory in /home/builder/poky :/"
    * conf/distro/yoe.inc:PNBLACKLIST[smartrefrigerator] = "Needs
porting to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[homeautomation] = "Needs porting
to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[applicationlauncher] = "Needs
porting to QT > 5.6"
    * conf/distro/yoe.inc:PNBLACKLIST[spacetouch] = "Needs porting to
libplanes 1.0"
    * conf/distro/yoe.inc:PNBLACKLIST[qtviewplanes] = "Needs porting
to libplanes 1.0"
    * conf/distro/yoe.inc:PNBLACKLIST[egt-thermostat] = "Needs porting
to egt 0.8.2+"


conf/local.conf:
    * PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need
to be tested so much"
    * PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to
be tested so much"
    * PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to
be tested so much"
    * PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need
to be tested so much"
    * PNBLACKLIST[build-appliance-image] = "tries to include whole
downloads directory in /home/builder/poky :/"

=== QA issues (0) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||host-user-contaminated
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||qa_pseudo
|-
||0 ||symlink-to-sysroot
|-
||0 ||textrel
|-
||0 ||unknown-configure-option
|-
||0 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.signatures.20191213_231614.log/

No issues detected


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 0 issue: textrel


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 0 issue: version-going-backwards


count: 0 issue: host-user-contaminated


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 0 issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report
~/oe/world/yoe ~/oe/world/yoe

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
1e561672 siggen: Fix performance issue in get_unihash
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
0f04e81c79 build-appliance-image: Update to master head revision
not included in master yet:
107da59d54 runit: Add runit and related recipes
d0d254eb84 qemux86: Add identical qemux86copy variant for tests
67a5abb2ba qemuppc64: Add a QEMU machine definition for ppc64
83371b2bd7 image.bbclass,package-index.bb: Delete do_populate_lic task
13cba91e9d report-error: Allow to upload reports automatically
377b8278af report-error.bbclass: replace angle brackets with &lt; and &gt;
4b45ab4b80 musl: Upgrade beyond 1.24
95e1f9d8e1 tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags
af55e20f4b libucontext: Add recipe
adb5f3b17f util-linux: Use PCRE for hardlink
e5fd1c1e7d mesa: Fix vc4 build for 64bit time_t changes on 32bit arches
eb7a9662f8 cross-localedef: Re-arrange patches
a74ddb55c2 sysklogd: update to 2.0.3
197f6f4b90 sysklogd: Fix 2.0.3 upgrade fallouts on musl
6aa87c7f53 buildstats: Replace 'is' with '==' in python condition
check expression
8394a9e2fc kbd: avoid vlock conflict with busybox when pam is enabled
e582f08f62 libpng: Correct SRC_URI path
6b554ef421 goarch: Remove target specific dependencies
480afa1bc0 Revert "go: Reset unneeded GOARCH variables for native recipe"

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
851321744 gpsd: Add a PACKAGECONFIG for disabling usb support
not included in master yet:
ee007abc6 id3lib: Update to newer debian patchset
21cc8fed2 libdc1394: Update to 2.2.6 release
f570bb50a xterm: upgrade 350 -> 351
b799a20fa wireshark: upgrade 3.0.6 -> 3.0.7
dfc52e24f python3-xxhash: upgrade 1.4.2 -> 1.4.3
4d01d33f4 python-jsonpointer: enable native/nativesdk
c1d1697c5 libssh2: add nativesdk support
05d876b8f gjs: initial add 1.58.3
88cb338ca gdm: re-add 3.34.1
3b2293ded gnome-shell: initial add 3.34.1
8250211de gnome-shell-extensions: initial add 3.34.1
a811e1a0a accountsservice: initial add 0.6.55
019e4ad5a rest: initial add 0.8.1
b04c66677 gnome-online-accounts: initial add 3.34.1
eba5a2344 gnome-control-center: re-add 3.34.1
1d133548e gnome-session: inital add 3.34.1
29f034c42 gnome-panel: (re)add 3.34.1
9ccb12210 gnome-flashback: initial add 3.34.1
4b7c1340e Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
05ce3eba1 glfw: add features_check to inherit
1d6a1d38b stalonetray: Add x11 to required distro feature
9a956844b projucer: add x11 to required distro features
8641eed3a colord-gtk: add polkit to required distro features
26cb884fc yelp: add x11 to required distro features
3cab4ce7f file-roller: remove nautilus from DEPENDS
4ce1faf54 libgdata: add x11 to required distro features
079137f59 accountsservice: Hack musl build fix
90e33e509 libsmi: Use right name for tcl license
1a456aa75 blueman: disable appindicator support
421f6dddb xfce4-panel-profiles: 1.0.8 -> 1.0.9
f55e25931 exo: 0.12.9 -> 0.12.10
5363ce811 thunar: 1.8.9 -> 1.8.10
09001b53a python3-pystemd: upgrade to 0.7.0
41be29ccd boinc: update recipe to version 7.16.3
68be5fe16 googletest: fix build with newer oe-core without python in HOSTTOOLS
8cf6b0e9d python-slip-dbus: don't use relative paths
4f3e44d4a python-m2crypto: don't use relative paths
28d6b7aee python-coloredlogs: don't use relative paths
2dcc439aa python-lxml: remove redundant sed (fixed in 4.3.0 onwards)
776ca8771 python-lxml: remove redundant RDEPENDS_class-native
6d87abfa1 librsync: new package
954b3209d netperf: add "intervals" and "histogram" PACKAGECONFIGs
c3a3470b1 python-twisted: add missing RDEPENDS for conch
f0a641554 ostree: Upgrade 2019.5 -> 2019.6
38d197505 accountsservice: fix build for systemd not in DISTRO_FEATURES
3c448a017 gnome-font-viewer: fix copy & paste typo in SUMMARY
ba5fbb239 phpmyadmin: upgrade 4.9.1 -> 4.9.2
a04e0ed79 libsoc: use python3 for python bindings
a02c41342 xdelta3: update to v3.1.0
52cfe934c xdelta3: add native and nativesdk to BBCLASSEXTEND
bbecc5dfc fltk: fix build error when enable package config examples
9625a375e libnftnl: upgrade 1.1.4 -> 1.1.5
7906fbb40 hdf5: Upgrade to 1.8.21
5a293cf43 tk: upgrade 8.6.9 -> 8.6.10
a5cdd2907 xterm: Fix latent issue found with musl
12a1bd3eb samba: fix wrong shebang for python3
72600f0a4 mozjs: extend --with-intl-api=build to all mips
3fc59d3b9 gtk-xfce-engine: remove this recipe
1a2dd65a5 drone: Add CI support
38d45dc54 sysdig: Upgrade to 0.26.4

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2503916 qtwebengine: Fix build with 64bit time_t on 32bit architectures
not included in master yet:
2a2055f recipes: Disable clang dependent recipes for riscv64/32
0d88f44 packagegroup-qt5-toolchain-target: Make machine specific

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
8fb36e8 chromium-ozone-wayland: Fix occasional rendering freezes.
not included in master yet:
2133580 chromium: Add a patch to fix build with pulseaudio 13
5e090bd chromium: Do not entertain newer warnings from clang
2a53c14 chromium: Port forward musl patches
~/oe/world/yoe

