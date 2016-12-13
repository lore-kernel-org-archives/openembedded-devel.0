Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 647146E688
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 03:58:05 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d2so16188998pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 19:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/x9HGSGncH03twMjWM75LKHzLrhD9G25NDvebhRmEjg=;
	b=CG6B+ksIgnND6PGLPPzoLWGomTnQzpqxqtqBVk/KWSqHi0q1OVMtcG+CJdzGrhUNyH
	0+CY+hgqHz4InTyWgiIgPucqsZ5VjesZhTaofrfSNhztld8uCJZIHiC2bC8+XquCSSQ/
	MnF78/ff6NttO+VEwMAwvImSqCii7N0RMixOy/0pNUw8iLFBkumOWvH9o8jgJTOgr6uL
	+GdnZBRdC2frwRpa88qTWAEjcNEn6U5bBpgBufjr2AXHGsQgNo6KFksy01XyT7m3OuUn
	21B5x2trZNI5TNeuAhcTjeSfX6xs3fUhgUJUnyfsEPzZb9d7ym+0fHqlKwf99w/gbWbp
	vuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/x9HGSGncH03twMjWM75LKHzLrhD9G25NDvebhRmEjg=;
	b=Uam9GtIbsNEWQwdUMFCGlXXmKyQA5rFKxVeHwsk6rEr0iC0zGd7U+0z4bAAXzYYnQy
	pDEthNHuE+Zj6IdnnclNxkP8Z8zjQFRWSQPb8MNqY8YFoGwzJlgx7fyow9z1oPDoa4De
	dIlmqOgdOxMwRgiMcCH7Qu6aT/8REN2B3fUV/vusHgYGczoDrJ4NVJlpJE45ZUHRxswP
	fMnvrPz8+ZeII+Fo/5e5obkA3g+5AuzUlExik1BrNT8YbaDvr1wtW4iq5tM0Fnq6k/tG
	/HSrWiUIHArL25+0brKA2BfFMWYRcJh3BEC1pGVQUP9Q3rSdZJDoq68/TmcCM8+T52Cb
	cN+w==
X-Gm-Message-State: AKaTC03iR2ja6tu+P1K9+5zTvn9fK36D/kHoi48KPOsTg7/xoBVD8e2KVbytO0eQm5I5Nw==
X-Received: by 10.98.16.7 with SMTP id y7mr98503582pfi.55.1481601487470;
	Mon, 12 Dec 2016 19:58:07 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	y15sm78871880pgc.43.2016.12.12.19.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 19:58:07 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <cover.1480784866.git.akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ef4670c8-1c68-0ac5-64a0-ae3532d33017@gmail.com>
Date: Mon, 12 Dec 2016 19:58:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1480784866.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/69] meta-oe pull request v3 morty
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
X-List-Received-Date: Tue, 13 Dec 2016 03:58:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ping.


On 12/03/2016 09:09 AM, Armin Kuster wrote:
> Sending cover letter only.
>
> Please consider this for Morty.

Can I get this merged to "Morty" ?

- armin

>
> V2]
> removed two commits not needed.
>
> v3]
> Added to additional patches per request.
>
> The following changes since commit 659d9d3f52bad33d7aa1c63e25681d193416d76e:
>
>    meta-openembedded: Add me to morty maintainer's list (2016-11-15 15:14:32 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next
>
> Andreas Müller (2):
>    Revert "physfs: move to sources found at github/supertux"
>    exo: unbreak Thunar's detailed file view
>
> André Draszik (2):
>    asio: DEPENDS on openssl
>    asio: fix a musl compilation warning
>
> Armin Kuster (1):
>    wireshark: install missing header files
>
> Hongxu Jia (1):
>    ttf-abyssinica: update SRC_URI
>
> Jackie Huang (28):
>    openjpeg: rename the download file
>    gtkmm: add x11 to REQUIRED_DISTRO_FEATURES
>    pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
>    libunique: add x11 to REQUIRED_DISTRO_FEATURES
>    dconf: add x11 to REQUIRED_DISTRO_FEATURES
>    evince: add x11 to REQUIRED_DISTRO_FEATURES
>    gnome-disk-utility: add x11 to REQUIRED_DISTRO_FEATURES
>    gtksourceview2: add x11 to REQUIRED_DISTRO_FEATURES
>    libwnck: add x11 to REQUIRED_DISTRO_FEATURES
>    libxklavier: add x11 to REQUIRED_DISTRO_FEATURES
>    packagegroup-xfce-base: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-pulseaudio-plugin: add x11 to REQUIRED_DISTRO_FEATURES
>    thunar-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce-panel-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce-app.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>    exo: add x11 to REQUIRED_DISTRO_FEATURES
>    garcon: add x11 to REQUIRED_DISTRO_FEATURES
>    gtk-xfce-engine: add x11 to REQUIRED_DISTRO_FEATURES
>    libxfce4ui: add x11 to REQUIRED_DISTRO_FEATURES
>    thunar: add x11 to REQUIRED_DISTRO_FEATURES
>    thunar-volman: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-appfinder: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-panel: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-power-manager: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-session: add x11 to REQUIRED_DISTRO_FEATURES
>    xfce4-settings: add x11 to REQUIRED_DISTRO_FEATURES
>    xfdesktop: add x11 to REQUIRED_DISTRO_FEATURES
>    xfwm4: add x11 to REQUIRED_DISTRO_FEATURES
>
> Junxian.Xiao (1):
>    apache2: include .load files in modules.d
>
> Kai Kang (1):
>    python-m2crypto: inherit siteinfo
>
> Khem Raj (12):
>    meta_oe_security_flags: Disable PIE for
>      s3c64xx-gpio/s3c24xx-gpio/cpufrequtils
>    meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
>    krb5: Add -fPIC to compile flags
>    libplist: Remove rpaths surgically
>    lockdev: Pretend GNU libc on musl
>    libqmi: Fix build with clang
>    openldap: Fix Build error due to missing -fPIC
>    md5deep: Fix build with clang
>    flashrom: Remove redundant const qualifier
>    fribidi: Fix build with security flags turned on
>    libmad: Fix build with clang
>    modemmanager: Fix build with clang
>
> Koen Kooi (1):
>    android-tools: fix do_install
>
> Nicolas Dechesne (1):
>    gpsd: fix multilib build
>
> Philip Balister (1):
>    fftw: Remove the fftw-dev package dependency on non-existent fftw
>      package.
>
> Qi.Chen@windriver.com (2):
>    iscsi-initiator-utils: fix postinstall and systemd service file
>    edac-utils: fix systemd service
>
> Robert Yang (1):
>    lftp: fix PACKAGECONFIG[readline]
>
> Tim Orling (1):
>    mariadb: use faster download URL
>
> Ting Liu (1):
>    xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on
>      ppc64
>
> Wang Xin (2):
>    lksctp-tools: 1.0.16 -> 1.0.17
>    drbd-utils: 8.9.3 -> 8.9.6
>
> Wenzong Fan (4):
>    opencv: fix QA issue
>    libeigen: set tarball name as ${BP}.tar.bz2
>    opencv: checking existence of /usr/lib
>    rsnapshot: fix host path in rsnapshot.conf.default
>
> Yi Zhao (6):
>    aoetools: fix QA warning for GNU_HASH
>    nuttcp: fix QA warning for GNU_HASH
>    zeroconf: fix QA warning for GNU_HASH
>    tsocks: fix QA warning for GNU_HASH
>    vblade: fix QA warning for GNU_HASH
>    tunctl: fix QA warning for GNU_HASH
>
> dengke.du@windriver.com (1):
>    augeas: fix QA warning
>
>   .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 --------------
>   .../recipes-support/physfs/physfs_2.0.3.bb         | 13 ++++
>   .../recipes-support/physfs/physfs_git.bb           | 15 ----
>   meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb     |  4 +-
>   meta-gnome/recipes-gnome/evince/evince_3.18.2.bb   |  4 +-
>   .../gnome-disk-utility_2.32.0.bb                   |  5 +-
>   .../gtksourceview/gtksourceview2_2.10.5.bb         |  4 +-
>   meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |  4 +-
>   .../recipes-gnome/libxklavier/libxklavier_5.3.bb   |  3 +
>   .../recipes-connectivity/lftp/lftp_4.7.3.bb        |  2 +-
>   .../files/iscsi-initiator.service                  |  1 +
>   .../iscsi-initiator-utils/files/set_initiatorname  | 12 ++++
>   .../iscsi-initiator-utils_2.0-873.bb               | 27 +++----
>   .../vblade/files/makefile-add-ldflags.patch        | 19 +++++
>   .../recipes-daemons/vblade/vblade_20.bb            |  4 +-
>   .../tsocks/tsocks/makefile-add-ldflags.patch       | 19 +++++
>   .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |  4 +-
>   .../zeroconf/zeroconf/makefile-add-ldflags.patch   | 19 +++++
>   .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |  1 +
>   .../aoetools/aoetools/makefile-add-ldflags.patch   | 31 ++++++++
>   .../recipes-support/aoetools/aoetools_36.bb        |  1 +
>   .../{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb}   |  6 +-
>   ...sctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb} |  4 +-
>   .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |  2 +-
>   meta-networking/recipes-support/tunctl/tunctl.inc  |  4 +-
>   .../tunctl/tunctl/makefile-add-ldflags.patch       | 19 +++++
>   .../recipes-support/wireshark/wireshark_2.2.1.bb   | 31 ++++++--
>   .../conf/distro/include/meta_oe_security_flags.inc |  6 ++
>   meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb   |  4 +-
>   .../libqmi/libqmi/0001-Detect-clang.patch          | 84 ++++++++++++++++++++++
>   .../recipes-connectivity/libqmi/libqmi_1.16.0.bb   |  4 +-
>   .../modemmanager/enum-conversion.patch             | 21 ++++++
>   ...modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} |  8 ++-
>   .../android-tools/android-tools_5.1.1.r37.bb       | 24 ++++---
>   .../recipes-devtools/libfribidi/fribidi_0.19.7.bb  |  1 +
>   .../0001-ichspi.c-Fix-build-with-clang.patch       | 29 ++++++++
>   .../recipes-extended/flashrom/flashrom_0.9.6.1.bb  |  1 +
>   .../libimobiledevice/libplist_1.8.bb               | 10 ++-
>   .../files/0001-Fix-errors-found-by-clang.patch     | 32 +++++++++
>   meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    |  1 +
>   meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb         |  4 +-
>   meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |  4 +-
>   .../recipes-graphics/openjpeg/openjpeg_2.1.1.bb    |  2 +-
>   .../ttf-fonts/ttf-abyssinica_1.500.bb              |  2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm_325.bb     |  2 +-
>   ...4-Remove-clang-unsupported-compiler-flags.patch | 43 +++++++++++
>   .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |  1 +
>   .../pulseaudio/pavucontrol_3.0.bb                  |  4 +-
>   meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
>   meta-oe/recipes-support/asio/asio.inc              |  2 +-
>   ...01-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 64 +++++++++++++++++
>   meta-oe/recipes-support/asio/asio_1.10.6.bb        |  5 +-
>   meta-oe/recipes-support/augeas/augeas.inc          |  3 +
>   .../recipes-support/edac-utils/edac-utils_git.bb   |  1 +
>   .../recipes-support/edac-utils/files/edac.service  |  1 -
>   meta-oe/recipes-support/fftw/fftw_3.3.4.bb         |  2 +
>   meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb |  2 +-
>   meta-oe/recipes-support/lockdev/lockdev_git.bb     |  2 +
>   meta-oe/recipes-support/mysql/mariadb.inc          |  2 +-
>   meta-oe/recipes-support/opencv/opencv_3.1.bb       |  4 +-
>   .../recipes-support/openldap/openldap_2.4.44.bb    |  2 +-
>   meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |  2 +
>   .../python/python-m2crypto_0.23.0.bb               |  2 +-
>   .../recipes-httpd/apache2/apache2_2.4.23.bb        |  1 +
>   meta-xfce/classes/thunar-plugin.bbclass            |  4 +-
>   meta-xfce/classes/xfce-app.bbclass                 |  4 +-
>   meta-xfce/classes/xfce-panel-plugin.bbclass        |  4 +-
>   .../pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb    |  2 +-
>   ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ++++++++++
>   meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  6 +-
>   meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb      |  4 +-
>   .../gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb       |  4 +-
>   .../recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb   |  4 +-
>   .../packagegroups/packagegroup-xfce-base.bb        |  4 +-
>   .../thunar-volman/thunar-volman_0.8.1.bb           |  4 +-
>   meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |  4 +-
>   .../xfce4-appfinder/xfce4-appfinder_4.12.0.bb      |  4 +-
>   .../recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb |  4 +-
>   .../xfce4-power-manager_1.6.0.bb                   |  4 +-
>   .../xfce4-session/xfce4-session_4.12.1.bb          |  4 +-
>   .../xfce4-settings/xfce4-settings_git.bb           |  4 +-
>   .../recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb     |  4 +-
>   meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb       |  4 +-
>   83 files changed, 649 insertions(+), 152 deletions(-)
>   delete mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
>   create mode 100644 meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
>   delete mode 100644 meta-filesystems/recipes-support/physfs/physfs_git.bb
>   create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname
>   create mode 100644 meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
>   create mode 100644 meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
>   create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
>   create mode 100644 meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
>   rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb} (86%)
>   rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb} (94%)
>   create mode 100644 meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
>   create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
>   create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>   rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} (88%)
>   create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
>   create mode 100644 meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
>   create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
>   create mode 100644 meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
>   create mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
>


