Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39F7E61BB5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:41:21 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id f17so1610724qtq.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=QsPpvL9873HQdCXV/o26YNb9Cr4/4VWhPaULNIxSCyk=;
	b=czEKgVoGvuCuFdaaSIQqL73rSgt4dG7hCviW+K1hQVD7v5bmsikF+S8BFp6m0JmZv4
	1y0TUUNwhRWJ5euzUSHVkvaAOfxgcME0uuo3lDizQi9TsFXLah2ieNc6AVwYcD2MQse2
	sKYFIlWZuVVyDkysCFyymoe0G4AAVTBl2FR44xRbYRcqqv6IWNFr55LWoGTGkr8LprN6
	egxYjIOzCoTuaL21yWaldU/RAW8wvcsJh6C1o7NpBmq8+H7/WhFfObp9vw5rXUsFJT4k
	Iooj6E5Tzxu1BaNgwWqNjyKM4lmX90WengWMTCMt4qCiY8FbKKLDIsc9+QHQuRWp1yQz
	VNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QsPpvL9873HQdCXV/o26YNb9Cr4/4VWhPaULNIxSCyk=;
	b=dfrajvUPvq6JcM49ss8tJsEQtspdfSgtBdxUqAAiYR1YhOW2yMAQClhgnXEXKkCWPA
	KxcdXrp0Hcj/y4unzfby1TeR2OHrFre4gTGHZ29Pte3YlaiuUOGnhGRlyI+w2ycQUfbS
	re0CTtMTcu4ihME1g8N2EvAvznYjOm/E0wlkvN+Y3iudCU1jq5AVPAFrQD4yV7jdS4Sz
	uxaL10aDBlxXYrk752Foc5gg0S3CbQVk6cuKSKNrU3eC+rgqId7ByqulDz2DyP8Y1Hve
	+bBZwzHxqOUZP8fj12sZWpI0G7xka+f9/jFPxXJapWuCQZBEx9Jud2LpKBESt75jKLE6
	WXcQ==
X-Gm-Message-State: ANhLgQ23n0mkFy7bmAjIEABGQyBNjp7NVEt5gYCdxlI1hYpaorPrjX6q
	gVB4Nh+arQf6AT8DWNra/rkGQ+bF0xCZdIwwacR7wNGEOIs=
X-Google-Smtp-Source: ADFU+vtvG/fhBhcRTUwYWkH2zBlv6BwEVh7Vg/AaYdl+GOR9Kij3OCFjAiuf6miRrj2jvYX5JIvxNxSGhYyojduP1NQ=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr4722753qte.293.1583966481280; 
	Wed, 11 Mar 2020 15:41:21 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Mar 2020 15:40:55 -0700
Message-ID: <CAMKF1spbcLr-ZA8KrObx3OAhv0A7gJ2Dk+Zkj0FZzbMr7C_Maw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world - 2020-03-09
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
X-List-Received-Date: Wed, 11 Mar 2020 22:41:21 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2020-03-09 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
/media/ra_build_share/buildlogs/oe/world/dunfell/log.report.20200310_140304.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemuarm64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (1) ===
{| class=wikitable
|-
|| qemuarm || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm.20200309_132038.log/
||
|-
|| qemuarm64 || 1 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm64.20200309_202041.log/
|| http://errors.yoctoproject.org/Errors/Build/99898/
|-
|| qemux86 || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86.20200309_202040.log/
||
|-
|| qemux86_64 || 0 ||
/media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86-64.20200309_202038.log/
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

Complete log: /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.signatures.20200309_212117.log/

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

