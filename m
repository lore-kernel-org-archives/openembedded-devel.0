Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 07AC460616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:16:22 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so73651043wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1MC9Jw5d3g8bG42etO3mcWQ9Jhm8M9IP0QM5wCl5pTU=;
	b=vQkHQaS4JUENBGFDLS14ycQiT8yD0kCb/FewqQQHJk/DuzP5roMBDPDfRSqM+FgB62
	RzpNXLTQDDyj3ryqDoGDhehSE2FtDjIa6qb+1VMYN6gh5aARuYhFn9GOJZ8XEbjLpWjC
	NhUUiS6iXwoDaLTSDayW7AJD/cxSC4shOOY076GaRNgJWIFSaatXTXUZitdkXSrGLT0l
	uwrK3VtMFGu5pgeu5vjhTyyKdy1wBNoqQDZI7EfQJz1g6o991DUk367xEidVF9/zfK0c
	zUqJ/0yNRwlUbG+d/xeEACbJtBOUnVQ/umtAfoyVBwyIV2+gnGMTO5nZg1oSz5SdeyzZ
	B+oQ==
X-Received: by 10.28.20.83 with SMTP id 80mr51165782wmu.89.1451499382598;
	Wed, 30 Dec 2015 10:16:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a126sm8095643wmh.0.2015.12.30.10.16.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 10:16:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 19:19:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230181958.GJ2263@jama>
References: <1451498458-17741-1-git-send-email-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1451498458-17741-1-git-send-email-twoerner@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 18:16:23 -0000
X-Groupsio-MsgNum: 59233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline

--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 01:00:58PM -0500, Trevor Woerner wrote:
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Mention what was changed in LICENSE file.

> ---
>  .../recipes-devtools/nodejs/{nodejs_4.2.3.bb =3D> nodejs_4.2.4.bb}    | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb =3D> nodejs_4.2.=
4.bb} (93%)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_4.2.4.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> index 66a3c11..18e23b7 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dee90ba97d933fc8d56e97812b7dd6=
2e9"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D963ca39eebcb15ac618bc3006504a=
e3f"
> =20
>  DEPENDS =3D "openssl"
> =20
> @@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>      file://no-registry.patch \
>  "
> -SRC_URI[md5sum] =3D "529a8abd4ca5a2225636767d3f14c382"
> -SRC_URI[sha256sum] =3D "5008ade5feb4b089f59163f66bffddc113f27de5d78edf20=
3e39435c2c5d554f"
> +SRC_URI[md5sum] =3D "86e4d0d8b626f6e60ca7bef02f2543d2"
> +SRC_URI[sha256sum] =3D "4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b=
30e68b27460c10ec"
> =20
>  S =3D "${WORKDIR}/node-v${PV}"
> =20
> --=20
> 2.6.0.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaEIE0ACgkQN1Ujt2V2gBw7NACgkEyDp8rTdFQuMn42Q5IZqeBW
ysQAmwUJbXmhPdRFZIIKVvrQhjUcUunq
=luSj
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
