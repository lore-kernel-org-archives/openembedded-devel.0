Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 289946E645
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 10:21:15 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so58922002wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SMQ2LSLDbQjcm81kXudtfm6fqQIFpy/BUOigg1r9jkg=;
	b=x9+KK7X0SSK0CkG6jEK/4vFlyH0o86Nq9LjSWyvtkRc85npqNAAASr+CZPwnE4eaiv
	Tf1JJDUVFExdlGxvoL790OmGKFqztJ+RaKhPG1ZgEXfCOU9ScXzE0ZC26arezAbsVAKX
	Inn6mFvU31YwnKxMRMDdYtrz5B2l3ZAxm82WYei/XGJcUtmKfgkyXzST8mIBx2Ox15+I
	yKKHcQTTu8oBFNRzveUmmhjzUF9uHxJCx+Q8lncW6X2+KijpLLEEQg8BjS6zNuGmkKNO
	ExmMq9egmNSsDI4NwP1AJrOJxvOqwx4ZsoYJNLvHQZqtzBzoltqlbx/MEdKux0M2m3Tk
	gzpQ==
X-Received: by 10.194.121.34 with SMTP id lh2mr34098197wjb.101.1435832475525; 
	Thu, 02 Jul 2015 03:21:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id v3sm7320369wja.31.2015.07.02.03.21.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 03:21:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jul 2015 12:21:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150702102142.GB2434@jama>
References: <1433140867-1089-1-git-send-email-aguirre.nicolas@gmail.com>
	<1433140867-1089-2-git-send-email-aguirre.nicolas@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1433140867-1089-2-git-send-email-aguirre.nicolas@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] libsic++-2.0: bump version to 2.4.1
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
X-List-Received-Date: Thu, 02 Jul 2015 10:21:18 -0000
X-Groupsio-MsgNum: 56126
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2015 at 08:41:07AM +0200, Nicolas Aguirre wrote:
> ---

Missing SOB line and typo in subject "libsic" -> "libsigc"

I've fixed typo, please confirm added SOB line.

>  .../{libsigc++-2.0_2.2.11.bb =3D> libsigc++-2.0_2.4.1.bb}             | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.2.11.bb =3D> =
libsigc++-2.0_2.4.1.bb} (67%)
>=20
> diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb b=
/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
> similarity index 67%
> rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
> rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
> index 546305f..b3e0e60 100644
> --- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
> +++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
> @@ -5,9 +5,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499"
> =20
>  DEPENDS =3D "mm-common"
> =20
> -SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsig=
c++-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "815d0c6d61601f51bbcaeef6826606b0"
> -SRC_URI[sha256sum] =3D "9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626=
d6f67f940f1e4957"
> +SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.4/libsig=
c++-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "55945ba6e1652f89999e910f6b52047c"
> +SRC_URI[sha256sum] =3D "540443492a68e77e30db8d425f3c0b1299c825bf974d9bfc=
31ae7efafedc19ec"
> =20
>  S =3D "${WORKDIR}/libsigc++-${PV}"
> =20
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

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWVELUACgkQN1Ujt2V2gBzWtwCfZv+zUZ0iby2nUpVLqgo54fhA
YFgAmwVBOEEflaQkeKoQC3G21uLGU2wL
=cwQH
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
