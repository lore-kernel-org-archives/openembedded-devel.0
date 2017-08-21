Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3582C6078E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:20:51 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f8so10991423wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dG1Yv1BWbl2rqgJqx9siZgOr2GHrzo5X4OrAoN1lTXY=;
	b=J0ppdqkRn0ogiguZLiQdeN/blfaqq1JbfYSVhDhAUFCDKg8IOyO1lpNgcpz2Ap0ZRf
	IC+Av5EFmTXY6Bp7ixr8k9U922sFmRpht1yV742QrLdbFZgreSX9uXn6p9bIfYr0pkl6
	hIw0parOJuNt4+GDsVfSsYmSH0OiWwJQ07gqv3vD2xNjHWJlUiC0UHNXC0hS4x7cTIt5
	1rIJBtwJ4fwVI+eThHlV9YDPpBSrN2OArbslbXkLDJNHnsh0ZqlG/LEzwzE4PT7ejIWO
	qCE6KJ9NriAbGO2vXRWhFoXkhdz0ZfBxjp7yKm5ANgTX+LujqGWtpAz+3vMDu4VldROv
	Oi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dG1Yv1BWbl2rqgJqx9siZgOr2GHrzo5X4OrAoN1lTXY=;
	b=KXoipY/q35PKBQQ2CHxLeMXSpNcqaihxHkD+7J0l2rXRwwkbUgGH7o00cKOAERLRO0
	UNagcp6ei27P7X2Wq5YW5H73+gIGKGX2mzgfUfAm99UIzumC/vvbVWHPW4EdrZubAUoF
	8JpkQrDgYu5sxPl3BnVFmWRVbQ21uvmoilI3vKgJb52HfZJAaAuc0doT20cOMDJ39dto
	P2QlxPE5PGCOO5WA2asVeqpqzDNV4l3u798LOPqmidjZSlIPDNDU59t/b/lL1YTzPZty
	ASrH5rfPBy8mY3kzpAfFxkdVqiN3EN6Jd1c7je3wUj1vyo/JZc+HZr33jyy+sOqBMJOv
	AvjA==
X-Gm-Message-State: AHYfb5jmK/1Tml2C8k3jDFvnuFrhYfVafg9O/lvZcwzw5y8gNVcJb3vr
	+H05tFRH4qG6aCXV
X-Received: by 10.28.68.85 with SMTP id r82mr5936142wma.21.1503300052438;
	Mon, 21 Aug 2017 00:20:52 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f84sm1719707wme.34.2017.08.21.00.20.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Aug 2017 00:20:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Aug 2017 09:22:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170821072233.GA3302@jama>
References: <20170821071847.12732-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170821071847.12732-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: Re: [meta-oe][PATCH] recipes: remove blacklisted recipes
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
X-List-Received-Date: Mon, 21 Aug 2017 07:20:52 -0000
X-Groupsio-MsgNum: 68258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2017 at 09:18:47AM +0200, Martin Jansa wrote:
> * as PNBLACKLIST message says, these recipes are blacklisted for long
>   time and nobody showed any interest to fix them
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-devtools/python/python-edbus_1.7.0.bb  |   8 -
>  .../recipes-devtools/python/python-efl_1.15.0.bb   |   6 -
>  meta-efl/recipes-devtools/python/python-efl_git.bb |  11 -
>  meta-efl/recipes-efl/e17/cpu_svn.bb                |  12 -
>  meta-efl/recipes-efl/e17/diskio_svn.bb             |  10 -
>  meta-efl/recipes-efl/e17/e-tasks_git.bb            |  34 ---
>  meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb |  37 ---
>  .../e17/e-wm-theme-illume-efenniht_svn.bb          |  39 ---
>  meta-efl/recipes-efl/e17/e-wm_0.18.8.bb            |  17 --
>  meta-efl/recipes-efl/e17/e-wm_0.19.10.bb           |  21 --
>  meta-efl/recipes-efl/e17/e-wm_git.bb               |  16 --
>  meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |  18 --
>  meta-efl/recipes-efl/e17/elbow_git.bb              |  26 --
>  meta-efl/recipes-efl/e17/elfe_git.bb               |  17 --
>  meta-efl/recipes-efl/e17/elmdentica_svn.bb         |  23 --
>  meta-efl/recipes-efl/e17/emprint_svn.bb            |  14 -
>  meta-efl/recipes-efl/e17/enjoy_git.bb              |  50 ----
>  meta-efl/recipes-efl/e17/ephoto_svn.bb             |  21 --
>  meta-efl/recipes-efl/e17/exalt-client_svn.bb       |  26 --
>  meta-efl/recipes-efl/e17/exalt_svn.bb              |  36 ---
>  meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |  41 ---
>  meta-efl/recipes-efl/e17/exquisite_svn.bb          |  43 ---
>  meta-efl/recipes-efl/e17/flame_svn.bb              |  17 --
>  meta-efl/recipes-efl/e17/forecasts_svn.bb          |  12 -
>  meta-efl/recipes-efl/e17/news_svn.bb               |  14 -
>  meta-efl/recipes-efl/e17/places_svn.bb             |  18 --
>  meta-efl/recipes-efl/e17/rage_svn.bb               |  15 --
>  meta-efl/recipes-efl/e17/rain_svn.bb               |  18 --
>  meta-efl/recipes-efl/e17/screenshot_svn.bb         |  16 --
>  meta-efl/recipes-efl/e17/terminology_0.9.1.bb      |  10 -
>  meta-efl/recipes-efl/e17/uptime_svn.bb             |  12 -
>  meta-efl/recipes-efl/efl/azy_svn.bb                |  37 ---
>  meta-efl/recipes-efl/efl/edbus_1.7.9.bb            |  16 --
>  meta-efl/recipes-efl/efl/efl.inc                   | 290 ---------------=
------
>  ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 --
>  .../efl/efl/0001-evas_3d-Add-Eet.h-includes.patch  |  51 ----
>  meta-efl/recipes-efl/efl/efl_1.15.1.bb             |  29 ---
>  .../efl/elementary-theme-efenniht_svn.bb           |  44 ----
>  meta-efl/recipes-efl/efl/elementary_1.15.1.bb      |  18 --
>  .../efl/emotion-generic-players_1.15.0.bb          |  14 -
>  meta-efl/recipes-efl/efl/engrave_svn.bb            |  15 --
>  meta-efl/recipes-efl/efl/entrance_svn.bb           |  43 ---
>  meta-efl/recipes-efl/efl/epdf_svn.bb               |  35 ---
>  .../recipes-efl/efl/evas-generic-loaders_1.15.0.bb |  14 -
>  meta-efl/recipes-efl/efl/expedite_1.7.9.bb         |  28 --
>  meta-efl/recipes-efl/efl/expedite_git.bb           |  31 ---
>  meta-efl/recipes-efl/efl/libeflvala_svn.bb         |  23 --
>  meta-efl/recipes-efl/efl/libeweather_svn.bb        |  48 ----
>  .../packagegroups/packagegroup-efl-sdk.bb          |  19 --
>  .../packagegroup-efl-standalone-sdk-target.bb      |  19 --
>  .../packagegroups/packagegroup-x11-illume.bb       |  30 ---
>  meta-efl/recipes-efl/webkit/webkit-efl.inc         |  69 -----
>  ...on.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch |  46 ----
>  ...rs.cmake-Add-Wno-error-deprecated-declara.patch |  45 ----
>  .../0003-FEBlendNEON.h-fix-missing-semicolon.patch |  35 ---
>  ...ld-with-EFL-1.12-https-bugs.webkit.org-sh.patch | 146 -----------
>  .../0005-Fix-the-build-with-cmake-3.patch          | 104 --------
>  ...sEfl.cmake-Fix-build-with-newer-CMake-3.4.patch |  30 ---
>  meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb   |  12 -
>  meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb |  19 --
>  .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   |  28 --
>  .../recipes-utils/dmapi/dmapi_2.2.12.bb            |  33 ---
>  meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb    |  26 --
>  meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb |  25 --
>  .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |  18 --
>  .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |  32 ---
>  .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |  25 --
>  .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb    |  20 --
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         | 108 --------
>  .../gnome-backgrounds/gnome-backgrounds_2.32.0.bb  |  21 --
>  .../gnome-control-center_2.32.1.bb                 |  35 ---
>  .../gnome-desktop/gnome-desktop_2.32.1.bb          |  28 --
>  .../gnome-disk-utility_2.32.0.bb                   |  45 ----
>  .../gnome-keyring/gnome-keyring_2.32.1.bb          |  45 ----
>  .../gnome-menus/gnome-menus_2.30.5.bb              |  30 ---
>  .../gnome-panel/gnome-panel3_3.0.2.bb              |  51 ----
>  .../gnome-panel/gnome-panel_2.32.1.bb              |  48 ----
>  .../gnome-power-manager_2.32.0.bb                  |  54 ----
>  .../gnome-session/gnome-session_2.32.1.bb          |  32 ---
>  .../gnome-settings-daemon_2.32.1.bb                |  43 ---
>  .../gnome-system-monitor_2.28.2.bb                 |  35 ---
>  .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |  22 --
>  .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |  25 --
>  .../recipes-gnome/gnome/libgnomeprint_2.18.8.bb    |  28 --
>  .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |  49 ----
>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |  35 ---
>  .../recipes-gnome/gweather/libgweather3_3.0.2.bb   |  28 --
>  .../recipes-gnome/gweather/libgweather_2.30.3.bb   |  24 --
>  .../recipes-gnome/nautilus/nautilus3_3.2.1.bb      |  54 ----
>  .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |  43 ---
>  meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |  20 --
>  meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |  19 --
>  meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |  16 --
>  meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |  12 -
>  .../system-tools/system-tools-backends_2.10.2.bb   |  54 ----
>  meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |  21 --
>  .../recipes-support/goffice/goffice_0.10.1.bb      |  51 ----
>  .../recipes-support/tracker/tracker_0.14.2.bb      |  88 -------
>  meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |  24 --
>  .../libgpewidget/libgpewidget_0.117.bb             |  25 --
>  .../recipes-graphics/minilite/minilite_0.50.bb     |  18 --
>  .../recipes-support/fbreader/fbreader_0.12.10.bb   |  46 ----
>  meta-gpe/recipes-support/fbreader/fbreader_git.bb  |  45 ----
>  .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         | 136 ----------
>  .../recipes-dvb/tvheadend/tvheadend_git.bb         |  43 ---
>  .../kodi/kodi-addon-pvr-hts_git.bb                 |  57 ----
>  .../recipes-mediacenter/kodi/kodi-platform_git.bb  |  39 ---
>  .../recipes-mediacenter/kodi/kodi-startup.bb       |  24 --
>  .../recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb       |  57 ----
>  .../coriander/coriander_2.0.2.bb                   |  17 --
>  .../gstreamer-0.10/gst-ffmpeg_0.10.13.bb           | 103 --------
>  .../recipes-multimedia/gstreamer/gst123_0.3.1.bb   |  17 --
>  .../recipes-daemons/dnrd/dnrd_2.20.3.bb            |  41 ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    |  92 -------
>  .../recipes-kernel/netmap/netmap_git.bb            |  37 ---
>  .../recipes-protocols/accel-ppp/accel-ppp_git.bb   |  45 ----
>  .../recipes-support/nis/ypbind-mt_2.2.bb           |  53 ----
>  meta-oe/recipes-benchmark/pmbw/pmbw_git.bb         |  30 ---
>  .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   |  36 ---
>  meta-oe/recipes-connectivity/soft66/soft66_git.bb  |  20 --
>  .../telepathy/libtelepathy_0.3.3.bb                |  26 --
>  .../telepathy/telepathy-mission-control_5.16.1.bb  |  53 ----
>  .../zeroc-ice/zeroc-ice_3.5.1.bb                   |  87 -------
>  .../fakeroot/fakeroot-native_1.18.4.bb             |  15 --
>  meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb   |  30 ---
>  .../packagegroups/packagegroup-cli-tools.bb        |  49 ----
>  meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      | 118 ---------
>  meta-oe/recipes-devtools/dt/dt_18.32.bb            |  49 ----
>  meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb  |  97 -------
>  .../packagekit/packagekit_0.5.6.bb                 |  65 -----
>  .../vala-dbus-binding-tool_0.4.0.bb                |   6 -
>  .../vala-dbus-binding-tool_git.bb                  |  20 --
>  .../openlmi/openlmi-networking_0.3.1.bb            |  32 ---
>  .../openlmi/openlmi-providers_0.6.0.bb             |  56 ----
>  .../openlmi/openlmi-storage_0.8.1.bb               |  34 ---
>  .../recipes-extended/subsurface/subsurface_git.bb  |  21 --
>  meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |  19 --
>  meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb     |  41 ---
>  .../recipes-graphics/clutter/clutter-box2d_git.bb  |  19 --
>  meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb        |  52 ----
>  meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb |   8 -
>  meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |  82 ------
>  .../terminus-font/terminus-font_4.38.bb            |  47 ----
>  .../recipes-graphics/wayland/wayland-fits_git.bb   |  35 ---
>  .../xorg-driver/xf86-input-mtev_git.bb             |  22 --
>  .../xorg-driver/xf86-video-geode_2.11.16.bb        |  16 --
>  .../xorg-driver/xf86-video-glamo_git.bb            |  25 --
>  .../xorg-font/xorg-fonts-100dpi.bb                 |  24 --
>  meta-oe/recipes-kernel/ktap/ktap-module_git.bb     |  22 --
>  meta-oe/recipes-kernel/ktap/ktap_git.bb            |  19 --
>  .../recipes-multimedia/minidlna/minidlna_1.1.5.bb  |   6 -
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 159 -----------
>  meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb     | 114 --------
>  .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |  56 ----
>  .../claws-plugin-gtkhtml2-viewer_0.31.bb           |  24 --
>  .../claws-mail/claws-plugin-mailmbox_1.15.bb       |  20 --
>  .../claws-mail/claws-plugin-rssyl_0.34.bb          |  20 --
>  meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb  |  33 ---
>  meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |  42 ---
>  meta-oe/recipes-support/emacs/emacs_23.4.bb        |  12 -
>  .../recipes-support/farsight/farsight2_0.0.22.bb   |  34 ---
>  meta-oe/recipes-support/fftw/benchfft_3.1.bb       |  21 --
>  meta-oe/recipes-support/flite/flite-alsa_1.3.bb    |  21 --
>  meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |  19 --
>  .../libdbi/libdbi-drivers_0.8.3-1.bb               |   8 -
>  meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |  30 ---
>  meta-oe/recipes-support/ode/ode_0.13.bb            |  31 ---
>  .../open-vcdiff/open-vcdiff_0.8.4.bb               |  21 --
>  .../recipes-support/opencv/opencv-samples_2.4.bb   |  41 ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb       | 106 --------
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |  48 ----
>  meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb | 115 --------
>  .../psqlodbc/psqlodbc_09.05.0300.bb                |  16 --
>  .../system-setup-keyboard_0.8.8.bb                 |  33 ---
>  .../vala-terminal/vala-terminal_git.bb             |  20 --
>  .../vboxguestdrivers/vboxguestdrivers_4.3.36.bb    |  72 -----
>  meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |  39 ---
>  meta-ruby/recipes-devtools/ruby/bundler_git.bb     |  33 ---
>  178 files changed, 6754 deletions(-)

Take this as final warning, Winter is coming.

Last 9 days to safe your favourite recipes.

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWZqKOAAKCRA3VSO3ZXaA
HHMBAJ9mldl7t1EDxohggIBOJtsezFh+ZgCfe06exU6WzYGQfFidPcjPOnij2G8=
=5COv
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
