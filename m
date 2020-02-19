Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 450BB6108A
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 17:30:24 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id c188so874226qkg.4
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XL3B+b51Wl69yP1DayfCL1l1cs6xUuKPmCIkWN60epI=;
	b=TSuObd1Vx4boJyHcrodv2jb6MJs+aHAhmOM+zRpDza5vNfXy9P4aEVqGmlxPkoflu5
	A9jRx1yi4aQw0Hs/DIJk3qMZ3weSj0rlAAAVRpLPUZuk7o0WJlcy5OSxE6ufa7jc/4Yj
	I6yyyQq+3WKnpEm0C7Twigo8wNBQVHfgie3YIaCbjVDR9GJ0+oqWTjuo7S3DuoonnU6w
	NWKoNndpITD4O8xSIbTosXuqQY9C+fesiwFsJXea1KLCD2LacNWm4CrrxJMP2VfApUAI
	LK+sJjKZT2lZ8ywOeBggkiPcSBebuUIW/nCpwA7iQ0jrG0EbCLa6GjyOZfRj5pXhYnQm
	5q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XL3B+b51Wl69yP1DayfCL1l1cs6xUuKPmCIkWN60epI=;
	b=CaxzqBS8ErIJDdZB5K9CheWee35VT5ZuIaLcqX4OmkgpUQeudHJKVs709TU8rVIXcL
	hn1E4oaAn3UVNA4dPWc5vMZc11OvLIgmJIq27cAxwKubD+6DEOry7TPcZ+hWXXTIZ690
	b5F8C90zEOB5vTU4+6swvQXgn6mMoqMQxCi2B25iOIXyF3m856kfqG7094YjjjbO72I6
	owx3KL21FIoGOxsvdVZzBjH/GXtO+02rx2OpIjR2K08m82WPHBx6MWTJBqHow1tOfR+h
	MZpD2PSnHwVm+PcMpVZfdFk5ENnY2jfmufcKubUc7t/9hm9xMs1DvRn0xXYPJzUNwsEM
	MtCA==
X-Gm-Message-State: APjAAAVouACkwJsYqh8eO5Ug8XxT65U1vlCIpQzz6mQFGzYnZxnBCzUA
	GF8oU0wwLXfkMwMTRCuojUFL/WkfDW5qKihY4s1Z2hFrnnQ=
X-Google-Smtp-Source: APXvYqwA8r6q9gympyfJJvE4ahhtX+9fEYje2BIdMrf2AMnwfGPcC5qWiJl87mWCQ4BJzmM2gHsVj8ZVQizkNer68Xw=
X-Received: by 2002:a05:620a:11a6:: with SMTP id
	c6mr5063854qkk.225.1582133424318; 
	Wed, 19 Feb 2020 09:30:24 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2020 09:29:58 -0800
Message-ID: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world - 2020-02-18
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
X-List-Received-Date: Wed, 19 Feb 2020 17:30:24 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks /media/ra_build_share/buildlogs/oe/world/dunfell/2020-02-18 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.report.20200219_150007.log

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
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm.20200218_155946.log/
||
|-
|| qemuarm64 || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm64.20200218_235936.log/
||
|-
|| qemux86 || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86.20200218_235938.log/
||
|-
|| qemux86_64 || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86-64.20200218_235937.log/
||
|}

=== PNBLACKLISTs (22) ===


sources/meta-openembedded:
    * meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
directory"
    * meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
= "Kernel module Needs forward porting to kernel 5.2+"
    * meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb:PNBLACKLIST[lowpan-tools]
= "WARNING these tools are deprecated! Use wpan-tools instead"
    * meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb:PNBLACKLIST[dnf-plugin-tui]
?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
    * meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb:PNBLACKLIST[nanopb]
= "Needs forward porting to use python3"
    * meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
= "Kernel module Needs forward porting to kernel 5.2+"
    * meta-oe/recipes-extended/sysdig/sysdig_git.bb:PNBLACKLIST[sysdig]
= "configure: error: in
'TOPDIR/build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.4-r0/build/c-ares-prefix/src/c-ares'"
    * meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:PNBLACKLIST[dnfdragora]
?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
    * meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
"Needs forward porting to kernel 5.2+"


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


sources/openembedded-core:
    * meta/recipes-devtools/dnf/dnf_4.2.2.bb:PNBLACKLIST[dnf] ?=
"${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not
build correctly without package_rpm in PACKAGE_CLASSES', d)}"
    * meta/recipes-devtools/libdnf/libdnf_0.28.1.bb:PNBLACKLIST[libdnf]
?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
not build correctly without package_rpm in PACKAGE_CLASSES', d)}"


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

Complete log: /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.signatures.20200219_065929.log/

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
5d98d8e3 cooker/siggen: Empty siggen cache during parsing
not included in master yet:
dc7d32ff runqueue: Possible tid handling optimisation
01ff1090 knotty: Make the bb.command.CommandExit event terminate bitbake
35cf83cd fetch2: Make fetcher_compare_revisions() work
0771b3a0 fetch2: Allow ${AUTOREV} to be used when BB_SRCREV_POLICY is "cache"
9c6eb977 data: Don't allow renameVar calls with equivalent keys
65419e33 cooker: Reset loghandler

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
c9b5802bbe openssh: Upgrade 8.1p1 -> 8.2p1
not included in master yet:
13e1363cde oescripts.py: use unittest.SkipUnless for class skip
5414e256e7 base.bbclass: extend PACKAGECONFIG for conflict package configs
59e9c52807 glew/curl: specify exclusive package configs
a112eb667d HACK: signing: Add extra test debug
59328e8092 sstatesig: Log timestamps for hashequiv in reprodubile builds
7a9fa1683c rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
1a4872c94e HACK: extra debug
e133b7f015 newlib: Move syscalls from newlib to libgloss
ad48167cd5 procps: upstream has switched to gitlab
9087ae6af1 qemux86: do not add vga=0 to kernel parameters
a7658b2564 qemux86: drop resolution setting via uvesafb
d9db0bb09d weston: add a basic runtime test
a69d8015d9 ptest-packagelists: mention ifupdown ptest in a comment
03fb91067f python3: resolve ncurses host contamination
b4b251a9a1 fix various, innocuous typos
beb5431370 systemd: upgrade v244.1 -> v244.3
250608b408 insane.bbclass: Correct typo inhert->inherit
688052a94b babeltrace: update to 1.5.8
0586fcdc04 webkitgtk: Fix errors when api-documentation is enabled
6b742380b7 p11-kit: Fix builds with systemd
94887b7f63 concurrencytest.py: add outSideTestaddSkip for subunit
8ea40e11c8 glibc-package.inc: fix multilib headers conflict
36ff08511b perl: Fix encode module reproducibility issues
cb75b6806b iproute2: add devlink support to iproute2
02df17f909 glib-2.0: add dependencies to fix ptest failures
e940c7f1c8 runit: Add runit and related recipes
a9096a5598 qemux86: Add identical qemux86copy variant for tests
8fd55d85b3 qemuppc64: Add a QEMU machine definition for ppc64
22668875c1 linux-yocto: Add powerpc64le support
2e476e3f40 report-error: Allow to upload reports automatically
ecd5f49df9 report-error.bbclass: replace angle brackets with &lt; and &gt;
6a7e548e87 libsolv: Enable rpm packageconfig by default only if rpm
O_P_M is enabled
799e34d485 dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
d459ead5c xfce4-whiskermenu-plugin: upgrade 2.3.5 -> 2.4.2
not included in master yet:
9f3e738cb mpv: Disable lua support for riscv
cbe0b4301 libgphoto2: remove executable permission bits of udev rule file
416c4f7d5 perl: Add libperlio-gzip-perl and libjson-perl
64441dc46 lcov: Add support for intermediate JSON format
7002e7dd3 lcov: Add missing missing RDEPEND and enable nativesdk
dec5ceaac python3-pyflakes: Add python3 version
71c233683 netplan: rdep on python3 version of pyflakes
b89254a8b rsyslog: Use python3 in ptests
7b0d354fb x265: Move into meta-multimedia
0bb390bbb gssdp: Upgrade to 1.2.2
7672f53cb gupnp: Upgrade to 1.2.2
385752703 gupnp-dlna: Rename patchdir to PN
a067634be rygel: Upgrade to 0.38.3
d474aab6a gupnp-tools: Upgrade to 0.10.0
eb50fb0ae gupnp-igd: Upgrade to 0.2.5
af2be2e96 gupnp-av: Upgrade to 0.12.11
c3a23760b drone: Add CI support
75591d24f sysdig: Upgrade to 0.26.4
2e3caaf9c fetchmail: upgrade 6.4.1 -> 6.4.2
074d8ec67 libnet-dns-perl: upgrade 1.21 -> 1.22
6db4dbf1c cifs-utils: upgrade 6.9 -> 6.10
2d909ef26 dleyna-core: Update to latest to support gupnp 1.2
8b5f4e5fc dleyna-server: Bump version to support 1.2 gupnp
6a9c2a271 graphviz: Depend on py3 at runtime
3115a33c9 pm-graph: Renamed from analyze-suspend
d000373e1 cfengine: Upgrade to 3.15
1ad1a99ff dleyna-renderer: Fix build with gupnp 1.2+
98f20ffec mariadb: Add pam_auth to server package.

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2391474 Revert "qtwebkit: remove"
not included in master yet:
0bbd0eb qtwebengine: Link libatomic on x86/32bit
c8cd55b qtwebkit: build with python3
f18d594 qtbase: fix build with platform where FE macro are not defined
caf09cd Add PyQtChart.
b45a400 qtwebview: Skip if meta-python is not present

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
1697014 chromium: Fix patch fuzz
not included in master yet:
bc02d6d chromium: Fix build on 32bit arches with 64bit time_t
334855d chromium: Fix build with clang10/gcc10
~/oe/world/yoe

