Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0598A7CB4F
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 18:16:55 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id x1so13864497qkl.12
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 10:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=JPcT5YgPwsvEEoagxSo/s5jmRNzZKHrxacRivwtQb3Y=;
	b=LTl9KgLtFiGWq1xOweEcy58/rhR9PhcTdn9U+iwYQU0//a11C+gk+izb96xojdWMO9
	FuaB8Y97/Lmmcv778J2AAZKFKbw/Fo+GqYoyF5sitaS80Q8MFpha5Ep+2FAUaWNPzjAL
	weXI/P33DxFGtb/GIpaNwYtIV2W2LCtgtG9KWxKYZdLRng7gFseqwKJCZJcebCMlLw5I
	wTUXZi17PyG/rL8Q0KXyMRtIvFPzkhFRoVXn6bSSrv7cFr2iirqdIyfmmJEPSiqwPJCd
	kGoFIyo3j3q1pWAQvwgku7uJR9YshUBPvYTHq5HLL9o7XJcVRjYip8OJoXFVn3oE9KVh
	2H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=JPcT5YgPwsvEEoagxSo/s5jmRNzZKHrxacRivwtQb3Y=;
	b=M8cHvS5YBJrgtUE6WaQ6dL6ichXkzkc+BHY/lH1qe5TWT28ec9+hn5FSC6I0VNdHAt
	RmYmJXFXxwUVVSB9SKiw9p3RyzNkYgCqoWT2/QlAVyVT/WEhYkKEGzv4GKMF3AJIeZJP
	x3JzhT5CULaEHIbmzGJJMqnJHdzFRL1i2B/cmUi6akPpOY5UpZqnvCRH842UxSF78PSu
	vC4Y/qDs2mE4GmG9TdGLTAEIhA/NmO833eh7IOp52Q/GvEpGswZ0Ze8CEilpcoed0yIA
	MP7oMqGDDgBWs0tH8ZiOnPXKPQZwxsuZmdYfhx9ZWKffazKe6sDQwqdpI4ImbclNOYg0
	RZTg==
X-Gm-Message-State: APjAAAUuqeLtFQtEJLu+0bDcXZJAWa2P/x6XeLvELpDbPnQZw7o1x5Ak
	I7zgjlqTO6N1BGZekc2pwVmkxGqnqWEbmv2lCgRgADNraLc=
X-Google-Smtp-Source: APXvYqzLiEhFRgLkATNPCT/vhEp9M16mmjHbYT/0jifUo94mjEurNse4B/sQPr/B0bByn5WC2iWqditNwqDpRnweuXc=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr28924341qkf.337.1575915416197; 
	Mon, 09 Dec 2019 10:16:56 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Dec 2019 10:16:28 -0800
Message-ID: <CAMKF1sosZD5p3P=7=u6O_Oju3y0JCVq+btSFNg9FtQczSXHpGA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-12-08
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
X-List-Received-Date: Mon, 09 Dec 2019 18:16:56 -0000
Content-Type: text/plain; charset="UTF-8"

Attached is the latest build state for master (Dunfell)
release.
Looking into shared-state related fixes would be good to address as
reported in the below report

https://www.openembedded.org/wiki/Bitbake_World_Status_Dunfell

Thanks for your contributions

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2019-12-08 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.report.20191209_100240.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm.20191208_111555.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm64.20191208_194504.log/
||
|-
|| qemux86 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86.20191208_111525.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemux86-64.20191208_184054.log/
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
    * PNBLACKLIST[evolution-data-server] = "Qemu usermode hangs
forever on abaco/kwaj builders when doing g-ir-scanner-qemuwrapper"

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



=== Incorrect PACKAGE_ARCH or sstate signatures (2) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.signatures.20191209_023010.log/
    * ERROR: 2 issues were found in these recipes: go-native

    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log

    * ERROR: go-native different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1575887410/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: go-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1575887410/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 2 issues were found in these recipes: go-native


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

