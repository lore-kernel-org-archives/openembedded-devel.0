Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7317B73204
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:15:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c131so1776743wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ot2Vc7I1YfHIFBebIIW/Gei3OnUWLCHYrRK62c0p8c8=;
	b=x8M9neEDx5CuNIE5FFUmx70MB9L7VGaUdgxKLAdt32j2AYRDTBAROO4YPdpq/ubunC
	VW0AB4rQEPYgTd6NE+dPcIeG0JIi+oqHbfmum8GP/QnYPTIorBoYa8sAjwqXmvrI7/SQ
	mSWRRdtHJRpJeUBR60WhqTge9Le9xBGzyQ6K8bKJMJAZRHUFPg8J7R2wr3uym8EjALj8
	QYibZDfO+pDy74RJaRWGdDMOa+hqm8jg/ePk8mzGb6kzXrJ52n+yXDu0l62tkoDhzio1
	SUwdOssk5XEscLxZXrYRn6V17FtE0RckcGuuBalEkGzfk2j1947rJPfWTzqqsnEvKFh4
	cY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ot2Vc7I1YfHIFBebIIW/Gei3OnUWLCHYrRK62c0p8c8=;
	b=KQKy79IGdLNk3Hq1X923iH7IsuzlDe1Shtb0wfEcSjnsaoscMrRYVwi6TcE9fhY4Ht
	dD/kBYuQ0O7g8UtNBWTDCZ7T7hFarQ5aASJuA5Qc++2v6QochKgz0aEHsrR9pBXC7kr6
	d3cb0MItAanrbcsDIOCuaUdG2mLYishgCSnw6tGyxnnSOiRxOOUhn5Xvrt+E5sFmKRui
	Lqy304haDx9tO//JnWd7Zn3oMBLQ1F5gXaTOWPvoXEikLbaZqHlJBXbh/cmZyovQRHGM
	stHh5HFQV0yQoTahvHZpIxJurF+kJdcENeA7w9NwG+/cs6mIVIKp7CPMWvmUMLnDkUJh
	dWdA==
X-Gm-Message-State: AE9vXwNixkVai03LLEgiVl/WTE+gxJMMuADe9N6IgAIdQDZ2Uqk/g1o04BgxV9kjD0YWyA==
X-Received: by 10.28.52.210 with SMTP id b201mr15868857wma.32.1473754503313;
	Tue, 13 Sep 2016 01:15:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w207sm4040604wmd.8.2016.09.13.01.15.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Sep 2016 01:15:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Sep 2016 10:15:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160913081500.GA2701@jama>
References: <1473646855-2216-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1473646855-2216-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe][PATCH] ttf-dejavu: 2.35 -> 2.37
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
X-List-Received-Date: Tue, 13 Sep 2016 08:15:07 -0000
X-Groupsio-MsgNum: 63089
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 11, 2016 at 10:20:55PM -0400, Wang Xin wrote:
> 1) Upgrade ttf-dejavu from 2.35 to 2.37.=20
> 2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But th=
e LICENSE has not been changed.
>=20
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../ttf-fonts/{ttf-dejavu_2.35.bb =3D> ttf-dejavu_2.37.bb}      | 11 +++=
++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-graphics/ttf-fonts/{ttf-dejavu_2.35.bb =3D> ttf-d=
ejavu_2.37.bb} (80%)
>=20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> similarity index 80%
> rename from meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
> rename to meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> index 3ce791b..1d24f2f 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> @@ -3,7 +3,7 @@ require ttf.inc
>  SUMMARY =3D "DejaVu font - TTF Edition"
>  HOMEPAGE =3D "http://dejavu.sourceforge.net/wiki/"
>  LICENSE =3D "BitstreamVera"
> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;m=
d5=3D9f867da7a73fad2715291348e80d0763"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;m=
d5=3D449b2c30bfe5fa897fe87b8b70b16cfa""

Doesn't even parse because extra closing quote, I've fixed it locally,
but next time please test the changes before sending them.

>  # all subpackages except ${PN}-common itself rdepends on ${PN}-common
>  RDEPENDS_${PN}-sans =3D "${PN}-common"
> @@ -11,6 +11,7 @@ RDEPENDS_${PN}-sans-mono =3D "${PN}-common"
>  RDEPENDS_${PN}-sans-condensed =3D "${PN}-common"
>  RDEPENDS_${PN}-serif =3D "${PN}-common"
>  RDEPENDS_${PN}-serif-condensed =3D "${PN}-common"
> +RDEPENDS_${PN}-mathtexgyre =3D "${PN}-common"
>  RDEPENDS_${PN}-common =3D ""
>  PR =3D "r7"
> =20
> @@ -30,15 +31,17 @@ PACKAGES =3D "\
>              ${PN}-sans-condensed \
>              ${PN}-serif \
>              ${PN}-serif-condensed \
> +            ${PN}-mathtexgyre \
>              ${PN}-common"
> -FONT_PACKAGES =3D "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}=
-serif ${PN}-serif-condensed"
> +FONT_PACKAGES =3D "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}=
-serif ${PN}-serif-condensed ${PN}-mathtexgyre"
> =20
>  FILES_${PN}-sans            =3D "${datadir}/fonts/truetype/DejaVuSans.tt=
f ${datadir}/fonts/truetype/DejaVuSans-*.ttf"
>  FILES_${PN}-sans-mono       =3D "${datadir}/fonts/truetype/DejaVuSansMon=
o*.ttf"
>  FILES_${PN}-sans-condensed  =3D "${datadir}/fonts/truetype/DejaVuSansCon=
densed*.ttf"
>  FILES_${PN}-serif           =3D "${datadir}/fonts/truetype/DejaVuSerif.t=
tf ${datadir}/fonts/truetype/DejaVuSerif-*.ttf"
>  FILES_${PN}-serif-condensed =3D "${datadir}/fonts/truetype/DejaVuSerifCo=
ndensed*.ttf"
> +FILES_${PN}-mathtexgyre     =3D "${datadir}/fonts/truetype/DejaVuMathTeX=
Gyre.ttf"
>  FILES_${PN}-common          =3D "${sysconfdir}"
> =20
> -SRC_URI[md5sum] =3D "59eaca5acf5c7c8212e92778e3e01f32"
> -SRC_URI[sha256sum] =3D "f6d7965586101ff3a8a5c3ec503e082bb6a9604ff53413e1=
0702e5917c194d88"
> +SRC_URI[md5sum] =3D "d0efec10b9f110a32e9b8f796e21782c"
> +SRC_URI[sha256sum] =3D "fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d=
65453b4e846e17d7"
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfXtYQACgkQN1Ujt2V2gBxbIACfRhhzyud3nuuMyQEFdD5BVRZO
4xsAoLvzxA/mpzFo0hgHDYyH9zN7nB1r
=iB1F
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
