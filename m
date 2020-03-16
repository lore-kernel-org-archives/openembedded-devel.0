Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D43D6023A
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 20:44:16 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id s11so17429307qks.8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=YZn6E3SKqR1WbjIaTaHQzTbge0AagCOI8M6PgLG/LhQ=;
	b=BB+e9lRhKw2GVsY+k3yxtLc3yZnh6u1hR4T1BoTksltVwOSGgiTLfwLf/Qd6IxUz/w
	ooLeQXCdS4A6/049bbroDXGpg/8Yaq+TutRgiHeUcoBByqQEVpg9zZIyV+Lw6rQSdHwg
	b3n3UHhmS2yj1sExf8cNzDlBjUK3J7L2GIQdGVJQX1cFk5tSadZ2Rbv28RWNbwbCihn+
	FCrrzXKz6B8tIg2v2i6QBxEsPhqOgimyDfNHznymk2YM76oAURvaApT6jrSGRjTKecCq
	0oJY6hYTRZWDhmUTCjBdgBZLc8AUE5oVQY2nyv1HJL+qXMqK94fm2NM32mJM9gqjrtB/
	lnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=YZn6E3SKqR1WbjIaTaHQzTbge0AagCOI8M6PgLG/LhQ=;
	b=bEwVg8Xd3p8YRYSR+RkyttIIedyZ6qN6ZvyaBKhLy72rfj/6AHQQ+N9gJNdcNWOsHP
	5d4lSUd+yU33948rPxwfMIulg6MnvtaVAUbtMVvywj5ji7uAoz7eyBW39xz315+FBO3M
	rM8TCMiRQ3mVIjI3gRWWsawoIgWeNEEtjOFaUEzwZu/gF4tNOAwoDocnglcPgxO6CXDO
	uenM/003eFMpq3Hvj+g2/DNjcq+wFn3YDUMUklR1hAildFBPFO1leeCjgzRecb7iqXC2
	34pFtMOJ+khfPUd4yO4OaTUX8+xflJJoc4JWm5obtjplVRWG5l1C5yQTuen44EqmavjG
	GzEw==
X-Gm-Message-State: ANhLgQ1Z1E2ffIpE7oQITwQ4zN9IMuWkCEgnHam3GPYjizHtZX4fC0rP
	An9yypYlLkvfH2cAEyoFmXeqBVxakJMvQPbuHAR1+VXxZUQ=
X-Google-Smtp-Source: ADFU+vsA+fD9LKaVW7MaQ0yZiRa9bp+96KagNvQxwWMmP5JvNxWL4tuzeYWtJbXvOsnGZhsThR1CK7K8yyZKHTGJTgA=
X-Received: by 2002:a37:b003:: with SMTP id z3mr1574804qke.431.1584391456611; 
	Mon, 16 Mar 2020 13:44:16 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2020 13:43:50 -0700
Message-ID: <CAMKF1srmw_yUQv0HQCqn7jzAWJFvNtm5WOJTLt49t=YTDNxwCA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world - 2020-03-16
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
X-List-Received-Date: Mon, 16 Mar 2020 20:44:16 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.openembedded.org/wiki/Bitbake_World_Status_Dunfell#Number_of_issues_-_stats

== Failed tasks 2020-03-16 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.report.20200316_203849.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm.20200315_230040.log
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm64.20200316_060031.log
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86.20200316_060038.log
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86-64.20200316_060039.log
||
|}

=== PNBLACKLISTs (20) ===


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
    * meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:PNBLACKLIST[dnfdragora]
?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
    * meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
"Needs forward porting to kernel 5.2+"


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
build without package_rpm in PACKAGE_CLASSES due disabled rpm support
in libsolv', d)}"
    * meta/recipes-devtools/libdnf/libdnf_0.28.1.bb:PNBLACKLIST[libdnf]
?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does
not build without package_rpm in PACKAGE_CLASSES due disabled rpm
support in libsolv', d)}"


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

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.signatures.20200316_070928.log

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
e67dfa4a tinfoil: Update to match recent knotty console changes
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
61d80b07bc build-appliance-image: Update to master head revision
not included in master yet:
c66847865c runit: Add runit and related recipes
0295e9228f qemux86: Add identical qemux86copy variant for tests
68910da942 qemuppc64: Add a QEMU machine definition for ppc64
9ce9e399db linux-yocto: Add powerpc64le support
02a4e9e755 report-error: Allow to upload reports automatically
930e0a3419 report-error.bbclass: replace angle brackets with &lt; and &gt;
bcc40312e9 oeqa: Extend parselogs to rpi4
90ecbe3a82 bison: Update to 3.5.3
3dbef4b1c5 bison: Reset load average settings if specified in environment

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
802f9127b flashrom: Fix build with clang
not included in master yet:
66a52463f drone: Add CI support
e3e18be30 pipewire: upgrade 0.2.7 -> 0.3.1
201e8b7d3 pipewire: Link with libatomic on mips/i*86
86d26c74f mutter: depend on pipewire-0.2 in PACKAGECONFIG[remote-desktop]

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
89de99e python-{pyqt5,pyqtchart}: fold .inc file into .bb
not included in master yet:
af02c6d qt5-creator: Inherit mime-xdg
ea67b19 gstreamer1.0-plugins-good: Turn on qt5 packageconfig
50e95c6 qtmultimedia: Enable gstreamer support

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
830ef43 chromium: update to 80.0.3987.132
not included in master yet:
b4a58f8 chromium: Fix build on 32bit arches with 64bit time_t
bf5256c chromium: Fix build with clang10/gcc10
~/oe/world/yoe

