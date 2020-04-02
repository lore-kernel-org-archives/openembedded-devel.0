Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.139.1585847381341552226
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2020 10:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q/wKVN7+;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id l25so4783835qki.7
        for <Openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2020 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=8HY+1EFjtkU97fRkyoHBg55HPwlusO/HSVYHLJNg5oM=;
        b=Q/wKVN7+lOjzhqfMI0IS6v4QboshRmBjCYoEqUx3xjOHLsBLQoGL0jvSks/gC3fAgz
         Od7TuebpfIN7cCcWTvMZjfKo2cOu/GhU+NuDEj3VYYyWr7aNjJv7dLziqinnWol49xBN
         k94Tq7FyjIGBrx5B8b7rw2cIcK6e5/rHUgDS5DEcK+4Ki8KojLggg+iB8lepkwB6rPZZ
         PLeKTe3SsHB8MseY5CT9Vh//c6DwbdhWuY9u2kEr6kFZQKyX0UA7/vDw24yIylkrXC/o
         J0qhLky3Jj0NYGP+jhKUMgxJoO1SIL03UUajYmTeKvDpgDY4FPVzlMn24RmQzVCL3kY8
         kIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8HY+1EFjtkU97fRkyoHBg55HPwlusO/HSVYHLJNg5oM=;
        b=J/s3a58ENYmAAi9PMYNGdpZv91HKdQ8tXeSnQEo2u0OTXNF6nmoKdINZ6Tlv0tidAw
         uvYIJNFasCIwIKLmuOt0NJPqf9zhPKW/5r6Xt9E0gQ9ac1kitIRleGh6jbp4OhqLbPJd
         iWLc3JfSUSeJy1yNqxJ8LpuDnfHUmC243FR5UzpQ5aVtP0cI8XuAbbPY33+UmZwRJNQp
         knrSWD35nA0lnwvRL6QQnJ11toTpUiZ5N6RQzzyj8T5TrYX5fSefywVL2FymhC9dhcy5
         lljE5B5UmmGzRt2eEqBwr6X2sZ6gNRctHkX44wYC13T6qo4JGkZazIXGj+MibnKyPguR
         IF6A==
X-Gm-Message-State: AGi0PuaDJTX/4gOKg1xJvw4m4S1WjgrN027A3JqMtgswBACDjE26Q3sX
	QvHDkbkOeBnmLpRae2X24Fw55vXy68g4agqji95jSMQsMT8=
X-Google-Smtp-Source: APiQypKrfC/vMhf+xIFbXraed6AAPlphmFaBToG69QQJd8llEuEM6dSns9VqExfpUYgNuLCCsOQfpsPOOM8w4fv+HMs=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr4329500qkd.17.1585847379786;
 Thu, 02 Apr 2020 10:09:39 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 2 Apr 2020 10:09:13 -0700
Message-ID: <CAMKF1sp5NP2VmydNzESpWaH7VJTt-wdtVNDksK6Uwqfkt1rDbw@mail.gmail.com>
Subject: State of OE World - 2020-04-02
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2020-04-02 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.report.20200402_163251.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm.20200401_232948.log
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm64.20200402_062944.log
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86.20200402_062946.log
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86-64.20200402_062944.log
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

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.signatures.20200402_063259.log

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
5bd29d44 toaster: fix for import build directory with var refs in BBLAYERS
not included in master yet:
9a5dd1be fetch2: Fix urldata_cache key issues

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
38e3d5bd3d scripts/oe-buildenv-internal: Add pointer to
scripts/install-buildtools
not included in master yet:
f12d1d22fc runit: Add runit and related recipes
d01fb788e3 qemux86: Add identical qemux86copy variant for tests
010b1f4802 qemuppc64: Add a QEMU machine definition for ppc64
60048b9a77 linux-yocto: Add powerpc64le support
82116820ad report-error: Allow to upload reports automatically
9dc108edf5 report-error.bbclass: replace angle brackets with &lt; and &gt;
f83cc1b000 lto.inc: Add global LTO distro policy file
7e156da927 gstreamer1.0-plugins-good: Fix build when egl is enabled
but no x11/wayland
0b7fc6c314 binutils: Do not build gold linker on mips/glibc

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
a6e846dad libgpiod: update v1.4.2 -> v1.4.3
not included in master yet:
7810ed60e openzone: Package icons
1e2da42fa kea: upgrade 1.7.5 -> 1.7.6
0ca71a262 strongswan: upgrade 5.8.2 -> 5.8.4
b5c694db6 gsoap: update 2.8.99 -> 2.8.100
a94b7befe kpatch: upgrade 0.9.0 -> 0.9.1
efdb95f70 libdvdread: upgrade 6.0.2 -> 6.1.0
28fe5881c usb-modeswitch-data: upgrade 20170806 -> 20191128
10f72cb1f usb-modeswitch: upgrade 2.5.2 -> 2.6.0
a3df40b1b kernel-selftest: add firmware tests
31da4a2cb kernel-selftest: only emit warning on clang if bpf is built
ffc0878a7 netkit-telnet: Use alternatives to avoid manpage conflict
6c44a5ebe tftp-hpa: Use alternatives to avoid manpage conflicts
8263131bb python3-parallax: add new recipe
207d738db poco: add UPSTREAM_CHECK_GITTAGREGEX
ec1e92937 libp11: add UPSTREAM_CHECK_GITTAGREGEX
ed4d7e291 XXX: Add DRONE CI support

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
b88c292 qtquick3d: Fix branch for fetching assimp submodule
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
4642816 layer.conf: Mark layer 3.1 release compatible
not included in master yet:
f2b1949 chromium: Fix build on 32bit arches with 64bit time_t
fab5f62 chromium: Fix build with clang10/gcc10
~/oe/world/yoe
