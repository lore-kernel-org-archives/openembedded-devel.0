Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8E20E7DE74
	for <Openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:18:05 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id u22so8741211qkk.11
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=JxtVLTaJXctw/pUPRoBnCsSskuN0YPJyl0iEryKA16I=;
	b=YfoLcD3WFqojgaMH5w44eh+L3hO0R9KgYaOKezc25UXMp8Ix4PrEsdflCpPRGGwU1x
	jmo1OZFWnH7qC5a3jz19LO0HTa5k2T6l2nEhymobqrypaJ10bjDkKTXLfyRGVRX3dRCt
	0V247D16KO9ZvnbOLlGxMwfFZ0X2F7f1OzBE3+1E19/gfxOjO4vdEWqL7SZ2QuB+Wz6K
	ahwHEE1vCZHvffFOt1Tr62Vc+BeqDvoENoA9Ch2totvFWPybkkbIsOYgjs1RHCEcV+pv
	0X0bwmvwbbOXTs44m51ImAfr4jwzkoYMMTDJtdEYQq6dBFK1BEli1SHK8LSEXc1Yr1ca
	Yecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=JxtVLTaJXctw/pUPRoBnCsSskuN0YPJyl0iEryKA16I=;
	b=PjlfNc8tJ89uP5frG9AJ0VzfqGKkKcCMXVxOdkoQeR+fgJW+bUL/2qAPMX1dXAYmi0
	WaXBBx/MwOxC3R80MLVIxrkRLq7UzKgkbPZT+8JnxOaTksW9t6j+oXKG7x+kJKTEX1a6
	CJSCQQvojm0yQZBhMCXlml6vhlYXlzw7+aCYLQAijd4DQBJYYthf3SIAs/M5TETXlO/D
	nfghsVL26lV6dmFz5cN15bMxVucl8e8yCw8pfORj+PtdTqtZEqQGS4zSrGPtLtgpuWUB
	qhS+468C70ojymjiZxJZcQZE8vjv0lP1+WQirZxQUvyXaIFToJff71WDGOBq9BjYcGgN
	NsUA==
X-Gm-Message-State: APjAAAVtfX5FpszsGitiogqzTmFNEa5Q06QIF8Tcvz6Cy3M+Hc/pxX/S
	a+5MVh+tfAzg1fCDuvCVuLgtRqzy6pJRrcZd7soGN+GTpj0=
X-Google-Smtp-Source: APXvYqy6cOYe/u8Rxic90ejVsboR5s5CUcSPQklUSPJ6bmQJxvCZ4emS7Led9nZZeMvSraYKjlFjCqLWMQ6omfqs/EA=
X-Received: by 2002:a37:5cc1:: with SMTP id
	q184mr16101377qkb.212.1570292285623; 
	Sat, 05 Oct 2019 09:18:05 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Oct 2019 09:17:38 -0700
Message-ID: <CAMKF1sotOosozDZxB8eGYjsQrOOtY6U+k63KCcFutKBuFBPT3A@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-10-05
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
X-List-Received-Date: Sat, 05 Oct 2019 16:18:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hello All

Attached is the latest build state for master and soon to be Zeus
release. If you have any major package upgrades or other patches,
please send them soon. As the Zeus release approaches, we will try to
stabilize current master and lockstep release with OE-Core

Looking into shared state related fixes would be good to address as
reported in the below report

Thanks for your contributions

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2019-10-05 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.report.20191005_070333.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm.20191005_020541.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm64.20191005_024235.log/
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86.20191005_014231.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86-64.20191005_021913.log/
||
|}

=== PNBLACKLISTs (7) ===

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



=== Incorrect PACKAGE_ARCH or sstate signatures (13) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.signatures.20191005_031818.log/
    * ERROR: 13 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin

    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 9 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 3 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1570270698/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: libcrypt-openssl-guess-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-config-perl-native different signature for
task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-helpers-perl-native different signature for
task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-installpaths-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libmodule-build-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: liburi-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-sax-base-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-sax-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 9 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1570270698/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1570270698/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 13 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-clang:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
directory"
meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
= "Kernel module Needs forward porting to kernel 5.2+"
meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
= "Kernel module Needs forward porting to kernel 5.2+"
meta-oe/recipes-extended/sysdig/sysdig_git.bb:PNBLACKLIST[sysdig] =
"configure: error: in
'TOPDIR/build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.4-r0/build/c-ares-prefix/src/c-ares'"
meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
"Needs forward porting to kernel 5.2+"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:PNBLACKLIST[vboxguestdrivers]
= "Needs forward porting to kernel 5.2+"
sources/meta-qcom:
sources/meta-qt5:
sources/meta-raspberrypi:
sources/meta-riscv:
sources/meta-rust:
sources/meta-ti:
sources/meta-variscite-fslc:
sources/meta-yoe:
sources/openembedded-core:
meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
"Don't build this"
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"
PNBLACKLIST[smartrefrigerator] = "Needs porting to QT > 5.6"
PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
PNBLACKLIST[homeautomation] = "Needs porting to QT > 5.6"
PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
PNBLACKLIST[applicationlauncher] = "Needs porting to QT > 5.6"
PNBLACKLIST[evolution-data-server] = "Qemu usermode hangs forever on
abaco/kwaj builders when doing g-ir-scanner-qemuwrapper"


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
0d66f644 toaster: improve warnings when adding dependency to packages
not included in master yet:
f0f81440 bitbake: Bump verison 1.43.1 -> 1.43.2

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
520c6f30cd rootfs-postcommands: Avoid use of an hard-coded value
not included in master yet:
bc5a0d67b2 ethtool, libcap: fix upstream version check
d8cc6da29a kernel-devicetree.bbclass: add missing backslash
8e09dd88d7 devtool/standard.py: Not filtering devtool workspace for
devtool finish
6a4150c7a4 wic/direct: Partition numbering is broken for MBR primary
partition #4
5935aafed0 musl: Update to latest
a99b7bdd39 qemu: Add ppc64 to QEMU_TARGETS
515ce7cded watchdog: fix service PIDFile in do_install_append
ef3a3af13a meta: add missing some description in devtools
29f8dc9ddc oe.svg: Copy artwork from openembedded-classic.
59b3d70c17 meson: fix RDEPENDS
bf0eccf0bb insane: add check for perllocal.pod
108ce1447c meson: update patch status
d19161ac92 runit: Add runit and related recipes
e7419a15a7 qemux86: Add identical qemux86copy variant for tests
ae62f4141f qemuppc64: Add a QEMU machine definition for ppc64
8e1625b739 image.bbclass,package-index.bb: Delete do_populate_lic task
a9e3cc60e5 core-image-sato-sdk-ptest: Remove valgrind ptests for riscv
9455d460da llvm: Update to 9.0.0
7b7a283123 ghostscript: Disable libpaper

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e6d76b05a Revert "spice: Drop broken native"
not included in master yet:
fdd9aea01 zabbix: upgrade 3.0.9 -> 4.2.6
a0c79bfcc python-toml: add recipes for python2 and python3
b750c405c wireshark: fix qt5 build
ec48bd3bd php: fix CVE-2019-6978
6ce65dc3f gd: fix CVE-2019-6978
1eaeb89b9 firewalld: update to 0.7.1
b08e503eb strongswan: install dev headers
a4412258e renderdoc: add x11 to REQUIRED_DISTRO_FEATURES
e17a684f2 kea: Disable parallel install
05de7a2cb libteam: update from 1.28 to 1.29
6e31ebb24 xscreensaver: Remove xserver-nodm-init rdep
01d539b32 smem: package smemcap separately
593a29375 sysdig: Upgrade to 0.26.4
9f5e1444a catfish: upgrade 1.4.9 -> 1.4.10
a6c918c2c xfce4-panel: upgrade 4.14.0 -> 4.14.1

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
12ea469 qttools: Add CONFIG+=config_clang_done when not building with clang
not included in master yet:
eb63611 qt5-creator: Fix clangformat with clang 9.x

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
a7fdc17 chromium: Backport patch to fix renderer crash.
not included in master yet:
~/oe/world/yoe

