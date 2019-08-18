Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id B6A996C106
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:54:00 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id t12so11484472qtp.9
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dwr2LCUdH8QlMo5stg8hDWo1NgeXPxlSKammkyA3VfI=;
	b=dodSupBuK5ZdQSFG9cj7BG8A7Wfdx6IU6DSBkfnSZ62GTc+zD8k49H0zhw+4G3iZpS
	D6OTP+5z27DNQQo60NfQPkPbuoJ4577t6cnSyMGFE4E5qzn9QCS6ePImZ2ojZNEZT25k
	XYAsavzYLlymh156Z1prGNur8elS5zEpxHpmBd6cNWea1eRA0dM2/69lSFyoopC6OyYZ
	Vd4VuHGtNBfNvw6XJDgtddz5XjwsWJmM5OGwV+PDK2RPOUoaTtossZzVCKphr21iAJc6
	T/RR92h99uqUWX3tF9Sg0kri7MDPhh8iZ8HOK7A5zLds24N+BrqvV1iBv5DwCpDh/7YT
	PSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dwr2LCUdH8QlMo5stg8hDWo1NgeXPxlSKammkyA3VfI=;
	b=n3xDKBt69PnZX599Sk8K0dEBhlk/lP+Luan9bYDjrS17kwH9J9KXgpECBcpBYxk2az
	py+0ARIYFXdppIGPBw1W8zlscHa6WcrWnRowFgX7wpBGdKr5NKSLBG6y0f1gTksmPDld
	zMnjiHZ8KLDnNAf2gqorJzBW0YBab28HoQPtwOtpUDWmfEddBM33B696MrKgaRl4Kuuw
	q1XDt/x3MCUH9XGbKvMR1Oc7V1cTGmovVLR75u62/uo+KWYWum3yIyx2VLQBC4V3itQK
	AgsuADOrVA+gtKEcHlX2pbScI8jM2lq4vMrCGsZOleSSuKK8O37XZcnn3bjMUg0FTrdD
	nR8A==
X-Gm-Message-State: APjAAAXX2Kaw3uZrbJlsOIHh/oeOrKPqRE1vXhCZM2X//UWXKCBPndrq
	MhpUeyzuH7A2I887+jwgM8OMFaFpyKNo7vxxTtbI5ppcXBk=
X-Google-Smtp-Source: APXvYqwQCtA0lq2lk0D+vt3C8s2x7ugZ49e431jGH9lJdxIZLt+5W4ZOnEp1RMe/26Uhmqi+ktFv5d9kuDvrR8lgpUo=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr16941370qtx.80.1566143640831; 
	Sun, 18 Aug 2019 08:54:00 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Aug 2019 08:53:34 -0700
Message-ID: <CAMKF1sqk0oSaJgoGnOX09F5KRvdAJMejgLtNmeaa+0zME-ROyw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-08-18
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
X-List-Received-Date: Sun, 18 Aug 2019 15:54:01 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.openembedded.org/wiki/Bitbake_World_Status_Zeus

== Failed tasks 2019-08-18 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190818_084240.log

=== common (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (4) ===
    * sources/meta-freescale/recipes-extended/dpdk/dpdk_18.11.bb:do_compile
    * sources/meta-freescale/recipes-extended/vpp-core/dpdkvpp.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile

=== qemuarm64 (2) ===
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.30.bb:do_package_qa

=== qemux86 (4) ===
    * sources/meta-openembedded/meta-oe/recipes-core/safec/safec_3.4.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile

=== qemux86_64 (1) ===
    * build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.1+gitAUTOINC+baf311c42c-r0/build/openssl-prefix/src/openssl/target

=== Number of failed tasks (34) ===
{| class=wikitable
|-
|| qemuarm || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190817_233622.log/
||
|-
|| qemuarm64 || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190818_001623.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190818_021753.log/
||
|-
|| qemux86_64 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190818_025723.log/
||
|}

=== PNBLACKLISTs (3) ===

=== QA issues (58) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
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
||1 ||build-deps
|-
||1 ||host-user-contaminated
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (17) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190818_005145.log/
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
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1566114705/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1566114705/signatures.qemuarm.do_configure.sigdata.log
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
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1566114705/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1566114705/signatures.qemuarm.do_package_write_ipk.sigdata.log
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
meta-oe/recipes-dbs/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] =
"Since bbclass scons convert to python3, build mongodb failed"
meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
= " error: invalid use of incomplete type 'RCF::AsioIoService {aka
class boost::asio::io_service}; among others?"
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


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 0 issue: textrel


count: 1 issue: build-deps
gparted-0.33.0: gparted rdepends on hicolor-icon-theme, but it isn't a
build dependency, missing hicolor-icon-theme in DEPENDS or
PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 56 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.191 to 0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.198 to 0:1.1-r2.197) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.191 to
0:1.1-r2.190) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.198 to
0:1.1-r2.197) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.200 to
0:1.0-r0.199) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.200 to 0:1.0-r0.199)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.252 to 0:1.0-r8.251)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.252 to 0:1.0-r8.251)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.252 to 0:1.0-r8.251)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.252 to 0:1.0-r8.251)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.252 to 0:1.0-r8.251)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.251 to 0:1.0-r3.250)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.251 to 0:1.0-r3.250)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.251 to 0:1.0-r3.250)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.251 to 0:1.0-r3.250)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.251 to 0:1.0-r3.250) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.252 to 0:1.0-r13.251) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.252 to 0:1.0-r13.251) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.252 to 0:1.0-r13.251)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.252 to 0:1.0-r13.251) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.252 to 0:1.0-r13.251) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.252 to 0:1.0-r13.251) [version-going-backwards]


count: 1 issue: host-user-contaminated
glibc-locale-2.30: glibc-locale:
/usr/lib/locale/ar_EG.ISO-8859-6/LC_MEASUREMENT is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]


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
94e848ae runqueue: Ensure target_tids is filtered
not included in master yet:
c992dd9f bitbake: hashserv: Add request statistics
1839ffab bitbake: hashserve: Log I/O waits and SQL time
9e23e797 bitbake: hashserv: Add more threads
7717aaa1 cookerdata: Delay the setup of the siggen slightly to allow
metadata defined siggens
94a77b3c runqueue: Small but critical fix
dd308b79 runqueue: Optimise holdoff task handling
fcd69204 runqueue: Further optimise holdoff tasks
69a0865e runqueue: Optimise build_taskdepdata slightly

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
6b36db8365 libevent: update to 2.1.11
not included in master yet:
53e975c18a kernel-devsrc: tweak for v5.3+
eb60f1544f kern-tools: Add SPDX license headers to source files
78b0ff5960 linux-yocto: arch/x86/boot: use prefix map to avoid embedded paths
3063d64984 kernel-yocto: import security fragments from meta-security
461a2f5475 kconf_check: tweak CONFIG_ regex
fd6cf57430 stress-ng: provide stress
a777e0f34e linux-yocto/4.19: make drm-bochs feature available
569d3f5d04 linux-yocto: add drm-bochs support
d67417ec55 webkitgtk: disable gold on mipsn32
0e59089813 musl: Update to latest tip
46e49b14b5 systemd: Drop musl __secure_getenv patch
853179121e mesa: Add packageconfigs for vc4 and v3d
a57f56576e util-linux: Make pam specific logic apply to target recipe alone
f2d60e0f6a systemd.bbclass: Limit rm_sysvinit_initddir and
rm_systemd_unitdir to target alone
5268ee5b0a systemd: Refresh patch after removal of __secure_getenv patch
d00fac5bb9 gcc-9: Upgrade to 9.2
658e0831d5 ffmpeg: update to 4.2
841d458f01 python-setuptools: update to 41.1.0
ae2869c82a python3-scons: update to 3.1.1
76caa7aece dbus: disable test-bus
6a38c6aafc target-sdk-provides-dummy: extend packages for multilib case
b6e7fb75cb qemu: Upgrade to version 4.1
6c849f52a2 scripts/runqemu: Add support for the BIOS variable
fdbcedf186 ofono: update to 1.30
9eba217dde yocto-check-layer: Ensure we use OEBasicHash as the signature handler
98c1380c96 package: Fix race between do_package and do_packagedata
d0323cb126 recipes: Add runit and related recipes
67d618cbe5 oeqa: Recognise svlogd as another logger
7e6ec79804 gcc: Search in OE specific target gcclibdir
e426387295 libffi: Upgrade to 3.3-rc0

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
c95842cdc stress-ng: delete recipe
not included in master yet:
a6eeacedd xfsprogs: upgrade 5.1.0 -> 5.2.0
0aa96837f xfsdump: fix error to work with xfsprogs 5.2.0
274e6e40f packagegroup-tools-bluetooth: correct RDEPENDS
84bf94bfe php: zlib and zip support
2751445c5 libopus: Limit forcing ARM mode ISA to v5 only
119878bd3 xfce4-whiskermenu-plugin: upgrade 2.3.2 -> 2.3.3
2841f0ef1 xfmpc: upgrade 0.2.3 -> 0.3.0
1db53f752 xfce4-cpugraph-plugin: upgrade 1.0.5 -> 1.1.0
3af956f02 xfce4-terminal: upgrase 0.8.7.4 -> 0.8.8
0d505e309 gtksourceview3: upgrade 3.24.10 -> 3.24.11
074a44af4 mousepad: move to gtk3
448f0fb2b mousepad: upgrade 0.4.1 -> 0.4.2
947bd5636 ristretto: upgrade 0.8.4 -> 0.10.0
12a676baa catfish: upgrade 1.4.7 -> 1.4.8
5aee7a3aa xfce4-datetime-plugin: upgrade 0.7.1 -> 0.8.0
135e90280 xfce4-places-plugin: 1.8.0 -> 1.8.1
458c3f7b0 xfce4-pulseaudio-plugin: upgrade 0.4.1 -> 0.4.2
6df6305b5 parole: upgrade 1.0.2 -> 1.0.4
d5bd1ff66 python-pymongo: upgrade 3.8.0 -> 3.9.0
080532ff8 nodejs: fix QA error about /usr/bin/python dependency
fed6a68f9 iotop: add runtime dependency on python-core
b386c9741 freeradius: add runtime dependency on perl
586181f2d scsirastools: add runtime dependency on bash
803dd59f7 libcec: add runtime dependency on python3-core
19dd354c2 dnf-plugin-tui: add runtime dependency on bash
1f6cbc0e8 edac-utils: add runtime dependency on perl
67ea219f2 lmsensors: add runtime dependency on bash
993f2d2f8 libdbi-perl: add runtime dependency on perl
51799d2ce scsirastools: add runtime dependency on bash II
b42bc4fea cli11: Remove dev pkg dep to main pkg
ef6c9011e mime-construct,libextutils-parsexs-perl: add runtime
dependency on perl
2e53c3c17 webmin: Add perl to rdeps for modules
884b3c2a6 hplip: Add python to rdeps
806fbbf81 klibc: Disable bcmp builtin for clang on glibc as well
495313115 python3-blivet: Add python3 to rdeps
38f6350de grubby: Add bash to rdeps
28f0b48c6 ufs-tool: Do not force static linking
e1f04e866 telepathy-glib: Update to version 0.24.1
1126e1e00 telepathy-glib: Enable vala bindings
2756e90e0 gnome-themes-standard: Update to version 3.28
509d40153 libgdata: Update to version 0.17.10.
b4670f030 sysdig: Upgrade to 0.26.1+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
53500ad qtdeclarative: Use qmlcachegen provided by OE instead of system one.
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
d0f2e64 chromium: Update to 76.0.3809.100
not included in master yet:
~/oe/world/yoe

