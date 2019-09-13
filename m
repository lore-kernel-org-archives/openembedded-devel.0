Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id DD3C46C106
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 16:39:09 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id j1so21915616qth.1
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=E3XrZMxSmPotx+BxFBA9Njah1L3tgnsyecioXMctDuQ=;
	b=HCGn5zXaUZpL6II+yXgmCD9H7FP98AKCgoXw67TRMmg6qZ2lfsV8/swWXZ3YDtd9qh
	09RijDb9rzfYR8li1A3fHxfDSlbwdLALbstckJnyyVMDqa8aQ/N9JuDpExfO+W+a/yEi
	jNzIskjlpwWMdFl63Nz6vyPeBT92C9wzvPNRrM5vLHvrbLhNMQEWEm/b2V7YMQIYXlEz
	i3INyREn1IlKsq4xEmWmMjPT4Ng1f9K6mS3IQk7j4Fe6Pq/aBvB0/EZ3h7DLqQv7JzXl
	TAjAW/mA0vhCroGW9sHK6NkhiW8w+CjDNny051Tha5rbH3kkVB2j4xlO2C+ypATeVL1R
	16Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E3XrZMxSmPotx+BxFBA9Njah1L3tgnsyecioXMctDuQ=;
	b=buXPj9XkHeTl+SiLBlknn2rob7247Ofj4FbbwFYw3eJyVrfoezoGOVz392yFRkmu57
	AYbq2kKWWIeh5LlDnjKiKE0a1bejlnw5kc47YnWDs1Yplc/uEuhoicEO1xm24Pl25OZL
	utc5Gj2ztuXxcEej7onglUQq7EfiJ/IynSOToJJOqFpbM1bDgMAxuJO4wlUZsCOhY6w/
	SoJ3SoXnqeDn59TuLpyd3I7cqDrFVlmrZV/v0DEUVA06YbtCgmN3/YCqx3Ki3j6nae1N
	GSDgIsuyAXNLy4Ud+6n2+d1UOxH7LYYYvRSMYuRBY/QQDWIEShK6oG6VWoTPoXeFs934
	aMpg==
X-Gm-Message-State: APjAAAWC6Zu5vHbJB/yowfYe+3gpXYerT9hOSiw459vRYpY9z3eMiQK9
	noVFAT87/XlQOwMg9C8kHCr17Tm90mdaXiOcSFMFsgs2nEk=
X-Google-Smtp-Source: APXvYqyJcV4GSLemYbYlaf+liPTIJTr62JH+vWXnndU7uZLypmDBd4Jxh/mnzJFy1abX4kLO/smCc+euv6c5++inYBY=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr4015846qte.194.1568392749833; 
	Fri, 13 Sep 2019 09:39:09 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 09:38:43 -0700
Message-ID: <CAMKF1sovREad73279M3h05UrYBYMKcjQtGuovfTib1mj4w6XKw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-09-13
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
X-List-Received-Date: Fri, 13 Sep 2019 16:39:10 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status_Zeus

== Failed tasks 2019-09-13 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.report.20190913_093027.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemuarm64 (0) ===

=== qemux86 (2) ===
    * sources/meta-openembedded/meta-oe/recipes-test/evtest/evtest_1.34.bb:do_compile
    * sources/meta-ti/recipes-devtools/ion/libion_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (2) ===
{| class=wikitable
|-
|| qemuarm || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm.20190913_015726.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm64.20190913_023646.log/
||
|-
|| qemux86 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86.20190913_022241.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86-64.20190913_030022.log/
||
|}

=== PNBLACKLISTs (8) ===

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

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.signatures.20190913_031105.log/
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
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568369466/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568369466/signatures.qemuarm.do_configure.sigdata.log
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
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568369466/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568369466/signatures.qemuarm.do_package_write_ipk.sigdata.log
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
meta-oe/recipes-dbs/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] =
"Since bbclass scons convert to python3, build mongodb failed"
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
from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.231 to 0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.231 to
0:1.1-r2.230) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.236 to
0:1.1-r2.235) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.234 to
0:1.0-r0.233) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.234 to 0:1.0-r0.233)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.284 to 0:1.0-r3.283) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]


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
218431b0 bitbake-user-manual: key-expansion: Don't refer to overrides
not included in master yet:
67279466 runqueue/siggen: Optimise hash equiv queries
f885155f hashserv: Drop handler thread

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
86b8a1d534 libevent: don't treat test stats line as pass/fail in ptest
not included in master yet:
47edd51970 resulttool: Handle multiple series containing ptestresults
34d9f60a8c gcc-cross.inc: Process binaries in build dir to be relocatable
06cba9883a oeqa/core/case.py: Add OEPTestResultTestCase for ptestresult helpers
b75aced558 oeqa/selftest: Rework toolchain tests to use OEPTestResultTestCase
267eb1ac98 recipes: Add runit and related recipes
97730884a0 elfutils: Fix build on ppc/musl
cfe128eee6 ptrace: Drop ptrace aid for musl/ppc
ef469345d0 python3native,pythonnative: Separate definition and export
of PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
2fd39ce85e cogl: Do not depend PN-dev on empty PN
387c28dcad weston-init: Add possibility to run weston as non-root user

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
a2928764c analyze-suspend: update to 5.5
not included in master yet:
61ccc6d4a mycroft: Remove alsa-oss from rdeps
9f825cb31 capnproto: update to 0.7.0
b7e70d79f ddrescue: update to 1.24
537c87282 evtest: update to 1.34
8322545d5 fmt: update to 6.0.0
4751dadf7 jsonrpc: update to 1.2.0
44a0885a6 libburn: update to 1.5.0
2357a20a9 libdvdread: update to 6.0.1
dcde0fdf0 libev: update to 4.27
16ea75848 libmodplug: update to 0.8.9.0
e80f4897e libnice: update to 0.1.16
c37bd9448 libopus: update to 1.3.1
bdcb7b1a5 libsass: update to 3.6.1
02462e635 libuv: update to 1.32.0
4d533cf19 libsocketcan: update to 0.0.11
91807d618 pcsc-lite: update to 1.8.25
b611e7f36 tree: update to 1.8.0
ffeb1c660 xclock: update to 1.0.9
01839184b xcursorgen: update to 1.0.7
26a1feb69 xfontsel: update to 1.0.6
f8acba819 xmag: update to 1.0.6
b707195bf xmessage: update to 1.0.5
9e828506a xorg-sgml-doctools: update to 1.11
51de7eed3 yad: new package
80e265fdf zenity: new package
0390d9dbe sysdig: Upgrade to 0.26.4

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
12ea469 qttools: Add CONFIG+=config_clang_done when not building with clang
not included in master yet:
eb63611 qt5-creator: Fix clangformat with clang 9.x

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
e4ac6bb chromium: Update to 76.0.3808.132.
not included in master yet:
~/oe/world/yoe

==================== REPORT STOP ==================
sending incremental file list
<f+++++++++ log.report.20190913_093027.log

sent 23,649 bytes  received 35 bytes  15,789.33 bytes/sec
total size is 23,515  speedup is 0.99
IRC notifier plugin: Sending notification to: #webos-ports-jenkins
Finished: SUCCESS

