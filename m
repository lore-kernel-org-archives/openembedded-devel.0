Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A469E605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 14:39:55 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so20040921wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MZWoAisteu2JFZq9xLT/D10wZtGQcydifY4GyBJbzTc=;
	b=RQY0wt5neW8vMnPeMAg//35XgQgH5+Ha8VgX9EOtbXZlc24oZfA/v7y+isMoh9FXjr
	Y2dwT6vsvYnhp0b3pBibVoDxS+pZx9Wi1bDa6bMzuXyT4b6r+qOrO/lmsGPYxlaj+voR
	FyjaZ9jGcAgPoP2x2whGaS0PMXZywiDvI5PiDxZz71vmHy8NHm9q4Vl5jcLw85nSHk67
	s6p8jt6s0BZjwgjvPrmWwtFmr0Fr1n2z9jMwZXFQS3NQRvsbKXXx/lUpOVAkU83crEaD
	qr5C4TaL6D8pwzfgiieRHAguEG3NIh8mmGvp9CzRRGitaoyQdiJ39MqJP7FqN60tWBwF
	8GCw==
X-Received: by 10.180.96.167 with SMTP id dt7mr1381589wib.80.1435243197008;
	Thu, 25 Jun 2015 07:39:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id z9sm7959748wiv.9.2015.06.25.07.39.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 07:39:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Jun 2015 16:40:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150625144016.GC2394@jama>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/7] here and there / some resend
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
X-List-Received-Date: Thu, 25 Jun 2015 14:39:58 -0000
X-Groupsio-MsgNum: 56031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 02:35:47PM +0200, Andreas M=FCller wrote:
> I saw that my last patches [1-3][5] did not make it into patchwork=20
> (german umlaut?) so I resend them as pull request:

All these were marked as spam by my gmail account, so I believe this was
another example of
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7657

I'll apply these manually, thanks.

> The following changes since commit 34dcefb1bfbbac33a771b4b68748e0d9d87736=
5e:
>=20
>   lvm2: add systemd support (2015-06-23 12:43:12 +0200)
>=20
> are available in the git repository at:
>=20
>   https://github.com/schnitzeltony/meta-openembedded.git patches
>=20
> for you to fetch changes up to 4f22e684e6950301816602fe17b4d06bc0a08078:
>=20
>   gnome-settings-daemon: fix PACKAGECONFIG (2015-06-25 14:20:59 +0200)
>=20
> ----------------------------------------------------------------
> Andreas M=FCller (7):
>       libndp: initial add 1.5
>       networkmanager: update to 1.0.2
>       network-manager-applet: update to 1.0.2
>       libxfce4ui: build gtk3 libs and pack gtk2/gtk3 libs in separate pac=
kages
>       xfce4-session: ensure ip for machine is found by adding to hosts
>       xfdesktop: fix settings for monitors containing white spaces
>       gnome-settings-daemon: fix PACKAGECONFIG
>=20
>  ...ort-for-AP-mode-setting-for-wifi-sharing.patch =3D> 0001-Add-support-=
for-AP-mode-setting-for-wifi-sharing.patch} |   0
>  .../network-manager-applet/files/0001-remove-classes-and-properties-whic=
h-are-not-supporte.patch                  |  41 -----------------
>  ...twork-sharing-if-device-supports-it.patch =3D> 0002-Use-AP-mode-for-n=
etwork-sharing-if-device-supports-it.patch} |   2 +-
>  .../network-manager-applet/{network-manager-applet_0.9.8.10.bb =3D> netw=
ork-manager-applet_1.0.2.bb}                |  16 +++----
>  meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.3=
2.1.bb                                    |   2 +-
>  meta-oe/recipes-connectivity/libndp/libndp_1.5.bb                       =
                                          |  10 +++++
>  .../networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsy=
stemd-not-libsystem.patch                 |  30 -------------
>  meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb =
=3D> networkmanager_1.0.2.bb}               |  41 ++++-------------
>  meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optiona=
l-gtk3-support.patch                      |  37 ----------------
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb                  =
                                          |   7 ++-
>  meta-xfce/recipes-xfce/xfce4-session/machine-host.bb                    =
                                          |  17 ++++++++
>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb            =
                                          |   2 +
>  meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-moni=
tor-name-when-accessing-.patch            | 138 +++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++
>  meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb                    =
                                          |   1 +
>  14 files changed, 188 insertions(+), 156 deletions(-)
>  rename meta-gnome/recipes-connectivity/network-manager-applet/files/{000=
2-Add-support-for-AP-mode-setting-for-wifi-sharing.patch =3D> 0001-Add-supp=
ort-for-AP-mode-setting-for-wifi-sharing.patch} (100%)
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
>  rename meta-gnome/recipes-connectivity/network-manager-applet/files/{000=
3-Use-AP-mode-for-network-sharing-if-device-supports-it.patch =3D> 0002-Use=
-AP-mode-for-network-sharing-if-device-supports-it.patch} (97%)
>  rename meta-gnome/recipes-connectivity/network-manager-applet/{network-m=
anager-applet_0.9.8.10.bb =3D> network-manager-applet_1.0.2.bb} (67%)
>  create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
>  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8=
=2E10.bb =3D> networkmanager_1.0.2.bb} (59%)
>  delete mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configur=
e.ac-remove-optional-gtk3-support.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
>  create mode 100644 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-wh=
itespaces-from-monitor-name-when-accessing-.patch
>=20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWMEs8ACgkQN1Ujt2V2gBxXVACeI/SMYdcHuRDoswJi5SA6SZVu
R0UAoJMhaV9ZdjQW6f3+PAWRUpHHqSY+
=ok8A
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
