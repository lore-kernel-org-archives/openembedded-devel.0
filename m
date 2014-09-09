Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B2C5871387
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:18:41 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XRLJi-0000zQ-MQ from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 06:18:42 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:18:42 -0700
Received: by burninator (Postfix, from userid 1000)	id D3B395814C3; Tue,  9
	Sep 2014 09:18:41 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:18:41 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909131841.GG2125@mentor.com>
References: <1409555496-16040-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1409555496-16040-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking] aoetools: uprev to version 36
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
X-List-Received-Date: Tue, 09 Sep 2014 13:18:41 -0000
X-Groupsio-MsgNum: 52044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline

--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.
-J.

[[oe] [PATCH][meta-networking] aoetools: uprev to version 36] On 14.09.01 (=
Mon 15:11) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-support/aoetools/{aoetools_34.bb =3D> aoetools_36.bb}    |  =
  4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/aoetools/{aoetools_34.bb =3D> aoe=
tools_36.bb} (84%)
>=20
> diff --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb b/me=
ta-networking/recipes-support/aoetools/aoetools_36.bb
> similarity index 84%
> rename from meta-networking/recipes-support/aoetools/aoetools_34.bb
> rename to meta-networking/recipes-support/aoetools/aoetools_36.bb
> index eb1e0fe..5bb486f 100644
> --- a/meta-networking/recipes-support/aoetools/aoetools_34.bb
> +++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
>  RRECOMMENDS_${PN} =3D "kernel-module-aoe"
> =20
>  SRC_URI =3D "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-=
${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "cde7f7cedc7cd9938a5ebfd009dd3ec0"
> -SRC_URI[sha256sum] =3D "fd6c57244e9458d7cbe7a0171295ddee4d8cdcae291e40d6=
acbc641df7296d85"
> +SRC_URI[md5sum] =3D "bff30daa988a65f69d4448ce4726a6db"
> +SRC_URI[sha256sum] =3D "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6=
b3ed5a8fbdf215ff"
> =20
>  # EXTRA_OEMAKE is typically: -e MAKEFLAGS=3D
>  # the -e causes problems as CFLAGS is modified in the Makefile.
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDv4xAAoJEEn8ffcsOfaW4MkIAMJ4JpzjWAZg0XNJkPQrMyKo
akZBxAR1DRfEI5zbl/pbrFnNdwDDwDesOCOrmXXM56RhDWqus+Y8UGkxj8Lel5GT
uKFflRf1yUmQVuukKLPrbQ4RB8DVZrhV3dAK7f0HNuIwE7Tj+8SjkxDr+51gG2sh
R+q9Y1YA3Y73PGsx2gX4jQrv21FwA54e2EVc2PKWnzERip17hjLjgveEBlrL2PAJ
zKen0zYdHoBrS11LG/fDOTckvZTuQgB8vzONtmI+fKXbnVb8LyWeUU6WJCh+4liA
F1ANqLwuhaAykTfIEM+gTNvZUQ3wUYnEr88Rc5c6WiTvYEHPYRI3b1roFpsKsgw=
=yeTU
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
