Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8D338702CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:17:28 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XRLIX-0000md-Oc from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 06:17:29 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:17:29 -0700
Received: by burninator (Postfix, from userid 1000)	id DF6DA5814C3; Tue,  9
	Sep 2014 09:17:28 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:17:28 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909131728.GF2125@mentor.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
	<1409815958-24314-5-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1409815958-24314-5-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 5/6] lowpan-tools: Move to 0.3.1 release
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
X-List-Received-Date: Tue, 09 Sep 2014 13:17:36 -0000
X-Groupsio-MsgNum: 52043
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline

--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also merged, thanks.
-J.

[[oe] [meta-networking][PATCH 5/6] lowpan-tools: Move to 0.3.1 release] On =
14.09.04 (Thu 00:32) Khem Raj wrote:

> Also fix the git SRC_URI location
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb | 6 +++=
---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index d8e1ddb..ca10262 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
> =20
>  DEPENDS =3D "libnl python"
> =20
> -PV =3D "0.3+git${SRCPV}"
> -SRC_URI =3D "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee=
/linux-zigbee \
> +PV =3D "0.3.1+git${SRCPV}"
> +SRC_URI =3D "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
>             file://no-help2man.patch"
> -SRCREV =3D "a1d9615adde6d1a568813c24a128273ed755af04"
> +SRCREV =3D "38f42dbfce9e13629263db3bd3b81f14c69bb733"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDv3oAAoJEEn8ffcsOfaWD1oH/2vJjHH19MTFRhhSrkxU9OAG
R4+1xJ3Zff+hKRvvi7JSGphHNE2nr/1/Mlv6ms8EfQoolPAb/jneBCeH+7eZXBnB
RRM72bucGlkcxB32ogNcuXZTR8/jXvWtVdmy/B0+3CEd9q7E3/YEimp8lQ1j2dYO
/EA3jJ82EEtIXcEYRGl/UNKRWvuHkcsgJJFFi/WXQQtO9t2lNOewa6GzC09GiXph
AVCVL6TMHc7BduzsVITZ0hQ38fwAT6/7ZuiUD6khydIidLGka3rIe+Iarug/LoHE
f0KM5GQ/qjPJW0kwtbKnUsH9DXvg0Gz4LG7Dc+ddzv9QSuuAycgY2lqDNgOOAns=
=mzNs
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--
