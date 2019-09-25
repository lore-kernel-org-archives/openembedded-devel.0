Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 06C726D470
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 06:36:55 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f16so4321548qkl.9
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2019 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=9949uBdWT34CZzoKwtVX/mxO2LPX7hopB4n4JZwJrkI=;
	b=VBrjDkWVvznmYGil464KOG0h2kKz+mdNeq1L8aLt/UvsHWFQSwPdG1lHLB2lcfRC3y
	lsF+QZxd/TbpExeAZeDYxwzLE46sFER1+4l9BLxqfxH7x+wFk2VtqcizYDN3z/CfoZMV
	eGo+wOsSlh9vTZdCOS04ovCxos5rhf0Vf52VrqdHzlhS4cgH4TabiauIM8dshIW93nuE
	VCG3RHlDRdAs54W2ZP3E1YkkgzYPM0Tvb9np7PnQiTpONH+24ojGDTWzoVJfJgoLwl3q
	p0O5e02zNdRM9Xz1zHcmVxcm43DUElUCDw+P5v0dWw2KQAPlOQ7kfvk/L4IdqolgIP4N
	dcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9949uBdWT34CZzoKwtVX/mxO2LPX7hopB4n4JZwJrkI=;
	b=O66I+EJOuyFoQb1Ze1AgiEq+KKl1UBiY993SjisNtvCH5DRGdnZrVnAGxLWn+K1GTb
	l3Vzqqpdfxv8Lj6qHGsPFwi+VkPNq8cW6J2PWHygD/nPESJQhzLi7k7ARZxE+UKjCBB2
	wtxn1NG8e3hBdsDL2IBs7c3z8mY/WiOiwLh+9mntGrIgz5N67Syo3+X+bEOqtqa7g4tf
	JgRVfGZTX85sa5GLtNebJbM072pqDORyhAvafqF3CF9lPwdjhv/mmFtRxnRcRPX/4KiN
	4yfQ4IKUpaHm4gaud42kxaZW8mDDc+dsMKZk02VO6ngPHAP09Ljj91mxkTz4ekDL5yxM
	AVaw==
X-Gm-Message-State: APjAAAUnEdvGT5SKcuugU26wtOJdhPuqYFX9W2pCn9zhOGo6noQ/nlcP
	JM/8npeqG6xpsfQFgDOMTF73KYXH77aBlPiVbtlF4xCO6bY=
X-Google-Smtp-Source: APXvYqzhEByjQLXrLAc7f/F4iU2Su05LmW/s9XDrSJJCOfzO4CcnxfgZo4OfHaSsVF7oK5FuhJEq4lmY1Jn852S1V74=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
	g17mr2068735qkl.9.1569393416088; 
	Tue, 24 Sep 2019 23:36:56 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2019 23:36:30 -0700
Message-ID: <CAMKF1sqYfGuiOj2=xd_H89YU74XHRo21KYC+k=joLTMXvf1chw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-09-24
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
X-List-Received-Date: Wed, 25 Sep 2019 06:36:56 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2019-09-24 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.report.20190924_233141.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm.20190924_042335.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm64.20190924_045840.log/
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86.20190924_034545.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86-64.20190924_042016.log/
||
|}

=== PNBLACKLISTs (7) ===

=== QA issues (56) ===
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
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (17) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.signatures.20190924_053323.log/
    * ERROR: 17 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
xscreensaver

    * ERROR: 2 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 2 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 10 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 3 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: runit different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: xscreensaver different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1569328403/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1569328403/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
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
    * ERROR: 10 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1569328403/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1569328403/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 17 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
xscreensaver


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


count: 56 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.17 to 0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.18 to 0:1.1-r2.17) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.17 to
0:1.1-r2.16) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.18 to
0:1.1-r2.17) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.12 to
0:1.0-r0.9) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.12 to 0:1.0-r0.9)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.12 to 0:1.0-r8.9)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.12 to 0:1.0-r8.9)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.12 to 0:1.0-r8.9)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.12 to 0:1.0-r8.9)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.12 to 0:1.0-r8.9)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.12 to 0:1.0-r3.9)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.12 to 0:1.0-r3.9)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.12 to 0:1.0-r3.9)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.12 to 0:1.0-r3.9)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.12 to 0:1.0-r3.9) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.12 to 0:1.0-r13.9)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]


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
797354d2 utils: Add ionice option to prunedir
not included in master yet:
ec5871fb runqueue: Fix task migration problems
78660c11 test fixup
cfb5b329 siggen: fix
3706fac4 fetch2/git: refactor check for git-lfs command
e07b8395 tests/fetch: add test case for git-lfs handling
9bc5732f tests/data: Test combinations of _append together with override
7cb6660b hashequiv experiment

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
95ad562629 build-appliance-image: Update to master head revision
not included in master yet:
61c4136900 package: Multiple shlib_providers for the same file should error
d954ddcb2a initramfs-framework: fix var name
3806d38e61 oeqa/selftest/reproducible: test ipkgs too
30990eb18b sstatesig: Fix locked sigs unihash issue
28754a467b json-c: Don't --enable-rdrand
93ded38e66 distcc: clean up the UI install logic
bf09ec3da2 distcc: use --enable-tcp-insecure instead of --make-me-a-botnet
3d518348eb distcc: split into client and server packages
2d25ce2843 systemd: Make it build with hwdb disabled
02323d809b devtool.py: change to do clean before remove-layer
6fe314fbdd devtool.py: fix buildclean test
2bcfbfbb33 json-c: clean up recipe
01c6061f09 Revert "meta-extsdk: Either an sstate task is a proper task
or it isn't"
73c77ad537 sstatesig: Fix
dafeb7a10c recipes: Add runit and related recipes
c3e65f4e8a qemux86: Add identical qemux86copy variant for tests

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
b315c1a02 nmap: Update to 7.80
not included in master yet:
bf0c72662 mongodb: Fix build on musl/aarch64
8c8a36743 python3-test-generator: add recipe
de3865c5b sysdig: Upgrade to 0.26.4

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
12ea469 qttools: Add CONFIG+=config_clang_done when not building with clang
not included in master yet:
eb63611 qt5-creator: Fix clangformat with clang 9.x

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
59f7fb9 chromium: Use the right bb.utils call in do_check_fdlimit_for_linking
not included in master yet:
214402b chromium: Use gold linker by default
c8a493b chromium: Delete do_check_fdlimit_for_linking
~/oe/world/yoe

