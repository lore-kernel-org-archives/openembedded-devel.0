Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 626B57067B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:34:30 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so2734893wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1YuEa4vXE/eH3P5nyDLaOfvpoi1tnjnXdyrKhbocKMY=;
	b=F9O5uHaDvTAvwguoArT4G7rLkEpDOenmHVhgXY+O5g2iPzARbd2+uDc9m30tnclayl
	YB+WOpArc0GQEnI4fJ28G5K8AWibuR0RD1NOZRaBRsK3Paxe+rmlQ+HI+PpOnVt+1dhW
	XMuHLyK3zZAjIhGUxeOFDnrcG96TpXj/1eDhrepWz0vYzp5L5BYtb4S+572Yp07ohSt8
	szLSL9vcXJEWZjNAZDsWqBNLj86pAEy2hJS8FSStgc4sLX0aodhDZC9ysuyweb14rKMs
	6CFtQ+ZySluCN9eh76zyIocdafqO39EVLXYQVMW/qjNcYMiP/Xihk4CJSDeMKpzKIKlC
	OU8w==
X-Received: by 10.180.186.3 with SMTP id fg3mr49649972wic.78.1407335671416;
	Wed, 06 Aug 2014 07:34:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pj6sm2903385wjb.21.2014.08.06.07.34.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:34:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 16:35:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806143501.GJ14848@jama>
References: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] evtest: Provide updated checksums
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
X-List-Received-Date: Wed, 06 Aug 2014 14:34:32 -0000
X-Groupsio-MsgNum: 51453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline

--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 09:21:33AM -0400, Drew Moseley wrote:
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  meta-oe/recipes-support/evtest/evtest_1.25.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/reci=
pes-support/evtest/evtest_1.25.bb
> index 640cec0..ccaa0c6 100644
> --- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
> +++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>  DEPENDS =3D "libxml2"
> =20
>  SRC_URI =3D "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${=
PV}.tar.bz2;name=3Darchive"
> -SRC_URI[archive.md5sum] =3D "770d6af03affe976bdbe3ad1a922c973"
> -SRC_URI[archive.sha256sum] =3D "3d34123c68014dae6f7c19144ef79ea2915fa7a2=
f89ea35ca375a9cf9e191473"
> +SRC_URI[archive.md5sum] =3D "0ef3fe5e20fa2dee8994827d48482902"
> +SRC_URI[archive.sha256sum] =3D "6e93ef54f0aa7d263f5486ce4a14cac53cf50036=
bfd20cf045fef2b27ee6664b"

NAK: see evtest changes in master-next:
http://patchwork.openembedded.org/patch/77211/
http://patchwork.openembedded.org/patch/77213/

> =20
>  inherit autotools pkgconfig
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

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiPRUACgkQN1Ujt2V2gBzCygCeN7CpIDKtJHpKUyf52wzS8zYg
4doAn218QCjwoOHgnIU9JblR8uxgMMvc
=vWSc
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
