Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C8D9265DC4;
	Sun, 20 Apr 2014 14:27:10 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2999392eek.8
	for <multiple recipients>; Sun, 20 Apr 2014 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1UlSN5JDbOZfCxcQ4hLzkd6RSC5jm3FimHFOwo2ZPaM=;
	b=xczCGh5xWXvGGj//t64vkzOnz00Tb9oxOCH+gYNV12+UfgiV7WGL4xQWo2Y80Leg9n
	Z5ArmG4FIlIv2qMCO1B3+XdmzL4IB0+qilT8cID2GvdVHcfSwMWxjZNNQqQjX2/WcGnz
	GtFruQercBoo8kYQTqgp3r+AWvhkWZk0oWw/S8ZulrwUHehVEroGF/6Q8GYpO76Swbt8
	LhPaQuEzcU04trvgqdH13NydV09tx3yRC9/eiP8y25ZHj8ZnXIOnLhdbAIssg0acbEmB
	X2capoXVgno2KjPN3t7YUEe0FecyLSXJc/b2bvqzAra844i7T1iDSSEhXvdSYOq1tH78
	TwkA==
X-Received: by 10.15.24.201 with SMTP id j49mr131124eeu.99.1398004031853;
	Sun, 20 Apr 2014 07:27:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm95023448eeg.4.2014.04.20.07.27.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:27:10 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:27:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140420142716.GT2486@jama>
References: <20140420115016.8BCB5504AA@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140420115016.8BCB5504AA@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBnbm9tZS1kaXNrLXV0aWxpdHk6IGNoYW5nZSBQQUNLQUdFQ09ORklHIGRlZmF1bHQ6IHJlbW92ZSBuYXV0aWx1cw==?=
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
X-List-Received-Date: Sun, 20 Apr 2014 14:27:14 -0000
X-Groupsio-MsgNum: 49357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mW/Yq1p9Hn2AHmV6"
Content-Disposition: inline

--mW/Yq1p9Hn2AHmV6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2014 at 11:50:16AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: c6e9d85d948ed4676572a34241376a2156b837a2
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dc6e9d85d948ed4676572a34241376a2156b837a2
>=20
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> Date:   Wed Apr 16 09:32:30 2014 +0200
>=20
> gnome-disk-utility: change PACKAGECONFIG default: remove nautilus
>=20
> gnome-doc-utils had to be added when not depending on nautilus
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb     | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb
> index 6b6e931..37c5046 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "GNOME disk utility"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9115d11797a5e6b746b4e9b90194=
564"
> =20
> -DEPENDS =3D "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/l=
ibx11 libatasmart"
> +DEPENDS =3D "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/l=
ibx11 libatasmart gnome-doc-utils"
> =20
>  PR =3D "r4"
> =20
> @@ -20,7 +20,7 @@ SRC_URI +=3D "\
> =20
>  EXTRA_OECONF +=3D "--disable-scrollkeeper"
> =20
> -PACKAGECONFIG ??=3D "nautilus"
> +PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[nautilus] =3D "--enable-nautilus-extension,--disable-nauti=
lus-extension,nautilus"

Too late I've noticed this:
gnome-disk-utility-2.32.0: gnome-disk-utility: configure was passed
unrecognised options: --disable-nautilus-extension

can you please send follow-up to resolve this?

> =20
>  do_configure_prepend() {
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mW/Yq1p9Hn2AHmV6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT2UQACgkQN1Ujt2V2gBz5NgCfeichSqzwumNO99+dEqzMk+un
P4EAoJGPF3wI10MM6uHqyw5YqNmGFf0q
=l3se
-----END PGP SIGNATURE-----

--mW/Yq1p9Hn2AHmV6--
