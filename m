Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 80D4E6B96C
	for <Openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 04:53:18 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id o6so26383257qtk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 20:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XEuQbf6crC1eei1TcF7kiP5J59rpW2aSmullsvQH0zw=;
	b=kAP9AE+TbijjdWeY8NeYR69SdPMTV8Ce43qauhtYg2Pz0oryuUE+JzTrzw3f82uakT
	/w5JpIcjNErcutJ2SCSHpmLMciJ1uiKg8/GkOKbb7SZtwRAPEh3Rqg7cdm6QuVNAkNFr
	yr2gPAMBtq9czJNJaklNS5e08q29Kd4lu0IS5k7MIUPy6uSjK1lUsEvFNMK0Gt69h3GJ
	yUboHd42bccuWsbXzvc+3r7Yrb62Dfl/unpgg84WXLmNXu3p8ZZuaGCHMCJLKic2JaHG
	h3jfpgYBqeyuMbaeG/rq6M7K3TNu+e8hmLxS3lFr4laCKKBGc83n63Fc0w/OLlKGElxz
	Aulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XEuQbf6crC1eei1TcF7kiP5J59rpW2aSmullsvQH0zw=;
	b=HSzCbiv61Dz0526kgfJ93EFqN46f4X4yMQcgz2wSCFHfCLcd71viQgzzArnrBXLRWu
	F2QT0bkhsuzQTIceZjJZZN0wTYb5VGuBNgxkvu1Yq6Z5i93O1DX+qQPdix9+ioNS5L7l
	675VEHt8J31GXeAnrn/Du84cGQu6LFUa8wP25iYPl8HZzwIKxUfZ7CP/seoKL5kmTL6k
	WfSlQpRlDKXKYp0tI6JcVbjltLBLU4U3u172P53066KIUAWyFB7W82py0FXZ60tnD7jk
	QN/dUN7pwzwM6otTsPNP3HWN1dz6cpYK6+xtBS2LC2jYF1EO8lHH5nMUY3Ldhg/7/Ajx
	ApTA==
X-Gm-Message-State: APjAAAWewOrvPK5pxVgalfTa9v72Pcu22y2pWvfGWPeBe/n0eY3wnkro
	0pwpFk6x2ffrudef4uy9kxwUbbHjcp9H65o9+3MOS4NM
X-Google-Smtp-Source: APXvYqyZhOFw/sHKmEXHYisIP6JHA0Tld/0+NdEUwHee1mlkii2mEW/XvyLDuhpiMrOiPIGVPSt1pPd5gC6yNxv3ApE=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr2409453qte.236.1551415998786; 
	Thu, 28 Feb 2019 20:53:18 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 20:52:52 -0800
Message-ID: <CAMKF1spw7Jg63EZzJU6v8rE+sNDCbQsy_-2DEZrU0nSXTgmMpA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2019-02-28
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
X-List-Received-Date: Fri, 01 Mar 2019 04:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-02-28 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190228_201635.log

=== common (1) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (9) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb:do_package
    * sources/meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.32.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (2) ===
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa

=== qemux86 (4) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.109.bb:do_compile
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_72.0.3626.109.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.32.0.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190227_102559.log/
||
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190227_214807.log/
||
|-
|| qemux86 || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190228_050138.log/
||
|-
|| qemux86_64 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190228_073424.log/
||
|}

=== PNBLACKLISTs (1) ===

=== QA issues (54) ===
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
||1 ||installed-vs-shipped
|-
||1 ||textrel
|-
||1 ||unknown-configure-option
|-
||2 ||host-user-contaminated
|-
||49 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190228_162309.log/


    * ERROR: Nothing RPROVIDES 'tearsofsteel-1080p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'tearsofsteel-1080p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'tearsofsteel-1080p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
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
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
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


count: 1 issue: textrel
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv5e-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 49 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.63 to 0:1.1-r2.61) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.63 to
0:1.1-r2.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.82 to
0:1.0-r0.81) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.82 to 0:1.0-r0.81)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.132 to 0:1.0-r8.131)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.132 to 0:1.0-r8.131)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.132 to 0:1.0-r8.131)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.132 to 0:1.0-r8.131)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.132 to 0:1.0-r8.131)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.132 to 0:1.0-r3.131)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.132 to 0:1.0-r3.131)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.132 to 0:1.0-r3.131)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.132 to 0:1.0-r3.131)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.132 to 0:1.0-r3.131) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.132 to 0:1.0-r13.131) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.132 to 0:1.0-r13.131) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.132 to 0:1.0-r13.131)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.132 to 0:1.0-r13.131) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.132 to 0:1.0-r13.131) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.132 to 0:1.0-r13.131) [version-going-backwards]


count: 2 issue: host-user-contaminated
glibc-locale-2.29: glibc-locale:
/glibc-binary-localedata-mk-mk/usr/lib/locale/mk_MK/LC_COLLATE is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.29: glibc-locale:
/glibc-binary-localedata-tr-tr.iso-8859-9/usr/lib/locale/tr_TR.ISO-8859-9/LC_COLLATE
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 1 issue: installed-vs-shipped
lvm2: 1 installed and not shipped files. [installed-vs-shipped]


count: 1 issue: unknown-configure-option
firewalld-0.6.3: firewalld: configure was passed unrecognised options:
--with-systemdsystemunitdir [unknown-configure-option]


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
fef56d28 bitbake: fix version comparison when one of the versions ends in .
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
71ba5ae005 local.conf.sample.extended: Use IMAGE_CLASSES to inherit extrausers
not included in master yet:
178ceacc1c qemu: split the native version into usermode and system parts
08c3f3e249 python3: depend on qemu-native, not qemu-helper-native
c84e93a242 local.conf.sample: adjust the qemu configuration to refer
to qemu-system-native
502bfc8180 default-distrovars: Drop DISTRO_FEATURES_LIBC
38950c123f xserver-xorg: upgrade 1.20.3 -> 1.20.4
bfa4aef106 util-linux: fix multilib qa issue
0712247153 openssl: drop Python 2.x dependency in -ptest
d1b3fe3ab0 gcc: Update to 8.3 latest on 8.x release
5c9adcf89b mesa-gl: Set PACKAGECONFIG for target
5f13cbe930 fixup
ea61d5a0b0 recipes: Add runit and related recipes
43e0e2a18a oeqa: Recognise svlogd as another logger
f6084f3345 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
706180c8ca musl: Fix out of bounds data ccess in dlopen
973c2d24b1 bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
9e689d6acb glibc: Disable Werror when building with debug options
14f66d9a65 glibc: Move common bits to glibc-common.inc

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
2b5beadcd gtkwave: add version 3.3.98
not included in master yet:
5f7876866 mscgen: add version 0.20
676a4c806 vim: use empty PACKAGECONFIG for vim-native
0ad153f72 octave: add version 4.4.1
fbc644835 libforms: add version 1.2.3
5cea5f245 plymouth: Update to version 0.9.4
6fc1a9383 lvm2: lvmdiskscan always print out "/dev/hdc: open failed:
No medium found".
e42cc4a8e dovecot:upgrade to 2.2.36
d06ded180 mozjs: Fix cross-builds of nsinstall
67f5877b5 xwd: Upgrade to 1.0.7
875cc5502 net-snmp: fix compile error with --disable-des
ee1b9e4dd pv: 1.5.3 -> 1.6.6
07a8af9a1 freeradius: update radiusd.service
68f8022c8 firewalld: add new recipe
c4ddc1441 lmsensors: read cpu information fail on ppc
4f386e7ab net-snmp: add PACKAGECONFIG disable-des
8f13cb131 krb5: add PACKAGECONFIG disable-pkinit
0e983a1c3 openhpi: add PACKAGECONFIG disable-snmpbc
2e5acb1e3 freeradius: add PACKAGECONFIGs
96b45b8ac spdlog: add first recipe
d59aca028 vim: remove xfce vim bbappend
5b521b811 lvm2/libdevmapper: 2.03.01 -> 2.03.02
b9f8a2d8c sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
fb71293 qtwebengine: drop
0002-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
8adc82c chromium: Update to 72.0.3626.119
not included in master yet:
6a85df0 chromium: Fix chromium build with musl again
~/oe/world/yoe

