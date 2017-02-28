Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 51E3372F8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 11:38:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so1899180wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UHQ/EJ/ChunMJAltqyLmSrIUbQPQ/3RCurzbvv79WC8=;
	b=tzA/vR8sKcZuTVPSexFJyEFfCzfSBiRDVpgFaqR7gNEz1YS0Ev28WVpjJTr/y2vkVn
	mp/WRpE9k4ZMarN6bMGAakOMkJhaQbO0UOTTXyf7q1j1fuMTaavwjETVshb+Ft1ghQYp
	lTZjInK+h/60dfTUA6Ae12L+g5SVSzRIZIk0mQaXGOVNGda/JH/n2e3WGjM+wKcxnAaL
	8f5yVDbyBCDqTDZ+ynZm44g5p0KKTdg78JeKJuR0hpKU2F9QdmaWA/hZXNSblILqb0zp
	zgq8zlKtOeVbaLGSUtny/ZZcfAzxK2wwLRTcrOLE8UvZmyLu+Q4AZybkLPOODy8fhmeS
	K2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UHQ/EJ/ChunMJAltqyLmSrIUbQPQ/3RCurzbvv79WC8=;
	b=VcOkL3LN/Hv8kxCAmE0ThTBOmUPa0p57bdMw+YjBl8fD6cGcaEtPvhzC5rSpDqhzUh
	Q2PY5BVFkMi0nWKkDaLwhfB5avyPeGrAcXIhWMEXYFXfpQQ5qWUwFb3xoGwe4CHhMZoO
	I1or15a//VQ7ogtqzMMybOdOlokL1ntga7loT8TbMmg5o3ucAPpQMR3rKdp4L4ZIgfEg
	aVHVkIhoOM3/SuR+1GIa1COgXuw4h/SCGF33S36+IApCWBOyu47Pw5lzD74F5zDzSgVy
	rdGumcQ4JxAuSuQDiVc9zCCgJDLvRKlouHAMkFmUCXWRaynJY7rWj1/trUj6a9RiegqJ
	XYnA==
X-Gm-Message-State: AMke39msVqAsyOqp8bV9dLKTNgXqkSWcFJvcHXk4mPurFvLchY5xuFQwswS21tGZ323WZw==
X-Received: by 10.28.167.68 with SMTP id q65mr2144219wme.126.1488281892588;
	Tue, 28 Feb 2017 03:38:12 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h75sm1938032wrh.37.2017.02.28.03.38.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Feb 2017 03:38:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Feb 2017 12:38:14 +0100
To: Tom Hayward <tom@harbortronics.com>
Message-ID: <20170228113814.GA3275@jama>
References: <1488234393-129769-1-git-send-email-tom@harbortronics.com>
MIME-Version: 1.0
In-Reply-To: <1488234393-129769-1-git-send-email-tom@harbortronics.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] usb-modeswitch and usb-modeswitch-data: update to 2.5.0 and 20170205 respectively.
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
X-List-Received-Date: Tue, 28 Feb 2017 11:38:14 -0000
X-Groupsio-MsgNum: 65597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2017 at 02:26:33PM -0800, Tom Hayward wrote:
> ---

You cannot just remove PNBLACKLISTs without fixing the issues in the
recipe.

Luckily Derek already sent fix for this in:
[meta-oe][PATCH] usb-modeswitch: update inherit to work correctly with RSS

and I've merged it to master today, so you just need to rebase your
change, retest it and send as PATCHv2.

Regards,

>  ...itch-data_20140529.bb =3D> usb-modeswitch-data_20170205.bb} |   10 ++=
+-------
>  .../{usb-modeswitch_2.2.0.bb =3D> usb-modeswitch_2.5.0.bb}     |    6 ++=
----
>  2 files changed, 5 insertions(+), 11 deletions(-)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20140=
529.bb =3D> usb-modeswitch-data_20170205.bb} (50%)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb =
=3D> usb-modeswitch_2.5.0.bb} (68%)
>=20
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201=
70205.bb
> similarity index 50%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20=
140529.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2017=
0205.bb
> index 434f68a..042cd38 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529=
=2Ebb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205=
=2Ebb
> @@ -5,17 +5,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
>  inherit allarch
> =20
>  SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "dff94177781298aaf0b3c2a3c3dea6b2"
> -SRC_URI[sha256sum] =3D "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6e=
c8417aa9a587e536"
> +SRC_URI[md5sum] =3D "0cc107cd0c4c83df0d9400c999e21dfd"
> +SRC_URI[sha256sum] =3D "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40=
a1a07d01662738d1"
> =20
>  do_install() {
>      oe_runmake install DESTDIR=3D${D}
>  }
> =20
> -RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.2.0)"
> +RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.4.0)"
>  FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
>                  ${datadir}/usb_modeswitch"
> -
> -PNBLACKLIST[usb-modeswitch-data] ?=3D "Runtime depends on blacklisted us=
b-modeswitch"
> -
> -PNBLACKLIST[usb-modeswitch-data] ?=3D "Runtime depends on blacklisted us=
b-modeswitch-data"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.=
bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
> similarity index 68%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
> index 5211d7b..503b595 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
>  DEPENDS =3D "libusb1"
> =20
>  SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "f323fe700edd6ea404c40934ddf32b22"
> -SRC_URI[sha256sum] =3D "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5=
991f7680eb908a3a"
> +SRC_URI[md5sum] =3D "38ad5c9d70e06227a00361bdc2b1e568"
> +SRC_URI[sha256sum] =3D "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0c=
e1e36a614d687633"
> =20
>  EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh"
> =20
> @@ -17,5 +17,3 @@ RRECOMMENDS_${PN} =3D "usb-modeswitch-data"
>  do_install() {
>      oe_runmake DESTDIR=3D${D} install
>  }
> -
> -PNBLACKLIST[usb-modeswitch] ?=3D "Fails to build with RSS http://errors.=
yoctoproject.org/Errors/Details/130620/"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLVhJQAKCRA3VSO3ZXaA
HAOEAKCdIIuhMOt4+hIlHGWLxKb7Y89vzgCggj6xXib8+f1xZqfoMctAd72S2F4=
=73pg
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
