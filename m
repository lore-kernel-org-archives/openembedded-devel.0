Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2023877204
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:45:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so7829392wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4Do+tNHX8SpHAnYlUaIpxwZak7kOp7J1QAKE1L2R3uk=;
	b=Tw4YnyYZ95dBzelRTMICj6yVMT1l8DplnScfZrJ8QEyYNGOAiFYF1QbA7bCLGk4U7f
	Bjl9kuNxQ6YAmDFHI2yy4O7sPsIX9nHPX5wOGeJoQqISwjpMDxXzCHDGEj1UgKOev31M
	XwNy1fgm3R3ugFrvzY6AEKSVVTUS0JvO1bzyvDN5bd6O1wItsVk3mFzcdEsalDTUg7+8
	rnHMKfRX3qNi5mLTuMjhDBmOmdf+8ziZgoYVYPNHXT1ra5Lg4xRzOoMGYPpnjL4rkX68
	HO7oOwrxo8N036XcUH41C2Y7IycZyE+fMuhKGP6kaJypu+K6ORHC2JMalXy4huDgxl+t
	BgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4Do+tNHX8SpHAnYlUaIpxwZak7kOp7J1QAKE1L2R3uk=;
	b=Kqy1tMUQ8sDPGcVFN8kMDsQzJC7UWw9Ek3RFDwp0IA5ivLM61QeOtyUOCzVTa4LPFi
	TzEEzWatkmVRtootSkwuiwhZEurGYigoEf66JCjsrMkk2Rj8eCxk4VaanyePm2Pc0RA7
	t2AsAy4RuBBiYC/ix1fFUDRqWRkosHJkQCfdGiboJ6ZZlGRl2xVzVoe7ig8CMLx0o9rH
	jBsw2DeuXevGqOGeYenDYYri2yrQPQmb6XIIAB/VtePj2iKXN1IzZrLHA2OqieJ46bbT
	uLKWf/Y0p+f0fcACoos7HnUlymBxgEJt6ASlw5RDAStdO10sVWKxYnIZ5vxrJkLgWNZ9
	mHjQ==
X-Gm-Message-State: AEkoouv8GIISEOfdIWpGAoX5Mm+TAwclpJ3NOZ3GGaGTHnkUSuX0D0LPczZ0XrV4f/y/Lw==
X-Received: by 10.194.175.201 with SMTP id cc9mr2517577wjc.38.1470815122495;
	Wed, 10 Aug 2016 00:45:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	s6sm41613708wjm.25.2016.08.10.00.45.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Aug 2016 00:45:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Aug 2016 09:45:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160810074526.giu3dvpnuyz6jo22@jama>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
	<1470789534-602-2-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1470789534-602-2-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH 2/3] libp11: update to version 0.4.0
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
X-List-Received-Date: Wed, 10 Aug 2016 07:45:24 -0000
X-Groupsio-MsgNum: 62522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c5iu5lou42whtpgv"
Content-Disposition: inline

--c5iu5lou42whtpgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 08:38:53PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =3D> libp11_0.4.0.bb} | =
5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =3D> libp11_0.4.0=
=2Ebb} (81%)
>=20
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb b/meta-oe/rec=
ipes-support/libp11/libp11_0.4.0.bb
> similarity index 81%
> rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> index d97bfc6..a7e43be 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be894=
bab9bc501572864b29"
>  DEPENDS =3D "libtool openssl"
> =20
>  SRC_URI =3D "git://github.com/OpenSC/libp11.git;protocol=3Dhttp"
> -SRCREV =3D "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
> +SRCREV =3D "22de793340ab73cafc92f8238afb51a06d8411c3"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -21,3 +21,6 @@ do_install_append () {
>      rm -rf ${D}${libdir}/*.la
>      rm -rf ${D}${docdir}/${BPN}
>  }
> +
> +FILES_${PN} +=3D "${libdir}/pkcs11.so.0*"
> +FILES_${PN}-dev +=3D "${libdir}/pkcs11.so"

You can use following variables here:

SOLIBS =3D ".so.*"
SOLIBS_darwin =3D ".dylib"

SOLIBSDEV =3D ".so"
# Due to the ordering of PACKAGES and the naming of the dev symlinks on
# darwin,
# we can't make the symlinks end up in the -dev packages easily at this
# point. This hack
# at least means builds aren't completely broken and symlinks don't take
# up much space.
SOLIBSDEV_darwin =3D ".dylibbroken"

If I don't forget I'll update it when cherry-picking to master-next (if
you don't send v2 before that).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c5iu5lou42whtpgv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleqfWwACgkQN1Ujt2V2gBySDgCgnliu1LLxA9Bi9co3XuaMz3QE
9wEAmgJb8DY/dRp9GXewh3+YKoQWqWoR
=KzgX
-----END PGP SIGNATURE-----

--c5iu5lou42whtpgv--
