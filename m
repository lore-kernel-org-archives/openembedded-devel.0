Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E38D76967
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:43:04 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so1425486pdr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=6TTfbIqby9BCb6dXZy0z/zjboxfDt8BHulCIaDjsQrs=;
	b=Xx6VvlRDPUYObp+qJJZjRQ53TrICkF5GRWcmoUOGY5HjpC/a9n1Hj5vj3Rl8JfyaB3
	sNoIAD6lkKqJHsm2hRKFanio+hQEjetVeSz3hWKQlRFKfJbXiBGOnjTK2Os8DAHspma5
	xSM71Gs5Hxe2OWROapNjgzHYhUSdur/6nW2FT6P+JFP2QfFSyyLZWSf5PjE4X3NTSEIY
	2m/L10OwJKiUcmZPiU2FPpIf3j4wUhWeVZcr/qWMjo42QFKnPksNQyliwzSE9oDgubkL
	tco9T+9tFzfxK8vEdQnfiEMaRbdrCa2GcTb2VwsS8w4DMGhOtbXasSLKt93LOZvBSGXe
	cPcQ==
X-Received: by 10.70.61.170 with SMTP id q10mr54822506pdr.96.1439343784621;
	Tue, 11 Aug 2015 18:43:04 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	fj6sm4228504pdb.21.2015.08.11.18.43.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 18:43:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 11 Aug 2015 18:43:02 -0700
Message-Id: <5F4E0B3D-1A60-442F-9565-094443649C2D@gmail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH 00/17] updates & new recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 01:43:05 -0000
X-Groupsio-MsgNum: 56652
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42D875DC-E198-415C-A874-413DA7CB4864";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_42D875DC-E198-415C-A874-413DA7CB4864
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2015, at 12:57 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> The following changes since commit =
9a67b079a7deff2d6e53df031b26304a71c4e0f8:
>=20
>  znc: add SRCREV_FORMAT variable (2015-08-07 11:01:01 -0400)
>=20
> are available in the git repository at:
>=20
>  git://github.com/schnitzeltony/meta-openembedded.git patches
>=20
> for you to fetch changes up to =
ac67408111e9c6729da89f3c9f96b9e39c5994b3:
>=20
>  xfce4-settings: get option to hide mousepointer for (touch) input =
devices back (2015-08-11 09:43:28 +0200)
>=20
> ----------------------------------------------------------------
> Andreas M=C3=BCller (17):
>      xfce4-panel: build gtk3 libraries and ship them in an extra =
package
>      xfce4-pulseaudio-plugin: initial add 0.2.3
>      packagegroup-xfce-extended: add xfce4-pulseaudio-plugin
>      xfdesktop: update to 4.12.3
>      xfce4-cpufreq-plugin: update to 1.1.2
>      xfce4-weather-plugin: update to 0.8.6
>      xfce4-notes-plugin: update to 1.8.1
>      glibmm: update to 2.44.0
>      mm-common: update to 0.9.8
>      cairomm: update to 1.11.2
>      pangomm: update to 2.36.0
>      gparted: update to 0.23.0
>      rodent-icon-theme: initial add 5.0
>      networkmanager: update to 1.0.4
>      network-manager-applet: update to 1.0.4
>      pavucontrol: update to 3.0
>      xfce4-settings: get option to hide mousepointer for (touch) input =
devices back
>=20
> =
.../recipes-connectivity/network-manager-applet/files/0001-Add-support-for=
-AP-mode-setting-for-wifi-sharing.patch |  28 +--
> .../network-manager-applet/{network-manager-applet_1.0.2.bb =3D> =
network-manager-applet_1.0.4.bb}                   |   4 +-
> =
meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-conf=
ig-to-check-for-version-of-.patch       |  68 -------
> meta-gnome/recipes-extended/gparted/{gparted_0.20.0.bb =3D> =
gparted_0.23.0.bb}                                      |   9 +-
> meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.2.bb =
=3D> networkmanager_1.0.4.bb}                  |   4 +-
> meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb =3D> glibmm_2.44.0.bb} =
                                             |   4 +-
> meta-oe/recipes-core/mm-common/{mm-common_0.9.7.bb =3D> =
mm-common_0.9.8.bb}                                         |   4 +-
> meta-oe/recipes-graphics/cairo/{cairomm_1.10.0.bb =3D> =
cairomm_1.11.2.bb}                                           |   6 +-
> meta-oe/recipes-graphics/pango/{pangomm_2.34.0.bb =3D> =
pangomm_2.36.0.bb}                                           |   4 +-
> meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_1.0.bb =3D> =
pavucontrol_3.0.bb}                                  |   4 +-
> meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb       =
                                           |  11 ++
> meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.1.bb =
=3D> xfce4-cpufreq-plugin_1.1.2.bb}          |   4 +-
> meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.8.0.bb =3D> =
xfce4-notes-plugin_1.8.1.bb}                |   4 +-
> =
meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.b=
b                                       |  14 ++
> meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.5.bb =
=3D> xfce4-weather-plugin_0.8.6.bb}          |   4 +-
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb     =
                                           |   1 +
> meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb               =
                                           |  10 +-
> =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-re=
move-trouble-causing-comment.patch      |  31 ----
> =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Se=
t-default-themes.patch                  |  32 ----
> =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-=
cursor-theme-xfce-invisible.patch       | 248 -------------------------
> =
.../xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-a=
dd-touchscreen-pointer-option.patch     | 152 ---------------
> =
.../xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets=
-a-pointer-to-XfceXSettingsHe.patch     | 137 --------------
> =
.../xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-get=
s-a-property-touchscreen-poin.patch     | 249 -------------------------
> =
.../xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-chang=
e-of-pointer-device-used-and-.patch     | 589 =
----------------------------------------------------------
> =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible=
                                        | Bin 4160 -> 0 bytes
> meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait  =
                                           | Bin 126096 -> 0 bytes
> meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb            =
                                           |  11 +-
> =
meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monito=
r-name-when-accessing-.patch            | 138 --------------
> meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.2.bb =3D> =
xfdesktop_4.12.3.bb}                                     |   5 +-
> 29 files changed, 82 insertions(+), 1693 deletions(-)
> rename =
meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-ap=
plet_1.0.2.bb =3D> network-manager-applet_1.0.4.bb} (89%)
> delete mode 100644 =
meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-conf=
ig-to-check-for-version-of-.patch
> rename meta-gnome/recipes-extended/gparted/{gparted_0.20.0.bb =3D> =
gparted_0.23.0.bb} (57%)
> rename =
meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.2.bb =3D> =
networkmanager_1.0.4.bb} (94%)
> rename meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb =3D> =
glibmm_2.44.0.bb} (87%)
> rename meta-oe/recipes-core/mm-common/{mm-common_0.9.7.bb =3D> =
mm-common_0.9.8.bb} (51%)
> rename meta-oe/recipes-graphics/cairo/{cairomm_1.10.0.bb =3D> =
cairomm_1.11.2.bb} (68%)
> rename meta-oe/recipes-graphics/pango/{pangomm_2.34.0.bb =3D> =
pangomm_2.36.0.bb} (81%)
> rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_1.0.bb =3D> =
pavucontrol_3.0.bb} (75%)
> create mode 100644 =
meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
> rename =
meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.1.bb =
=3D> xfce4-cpufreq-plugin_1.1.2.bb} (64%)
> rename =
meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.8.0.bb =3D> =
xfce4-notes-plugin_1.8.1.bb} (78%)
> create mode 100644 =
meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.b=
b
> rename =
meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.5.bb =
=3D> xfce4-weather-plugin_0.8.6.bb} (72%)
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-re=
move-trouble-causing-comment.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Se=
t-default-themes.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-=
cursor-theme-xfce-invisible.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mous=
e-settings-dialog-add-touchscreen-pointer-option.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-Xfce=
PointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-Xfce=
XSettingsHelper-gets-a-property-touchscreen-poin.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-poin=
ters-detect-a-change-of-pointer-device-used-and-.patch
> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible=

> delete mode 100644 =
meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait
> delete mode 100644 =
meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monito=
r-name-when-accessing-.patch
> rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.2.bb =3D> =
xfdesktop_4.12.3.bb} (64%)
>=20

series looks ok.



--Apple-Mail=_42D875DC-E198-415C-A874-413DA7CB4864
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKpKYACgkQuwUzVZGdMxQpmgCfa/AuyRU+pTsfg02gGJWCLrAT
O2QAn0ev09Dz5NRbjmKEOJ1sNc/C5KW9
=T5BO
-----END PGP SIGNATURE-----

--Apple-Mail=_42D875DC-E198-415C-A874-413DA7CB4864--
