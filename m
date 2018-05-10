Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DABB27525F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 15:55:45 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id w194-v6so4665031wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6lVpTk38OJY+tL6BGEWQMvIxX2CJnfqG2oeMMMCWSSc=;
	b=hgozv3RmDs+01rlbSGTT3wWS9yqXpM55cyXM3AChBOzkcr3MrlwKjrdx/0kv/nNGuo
	c7Y0qvUaGJx6mJtBgB3uca00c83P+7/ctoaPVkFJUDiaH/OWHRA7XAe5W/UurbcHl3iK
	c/JDCwoK5cXWfxt8vNn5jnAhfVvqAG/jKa+MhdCZRpYYL5DrX8niPtKWh94wjveaBOrK
	pu8JXv3xHoB3Oa1eBjRKgXMNJRaCzz0iNF8Tf/Qb86Yud7Rcp3T+c7ysAUdyIWfnNjgZ
	6zWFVfLEmKniTFD60EKCwNDbZdoRqgCqIJPPP2aIn6NTVOEGWhEBjM7vncChCRWLDZQ8
	c3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6lVpTk38OJY+tL6BGEWQMvIxX2CJnfqG2oeMMMCWSSc=;
	b=TetFbAfTyYgsNXtHCQO1h4n6kKgwIthcfWWw+IDMH8r+ggzH5JEO8jARhblm9r2OTB
	/H6BqIylSvVACScapXIRNkEiqycKNhqpZHBPa+BDsn/MOc4/NmVxHjyfVmB2aWn3Krx/
	Dn5iLO0CnYXs/Hj5SblWo/yGyB71lkhzNcWHdYI1IJoolQSqsP5FRwSByImIpymGHq8J
	8aUrBOKbKkTB1tDkbmQxRyXpG4fopCjVN5ZTGzJQiU6Uqbl+5/4g5FyRXvnfrqlSyETm
	4V+B31dggaDOyfDE8hMdtq8aNifme79SFtxuw05EktgGmvEz8ovfKgSk5wj4Ykuj12kT
	YLBw==
X-Gm-Message-State: ALKqPwdiOamiTIn86E6NOxB4lv3DDDGPH8CXaY+IJCrmTX1QEmXRNSaA
	3QvE0ZavpDlhLXtmd/QtG0KmpbkMgVvN38XhliGOyw==
X-Google-Smtp-Source: AB8JxZoWp9gAkLZDy69tIJFdkre+KyqoW3d1tkfWxAi1oivEjn9sN6UHXh+tpErrIzMa5uWhLzhuaIZM0G9OjEzeNcs=
X-Received: by 2002:a1c:4249:: with SMTP id
	p70-v6mr1637084wma.17.1525967745917; 
	Thu, 10 May 2018 08:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <07949a94-62c1-6ad2-3cc7-aca3fab033e9@gmail.com>
In-Reply-To: <07949a94-62c1-6ad2-3cc7-aca3fab033e9@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 May 2018 15:55:34 +0000
Message-ID: <CA+chaQcd0j16Z-AugmNdWSubCujd1iZj8QLvzo6jeZM2JVx3gw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, Failed tasks 2018-04-11
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
X-List-Received-Date: Thu, 10 May 2018 15:55:46 -0000
Content-Type: text/plain; charset="UTF-8"

This report seems to be missing on:
https://www.openembedded.org/wiki/Bitbake_World_Status_Sumo

On Fri, Apr 13, 2018 at 4:58 PM akuster808 <akuster808@gmail.com> wrote:

> == Failed tasks 2018-04-11 ==
>
> INFO: jenkins-job.sh-1.8.44 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180413_045117.log
>
> === common (4) ===
>     * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb:
> do_configure
>     *
> meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:
> do_packagedata
>     * openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.15.bb:
> do_compile
>
> === common-x86 (2) ===
>     *
> meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:
> do_compile
>     *
> meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:
> do_compile
>
> === qemuarm (6) ===
>     *
> meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:
> do_compile
>     *
> meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:
> do_configure
>     *
> meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
> do_compile
>     *
> meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:
> do_packagedata
>     * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:
> do_compile
>
> === qemuarm64 (8) ===
>     *
> meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:
> do_compile
>     *
> meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
> do_configure
>     *
> meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.8.0.bb:
> do_package_qa
>     *
> meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:
> do_compile
>     * openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:
> do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go_1.10.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:
> do_package_qa
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:
> do_compile
>
> === qemux86 (24) ===
>     *
> meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:
> do_compile
>     * meta-browser/recipes-browser/chromium/chromium-x11_65.0.3325.181.bb:
> do_compile
>     * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compile
>     *
> meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb:
> do_compile
>     *
> meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:
> do_package
>     *
> meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:
> do_compile
>     *
> meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:
> do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/
> netkit-rsh_0.17.bb:do_compile
>     *
> meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:
> do_compile
>     *
> meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:
> do_configure
>     * meta-openembedded/meta-networking/recipes-support/libtevent/
> libtevent_0.9.36.bb:do_configure
>     *
> meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:
> do_compile
>     *
> meta-openembedded/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:
> do_compile
>     *
> meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-support/nano/nano_2.9.3.bb:
> do_package
>     * meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:
> do_compile
>     *
> openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb:
> do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
> do_package_qa
>
> === qemux86_64 (1) ===
>     *
> meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb:
> do_compile
>
> === Number of failed tasks (71) ===
> {| class=wikitable
> |-
> || qemuarm      || 10    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20180410_045703.log/
> || http://errors.yoctoproject.org/Errors/Build/58129/
> |-
> || qemuarm64    || 17    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20180411_073754.log/
> || http://errors.yoctoproject.org/Errors/Build/58458/
> |-
> || qemux86      || 33    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20180410_045711.log/
> || http://errors.yoctoproject.org/Errors/Build/58128/
> |-
> || qemux86_64   || 11    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20180411_044958.log/
> || http://errors.yoctoproject.org/Errors/Build/58456/
> |}
>
> === PNBLACKLISTs (0) ===
>
> === QA issues (58) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||qa_pseudo
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||1     ||unknown-configure-option
> |-
> ||2     ||build-deps
> |-
> ||2     ||installed-vs-shipped
> |-
> ||48    ||version-going-backwards
> |-
> ||7     ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (186) ===
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20180412_143648.log/
>     * ERROR: 186 issues were found in these recipes: adwaita-icon-theme
> autoconf-archive ca-certificates cantarell-fonts docbook-xml-dtd4
> docbook-xsl-stylesheets encodings faenza-icon-theme
> firefox-addon-webconverger firefox-l10n-ach firefox-l10n-af firefox-l10n-an
> firefox-l10n-ar firefox-l10n-as firefox-l10n-ast firefox-l10n-az
> firefox-l10n-be firefox-l10n-bg firefox-l10n-bn-bd firefox-l10n-bn-in
> firefox-l10n-br firefox-l10n-bs firefox-l10n-ca firefox-l10n-cs
> firefox-l10n-cy firefox-l10n-da firefox-l10n-de firefox-l10n-dsb
> firefox-l10n-el firefox-l10n-en-gb firefox-l10n-en-us firefox-l10n-en-za
> firefox-l10n-eo firefox-l10n-es-ar firefox-l10n-es-cl firefox-l10n-es-es
> firefox-l10n-es-mx firefox-l10n-et firefox-l10n-eu firefox-l10n-fa
> firefox-l10n-ff firefox-l10n-fi firefox-l10n-fr firefox-l10n-fy-nl
> firefox-l10n-ga-ie firefox-l10n-gd firefox-l10n-gl firefox-l10n-gn
> firefox-l10n-gu-in firefox-l10n-he firefox-l10n-hi-in firefox-l10n-hr
> firefox-l10n-hsb firefox-l10n-hu firefox-l1
>  0n-hy-am firefox-l10n-id firefox-l10n-is firefox-l10n-it firefox-l10n-ja
> firefox-l10n-kk firefox-l10n-km firefox-l10n-kn firefox-l10n-ko
> firefox-l10n-lij firefox-l10n-lt firefox-l10n-lv firefox-l10n-mai
> firefox-l10n-mk firefox-l10n-ml firefox-l10n-mr firefox-l10n-ms
> firefox-l10n-nb-no firefox-l10n-nl firefox-l10n-nn-no firefox-l10n-or
> firefox-l10n-pa-in firefox-l10n-pl firefox-l10n-pt-br firefox-l10n-pt-pt
> firefox-l10n-rm firefox-l10n-ro firefox-l10n-ru firefox-l10n-si
> firefox-l10n-sk firefox-l10n-sl firefox-l10n-son firefox-l10n-sq
> firefox-l10n-sr firefox-l10n-sv-se firefox-l10n-ta firefox-l10n-te
> firefox-l10n-th firefox-l10n-tr firefox-l10n-uk firefox-l10n-uz
> firefox-l10n-vi firefox-l10n-xh firefox-l10n-zh-cn firefox-l10n-zh-tw
> font-alias gnome-common gtksourceview-classic-light hicolor-icon-theme
> icon-naming-utils initramfs-boot initramfs-debug initramfs-framework
> initramfs-module-setup-live iso-codes liberation-fonts linux-firmware
> mplayer-common openzone oprofile os-rel
>  ease packagegroup-core-buildessential packagegroup-core-clutter
> packagegroup-core-device-devel packagegroup-core-eclipse-debug
> packagegroup-core-full-cmdline packagegroup-core-nfs
> packagegroup-core-ssh-dropbear packagegroup-core-ssh-openssh
> packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
> packagegroup-core-x11 packagegroup-core-x11-base
> packagegroup-fonts-truetype packagegroup-go-sdk-target
> packagegroup-qt5-qtcreator-debug packagegroup-qt5-toolchain-target
> packagegroup-sdk-target packagegroup-self-hosted
> packagegroup-tools-bluetooth packagegroup-xfce-base
> packagegroup-xfce-extended packagegroup-xfce-multimedia phoronix-test-suite
> phpmyadmin poppler-data ppp-dialin pseudo-test pulseaudio-client-conf-sato
> qt5-demo-extrafiles resolvconf rodent-icon-theme run-postinsts
> shutdown-desktop source-han-sans-cn-fonts source-han-sans-jp-fonts
> source-han-sans-kr-fonts source-han-sans-tw-fonts terminus-font
> tesseract-lang ttf-abyssinica ttf-arphic-uming ttf-dejavu ttf
>  -droid ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation
> ttf-liberation-sans-narrow ttf-lklug ttf-lohit ttf-mplus ttf-pt-sans
> ttf-sazanami ttf-tlwg ttf-ubuntu-font-family ttf-vlgothic ttf-wqy-zenhei
> tzdata update-rc.d usbinit usb-modeswitch-data volatile-binds
> wayland-protocols weston-init xcursor-transparent-theme xfce-dusk-gtk3
> xorg-fonts-100dpi xorg-minimal-fonts xuser-account
>
>     * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
>     * ERROR: 1 errors found in
> signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: 1 errors found in
> signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: 183 errors found in
> signatures.qemuarm.do_package_write_ipk.sigdata.log
>
>     * ERROR: oprofile different signature for task do_configure.sigdata
> between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmpfs/sstate-diff/1523579808/signatures.qemux86.do_configure.sigdata.log
>     * ERROR: oprofile different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmpfs/sstate-diff/1523579808/signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: oprofile different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmpfs/sstate-diff/1523579808/signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: adwaita-icon-theme different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: autoconf-archive different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ca-certificates different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: cantarell-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: docbook-xml-dtd4 different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: docbook-xsl-stylesheets different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: encodings different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: faenza-icon-theme different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-addon-webconverger different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ach different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-af different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-an different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ar different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-as different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ast different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-az different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-be different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-bg different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-bn-bd different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-bn-in different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-br different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-bs different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ca different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-cs different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-cy different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-da different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-de different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-dsb different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-el different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-en-gb different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-en-us different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-en-za different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-eo different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-es-ar different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-es-cl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-es-es different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-es-mx different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-et different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-eu different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-fa different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ff different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-fi different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-fr different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-fy-nl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ga-ie different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-gd different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-gl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-gn different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-gu-in different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-he different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-hi-in different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-hr different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-hsb different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-hu different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-hy-am different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-id different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-is different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-it different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ja different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-kk different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-km different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-kn different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ko different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-lij different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-lt different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-lv different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-mai different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-mk different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ml different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-mr different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ms different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-nb-no different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-nl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-nn-no different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-or different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-pa-in different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-pl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-pt-br different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-pt-pt different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-rm different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ro different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ru different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-si different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-sk different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-sl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-son different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-sq different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-sr different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-sv-se different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-ta different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-te different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-th different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-tr different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-uk different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-uz different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-vi different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-xh different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-zh-cn different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: firefox-l10n-zh-tw different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: font-alias different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: gnome-common different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: gtksourceview-classic-light different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: hicolor-icon-theme different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: icon-naming-utils different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: initramfs-boot different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: initramfs-debug different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: initramfs-framework different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: initramfs-module-setup-live different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: iso-codes different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: liberation-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: linux-firmware different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: mplayer-common different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: openzone different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: os-release different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-buildessential different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-clutter different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-device-devel different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-eclipse-debug different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-full-cmdline different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-nfs different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-ssh-dropbear different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-ssh-openssh different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-standalone-sdk-target different signature
> for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-tools-debug different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-x11 different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-core-x11-base different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-fonts-truetype different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-go-sdk-target different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-qt5-qtcreator-debug different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-qt5-toolchain-target different signature for
> task do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-sdk-target different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-self-hosted different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-tools-bluetooth different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-xfce-base different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-xfce-extended different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: packagegroup-xfce-multimedia different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: phoronix-test-suite different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: phpmyadmin different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: poppler-data different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ppp-dialin different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: pseudo-test different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: pulseaudio-client-conf-sato different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: qt5-demo-extrafiles different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: resolvconf different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: rodent-icon-theme different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: run-postinsts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: shutdown-desktop different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: source-han-sans-cn-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: source-han-sans-jp-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: source-han-sans-kr-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: source-han-sans-tw-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: terminus-font different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: tesseract-lang different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-abyssinica different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-arphic-uming different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-dejavu different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-droid different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-gentium different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-hunkyfonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-inconsolata different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-liberation different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-liberation-sans-narrow different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-lklug different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-lohit different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-mplus different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-pt-sans different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-sazanami different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-tlwg different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-ubuntu-font-family different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-vlgothic different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: ttf-wqy-zenhei different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: tzdata different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: update-rc.d different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: usbinit different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: usb-modeswitch-data different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: volatile-binds different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: wayland-protocols different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: weston-init different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: xcursor-transparent-theme different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: xfce-dusk-gtk3 different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: xorg-fonts-100dpi different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: xorg-minimal-fonts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: xuser-account different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: 183 errors found in
> /home/jenkins/oe/world/shr-core/tmpfs/sstate-diff/1523579808/signatures.qemuarm.do_package_write_ipk.sigdata.log
>     * ERROR: 186 issues were found in these recipes: adwaita-icon-theme
> autoconf-archive ca-certificates cantarell-fonts docbook-xml-dtd4
> docbook-xsl-stylesheets encodings faenza-icon-theme
> firefox-addon-webconverger firefox-l10n-ach firefox-l10n-af firefox-l10n-an
> firefox-l10n-ar firefox-l10n-as firefox-l10n-ast firefox-l10n-az
> firefox-l10n-be firefox-l10n-bg firefox-l10n-bn-bd firefox-l10n-bn-in
> firefox-l10n-br firefox-l10n-bs firefox-l10n-ca firefox-l10n-cs
> firefox-l10n-cy firefox-l10n-da firefox-l10n-de firefox-l10n-dsb
> firefox-l10n-el firefox-l10n-en-gb firefox-l10n-en-us firefox-l10n-en-za
> firefox-l10n-eo firefox-l10n-es-ar firefox-l10n-es-cl firefox-l10n-es-es
> firefox-l10n-es-mx firefox-l10n-et firefox-l10n-eu firefox-l10n-fa
> firefox-l10n-ff firefox-l10n-fi firefox-l10n-fr firefox-l10n-fy-nl
> firefox-l10n-ga-ie firefox-l10n-gd firefox-l10n-gl firefox-l10n-gn
> firefox-l10n-gu-in firefox-l10n-he firefox-l10n-hi-in firefox-l10n-hr
> firefox-l10n-hsb firefox-l10n-hu firefox-l1
>  0n-hy-am firefox-l10n-id firefox-l10n-is firefox-l10n-it firefox-l10n-ja
> firefox-l10n-kk firefox-l10n-km firefox-l10n-kn firefox-l10n-ko
> firefox-l10n-lij firefox-l10n-lt firefox-l10n-lv firefox-l10n-mai
> firefox-l10n-mk firefox-l10n-ml firefox-l10n-mr firefox-l10n-ms
> firefox-l10n-nb-no firefox-l10n-nl firefox-l10n-nn-no firefox-l10n-or
> firefox-l10n-pa-in firefox-l10n-pl firefox-l10n-pt-br firefox-l10n-pt-pt
> firefox-l10n-rm firefox-l10n-ro firefox-l10n-ru firefox-l10n-si
> firefox-l10n-sk firefox-l10n-sl firefox-l10n-son firefox-l10n-sq
> firefox-l10n-sr firefox-l10n-sv-se firefox-l10n-ta firefox-l10n-te
> firefox-l10n-th firefox-l10n-tr firefox-l10n-uk firefox-l10n-uz
> firefox-l10n-vi firefox-l10n-xh firefox-l10n-zh-cn firefox-l10n-zh-tw
> font-alias gnome-common gtksourceview-classic-light hicolor-icon-theme
> icon-naming-utils initramfs-boot initramfs-debug initramfs-framework
> initramfs-module-setup-live iso-codes liberation-fonts linux-firmware
> mplayer-common openzone oprofile os-rel
>  ease packagegroup-core-buildessential packagegroup-core-clutter
> packagegroup-core-device-devel packagegroup-core-eclipse-debug
> packagegroup-core-full-cmdline packagegroup-core-nfs
> packagegroup-core-ssh-dropbear packagegroup-core-ssh-openssh
> packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
> packagegroup-core-x11 packagegroup-core-x11-base
> packagegroup-fonts-truetype packagegroup-go-sdk-target
> packagegroup-qt5-qtcreator-debug packagegroup-qt5-toolchain-target
> packagegroup-sdk-target packagegroup-self-hosted
> packagegroup-tools-bluetooth packagegroup-xfce-base
> packagegroup-xfce-extended packagegroup-xfce-multimedia phoronix-test-suite
> phpmyadmin poppler-data ppp-dialin pseudo-test pulseaudio-client-conf-sato
> qt5-demo-extrafiles resolvconf rodent-icon-theme run-postinsts
> shutdown-desktop source-han-sans-cn-fonts source-han-sans-jp-fonts
> source-han-sans-kr-fonts source-han-sans-tw-fonts terminus-font
> tesseract-lang ttf-abyssinica ttf-arphic-uming ttf-dejavu ttf
>  -droid ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation
> ttf-liberation-sans-narrow ttf-lklug ttf-lohit ttf-mplus ttf-pt-sans
> ttf-sazanami ttf-tlwg ttf-ubuntu-font-family ttf-vlgothic ttf-wqy-zenhei
> tzdata update-rc.d usbinit usb-modeswitch-data volatile-binds
> wayland-protocols weston-init xcursor-transparent-theme xfce-dusk-gtk3
> xorg-fonts-100dpi xorg-minimal-fonts xuser-account
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-qt5:
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 7        issue: textrel
> ELF binary
> '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/
> github.com/Masterminds/glide/action/action.test' has relocations in .text
> [textrel]
> ELF binary
> '/work/aarch64-oe-linux/go/1.10.1-r0/packages-split/go/usr/lib/go/bin/go'
> has relocations in .text [textrel]
> glide-0.13.1: ELF binary
> '/work/i586-oe-linux-musl/glide/0.13.1-r0/packages-split/glide/usr/bin/glide'
> has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary
> '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/
> github.com/golang/dep/cmd/dep/dep.test' has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary
> '/work/i586-oe-linux-musl/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep'
> has relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
> '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
> has relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
> '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
> has relocations in .text [textrel]
>
>
> count: 2        issue: build-deps
> mbedtls-2.8.0: mbedtls-programs rdepends on hiawatha, but it isn't a build
> dependency, missing hiawatha in DEPENDS or PACKAGECONFIG? [build-deps]
> mbedtls-2.8.0: mbedtls rdepends on hiawatha, but it isn't a build
> dependency, missing hiawatha in DEPENDS or PACKAGECONFIG? [build-deps]
>
>
> count: 0        issue: file-rdeps
>
>
> count: 48       issue: version-going-backwards
> ell-0.4: Package version for package ell-dbg went backwards which would
> break package feeds from (0:git-r0.16 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dbg went backwards which would
> break package feeds from (0:git-r0.19 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dbg went backwards which would
> break package feeds from (0:git-r0.21 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dbg went backwards which would
> break package feeds from (0:git-r0.38 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dev went backwards which would
> break package feeds from (0:git-r0.16 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dev went backwards which would
> break package feeds from (0:git-r0.19 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dev went backwards which would
> break package feeds from (0:git-r0.21 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-dev went backwards which would
> break package feeds from (0:git-r0.38 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-doc went backwards which would
> break package feeds from (0:git-r0.16 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-doc went backwards which would
> break package feeds from (0:git-r0.19 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-doc went backwards which would
> break package feeds from (0:git-r0.21 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-doc went backwards which would
> break package feeds from (0:git-r0.38 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-locale went backwards which would
> break package feeds from (0:git-r0.16 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-locale went backwards which would
> break package feeds from (0:git-r0.19 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-locale went backwards which would
> break package feeds from (0:git-r0.21 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-locale went backwards which would
> break package feeds from (0:git-r0.38 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-staticdev went backwards which
> would break package feeds from (0:git-r0.16 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-staticdev went backwards which
> would break package feeds from (0:git-r0.19 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-staticdev went backwards which
> would break package feeds from (0:git-r0.21 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell-staticdev went backwards which
> would break package feeds from (0:git-r0.38 to 0:0.4-r0.0)
> [version-going-backwards]
> ell-0.4: Package version for package ell went backwards which would break
> package feeds from (0:git-r0.16 to 0:0.4-r0.0) [version-going-backwards]
> ell-0.4: Package version for package ell went backwards which would break
> package feeds from (0:git-r0.19 to 0:0.4-r0.0) [version-going-backwards]
> ell-0.4: Package version for package ell went backwards which would break
> package feeds from (0:git-r0.21 to 0:0.4-r0.0) [version-going-backwards]
> ell-0.4: Package version for package ell went backwards which would break
> package feeds from (0:git-r0.38 to 0:0.4-r0.0) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-dbg went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-dev went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-doc went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-cs went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-da went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-de went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-eo went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-fr went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-hu went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-it went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-ja went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-nl went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-pl went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-pt went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-ro went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-ru went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-sr went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-sv went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-uk went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-vi went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-zh-cn
> went backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-locale-zh-tw
> went backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error-staticdev went
> backwards which would break package feeds from (0:1.28-r0.0 to
> 0:1.27-r0.19) [version-going-backwards]
> libgpg-error-1.27: Package version for package libgpg-error went backwards
> which would break package feeds from (0:1.28-r0.0 to 0:1.27-r0.19)
> [version-going-backwards]
>
>
> count: 0        issue: host-user-contaminated
>
>
> count: 2        issue: installed-vs-shipped
> nano: 2 installed and not shipped files. [installed-vs-shipped]
> rdist: 1 installed and not shipped files. [installed-vs-shipped]
>
>
> count: 1        issue: unknown-configure-option
> gstd-1.0: gstd: configure was passed unrecognised options:
> --disable-gtk-doc [unknown-configure-option]
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
> count: 0        issue: qa_pseudo
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> cca81e3 cookerdata: Issue warning if layer doesn't set LAYERSERIES_COMPAT_x
> not included in master yet:
> c1f74de world-image: add extra target
> 403e318 fetch2: Allow Fetch.download() to warn instead of error
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> c1573cb nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
> not included in master yet:
> 5c51cad insane.bbclass: Add do_qa_pseudo function to check for common
> errors listed in pseudo.log
> a7b4d34 kernel-devicetree.bbclass: Use lowercase names for shell variables
> c1095f1 kernel-devicetree.bbclass: Fix and simplify instalation of DTB
> files
> 4ff1c51 kernel.bbclass: use the consistent naming schema for initramfs
> 0bd14c7 kernel.bbclass: move variables for kernel artifacts names to
> separate bbclass
> ad302ba report-error: Allow to upload reports automatically
> 2768613 sstate.bbclass: Do not cause build failures due to setscene errors
> 2fac6c8 license.bbclass: be a bit more strict when searching
> ${PN}-${LICENSE_PACKAGE_SUFFIX} in packages
> 1b94fcf lzip: upgrade 1.19 -> 1.20
> 8d42aac hdparm: upgrade 9.53 -> 9.55
> adfaba9 lz4: upgrade 1.7.4 -> 1.8.1.2
> b1421b6 ncureses: 6.0+20171125 -> 6.1
> f56cda5 bash: 4.4.12 -> 4.4.18
> e19a245 gnupg: upgrade 2.2.4 -> 2.2.5
> 0a01d9e man-db: upgrade 2.8.1 -> 2.8.2
> 6f968bb ghostscript: 9.21 -> 9.23
> 14cbff5 dhcp: 4.3.6 -> 4.4.1
> 0e3ad1f libxml2: 2.9.7 -> 2.9.8
> 956cf2c less: update to 530
> f8d7b3f libcap-ng: update to 0.7.9
> 16537ee libxml-simple-perl: upgrade 2.24 -> 2.25
> 75afded python3-pip: update to version 9.0.3
> 53cdf8c python*-setuptools: update to 39.0.1
> f9b2a62 libpcre2: update to 10.31
> fa98073 xprop: update to 1.2.3
> 90c4384 xkeypboard-config: update to 2.23.1
> 16a0086 xkbcomp: update to 1.4.1
> 1799c3d xinit: update to 1.4.0
> 6a281a6 xwininfo: update to 1.1.4
> 5db0f35 gnutls: update to 3.6.2
> d733e2b xeyes: update to 1.1.2
> abf8e50 xset: update to 1.2.4
> 00b8d94 xcb-proto: update to 1.13
> 49a15a6 curl: update to 7.59.0
> 685659e mkfontscale: update to 1.1.3
> 7da9d01 util-macros: update to 1.19.2
> 9ef70ed libxcb: update to 1.13
> 5883e98 xf86-video-vesa: update 2.4.0 update
> 967e7ee iproute2: update 4.14.1 -> 4.15.0
> c7d1ed2 ethtool: update 4.13 -> 4.15
> 7a3b21a libpcre: 8.41 -> 8.42
> 5db1af1 libshmfence: update to 1.3
> 7005656 autoconf-archive: update to version to 2018.03.13
> ea5adb6 logrotate: update to 3.14.0
> 8c94627 libxml-sax-perl: upgrade 0.99 -> 1.00
> d3abc7b buildhistory.bbclass: metadata-revs show repo parent
> 8e1737c metadata-revs: provide more information
> b12898b qemux86: Add identical qemux86copy variant for tests
> e426c05 pseudo-text: add dummy recipe to reproduce YOCTO #12434
> 82fe8c0 gio-module-cache.bbclass: disable update_gio_module_cache postinst
> script for nativesdk
> 4f3c59f libxcrypt: add -std=gnu99 to BUILD_CPPFLAGS
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 4489cac obexftp: use makefile instead of ninja cmake generator
> not included in master yet:
> 7990f4b miniupnpd: update to 2.0.20180203 and add systemd service
> d722da9 grpc: move it from oe to networking layer
> e454d6a mosquito: move from oe to networking layer
> 19d3f94 networkmanager upgrade to 1.10.6
> 050f6e1 ipcalc: add initial recipe for version 0.2.2
> 5c5271b tcpdump: refresh patches
> 6412c58 freediameter: add dependency on virtual/kernel and use MACHINE_ARCH
> 95801e7 ntp: refresh patch
> 574d53e fwknop: Use new config.guess and config.sub
> a075f90 postfix: remove host references from makedefs.out
> 8d05dac ndisc6: gold does not work for risc-v here
> 2268ebb waf-cross-answers: Add cross-answers-riscv64.txt
> d99b986 quagga: 1.2.2 -> 1.2.4
> a0bcf67 strongswan: 5.5.3 -> 5.6.2
> e83e3f5 samba: update to 4.7.6
> cdf72c3 networkmanager: fix gobject-introspection/musl and cleanup
> 9ccf832 kea: add new recipe
> 5055482 crda: refresh patch
> abd54bf networkmanager: Fix many typos in DISTRO_FEATURES PACKAGECONFIG
> decodes
> 4266eb8 wpan-tools: Add recipe
> 85a69d6 yp-tools: Upgrade to 4.2.3
> 70a4edc lowpan-tools: Switch to using github src_uri and fix build with
> gcc8
> 23dd7d6 dbus-broker: Add recipe
> a260338 rarpd, sblim-sfcb, openct: inherit systemd unconditionally
> 06f92a3 poppler: Rework patch fixing do_configure
> 6db6dca wireshark: update to 2.4.6 and add upstream check
> 81dee48 mbedtls: upgrade to 2.8.0
> b83fc31 crda: fix typo in patch metadata
> 3dd1802 meta-*: add LAYERSERIES_COMPAT to layer.conf files
> fdf3d16 python-pybluez: add python3 version
> d0089cf ell: upgrade to version 0.4
> 16a6560 udisks: refresh patches
> 30b6e66 smstools3: refresh patches
> 4dbbe30 stress-ng: refresh patches
> ba9baf8 libvpx: refresh patches
> e9f9ffc vsftpd: refresh patches
> 48c29bf concurrencykit: patch refresh
> 1ebba6d uim: refresh patches
> f3e2afc obexd: refreah patches
> b76b083 pyton-dbusmuck: refresh patches
> bbb76e7 vlock: refresh patches
> b90e9c2e ctdb: refresh patches
> f5b840a xserver-common: refresh patches
> f00e319 squid: refresh patches
> 90a68bb rp-pppoe: refresh patches
> 7edccda strongswan: refresh patches
> 107d9ed autofs: refresh patches
> a0f7a89 snort: refresh patches
> 977b9fd esound: refresh patches
> 81d8ea4 pyton-pygpme: refresh patches
> 704dffb t1lib: refresh patches
> 9d6458a v4l-utils: refresh patches
> 177cd29 python-autmat: refresh patches
> ea8a5b9 apache2: refresh patches
> 4042692 syslog-ng: refresh patches
> 19135b4 hddtemp: refresh patches
> 3b0c799 webmin: refresh patches
> 1ce3d44 nginx: refresh patches
> 851a12c postgresql: refresh patches
> c2473e7 libnetfilter-cthelper: refresh patches
> f66d270 anthy: refresh patches
> aacd73a python-grpcio: refresh patches
> 800d529 net-snmp: refresh patches
> 5d4c320 openipmi: refresh patches
> 4a70759 libdivecomputer: refresh patches
> b91a9b6 openhpi: refresh patches
> be15c17 libdbus-c++: Refresh patches v2
> ffdeb97 mongodb: refresh patches and remove un-needed patch
> ede79a0 postgresql: update to 9.4.17
> 9c7fc33 update layer maintainers
> 2cf4f7c libsrtp: allow creation of empty package
> 68f6c19 poppler: update 0.62.0- > 0.63.0
> 9a98bb1 poppler: fix build for TARGET_FPU = "soft"
> 0f2272c samba: refresh patches
> a716b07 polkit-gnome: remove
> d81a4f5 xfce4-terminal: update 0.8.7.2 -> 0.8.7.3
> d5af5d8 xfce4-whiskermenu-plugin: update 2.1.5 -> 2.1.6
> f511c68 thunar: update 1.6.14 -> 1.6.15
> a89f292 dbus-broker: include only if systemd is DISTO_FEATURE
> ea9a606 imsettings: only include when x11 in DISTRO_FEATURES
> 959f684 xfce4-vala: only include when x11 in DISTRO_FEATURES
> 9fb7a61 xarchiver: only include when x11 in DISTRO_FEATURES
> 57834c2 gnome-system-monitor: only include when x11 in DISTRO_FEATURES
> 92fdc2e packagegroup-xfce-extended: only include when x11 in
> DISTRO_FEATURES
> 9fbc0ac menulibre: only include when x11 in DISTRO_FEATURES
> d92d097 python-blivet: only include when x11 in DISTRO_FEATURES
> 0a62cfe usermode: also only include when x11 in DISTRO_FEATURES
> a86532b libreport: add PACKCONFIG for gtk
> eb29f26 xdebug: update to 2.6.0
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 9ed1897 qt5-git.inc: drop nobranch=1
> not included in master yet:
> ba63f49 qtbase: Add packageconfigs for renameat2 and getentropy use
> f788429 qtbase: don't enable renameat2 by default
> 077fabc qt5: upgrade to 5.11 Alpha
> 3abe6a6 qt5-creator: upgrade to 4.5.1
> 797415d packagegroup-qt5-toolchain-target: drop both qtwebkit packages
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> d1c9024 Merge pull request #106 from rakuco/drop-musl-patches-chromium
> not included in master yet:
> 0e4b5f0 layer.conf: add LAYERSERIES_COMPAT
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

