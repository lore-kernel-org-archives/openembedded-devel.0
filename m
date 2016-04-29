Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 22427700F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 16:12:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g17so44176602wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZXDVYi5znn9fgGLhjzw5aHI/Xv0QealKWyw1o59irzY=;
	b=brfJ7qiG+g44MHdpE6/4D13qW753LG60gbzX7tQSYa2IhX+AN6OkjXYtM1cs/JAZU7
	kMsHXwjVulCBWKFrPTmGWtIkf+ymKGd9/kZtB2YM1U/lIsiR9eRTh6PUH+JU3YhjJWyM
	CMNIYFSZ39iddFlJY16u+Wsd3R9Yla9BmCw8U0f36YFJYcByjklkR3I1i62MBCZd8ilq
	iVrkdMY/HSm8dNLsFcpGxJp/HKkImgFEcP9E50a0yPcprRq6+freQL/StMy+WnsZAwTD
	vOaIji2PqhWIVGaC9CEZIlSwMdYLzLb+CyA76vLVJgY8IF1Dl+85m+HKr6+HDc4PZVwu
	YghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZXDVYi5znn9fgGLhjzw5aHI/Xv0QealKWyw1o59irzY=;
	b=ZbJqnzarUGpM0CZ60qVAxDPA376m4jROvA67S7TJfB+1LR3Au5gE0uTNnGmWmnXYjT
	F7Dj9t0lpXPCmeC+3CGjZoPM64sY6LEPSm8ggFwAxAEljq7SmH75BaMypGmq6iSHnaZN
	VJAlNKeO5oanERM0tv3d+nNGio+JKtTmZaeotV4TXTAHWYIt+m1UvMDxR4B7tCkVkoCh
	l5GnPUjH1McZV1BRdjoGodI9pr3f7XUN6t81N7KkRyEd5VYY1ro8iZxTqgqBuMdavr8E
	1AcFPNc+IEwfnw2L6jv/CXO9g0jUXYBPidr+nvrki23Whf3qJOAM03HZ4+7JWQHAX6ez
	plXg==
X-Gm-Message-State: AOPr4FVpmyw2VfnwIhM7kBAU2iOgcd99SMwHaYzkOC1y8vynST1ubFRDnGKNCnvOCpYUow==
X-Received: by 10.194.62.110 with SMTP id x14mr25608322wjr.68.1461946327222;
	Fri, 29 Apr 2016 09:12:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id w3sm15490882wjt.0.2016.04.29.09.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Apr 2016 09:12:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Apr 2016 18:12:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160429161257.GC2561@jama>
References: <1461945952-10232-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1461945952-10232-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH] giflib: update to version 5.1.4
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
X-List-Received-Date: Fri, 29 Apr 2016 16:12:09 -0000
X-Groupsio-MsgNum: 61262
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline

--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2016 at 12:05:52PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-devtools/giflib/{giflib_4.1.6.bb =3D> giflib_5.1.4.bb}  | 8 =
+++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb =3D> giflib_5.1.=
4.bb} (67%)
>=20
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/re=
cipes-devtools/giflib/giflib_5.1.4.bb
> similarity index 67%
> rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> index e59d0e5..855a603 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> @@ -2,14 +2,12 @@ SUMMARY =3D "shared library for GIF images"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2917be39b11f78d715=
19a"
> -PR =3D "r3"
> +PR =3D "r0"

Please drop PR completely.
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> =20
>  inherit autotools
> =20
> -EXTRA_OECONF =3D "--disable-x11"

Doesn't it autodetect x11 dependencies now?

> -
>  PACKAGES +=3D "${PN}-utils"
>  FILES_${PN} =3D "${libdir}/libgif.so.*"
>  FILES_${PN}-utils =3D "${bindir}"
> @@ -18,5 +16,5 @@ BBCLASSEXTEND =3D "native"
> =20
>  RDEPENDS_${PN}-utils =3D "perl"
> =20
> -SRC_URI[md5sum] =3D "7125644155ae6ad33dbc9fc15a14735f"
> -SRC_URI[sha256sum] =3D "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d22=
85e8e1f3b93f2bed"
> +SRC_URI[md5sum] =3D "2c171ced93c0e83bb09e6ccad8e3ba2b"
> +SRC_URI[sha256sum] =3D "df27ec3ff24671f80b29e6ab1c4971059c14ac3db9540688=
4fc26574631ba8d5"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcjiAgACgkQN1Ujt2V2gBzv3ACgu01q1AjZz2LdVjyt2D3LmATW
1XUAnilOGkJgk71zc4nW/DDLa3JDVRyj
=nl9b
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
