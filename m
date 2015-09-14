Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 980D37669F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 19:38:38 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZbZaH-00024N-Rr from Joe_MacDonald@mentor.com ;
	Mon, 14 Sep 2015 12:38:37 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Sep 2015 12:38:37 -0700
Received: by burninator (Postfix, from userid 1000)	id 2DC3B58186D; Mon, 14
	Sep 2015 15:37:29 -0400 (EDT)
Date: Mon, 14 Sep 2015 15:37:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <kai.kang@windriver.com>
Message-ID: <20150914193728.GA8885@mentor.com>
References: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4
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
X-List-Received-Date: Mon, 14 Sep 2015 19:38:38 -0000
X-Groupsio-MsgNum: 57344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On 15.09.10 (Thu =
13:38) kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
>=20
> * update md5sum of license file

http://comments.gmane.org/gmane.comp.handhelds.openembedded/70213

Please try to provide some context any time a license file changes.

-J.

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-support/iftop/{iftop_1.0pre2.bb =3D> iftop_1.0pre4.bb}    | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-support/iftop/{iftop_1.0pre2.bb =3D> ifto=
p_1.0pre4.bb} (57%)
>=20
> diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/met=
a-networking/recipes-support/iftop/iftop_1.0pre4.bb
> similarity index 57%
> rename from meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> rename to meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
> index e60fc8a..0c8e494 100644
> --- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> +++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
> @@ -4,11 +4,11 @@ SECTION =3D "net"
>  DEPENDS =3D "libpcap ncurses"
> =20
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D76498170798db0f4f0fb685a225f7=
02f"
> =20
>  SRC_URI =3D "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar=
=2Egz"
> -SRC_URI[md5sum] =3D "fef521a49ec0122458d02c64212af3c5"
> -SRC_URI[sha256sum] =3D "1b193037bb3019afae88cd94c87468aac4b045d81ab816ed=
8d2f489716b14027"
> +SRC_URI[md5sum] =3D "7e6decb4958e8a4890cccac335239f24"
> +SRC_URI[sha256sum] =3D "f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f=
5ffb2c197d9b4f97"
> =20
>  inherit autotools-brokensep
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV9yH1AAoJEEn8ffcsOfaWJMQIAIQm97i54Mxf+J/zJxslbp1r
ub8TdTDOm8mPJNbROQsCAlSAfVCDKbVaE/+8qC0MUE9E4aaJLcHeddsXIe/oy07B
OYmWdGaJYEembgtf/quW/p5+6D3yNEFxnIs6n1ZbXdbZvtOHBQtTFV8zEJSuiavd
NUFDhUmV+bDVh5Ah7l0egrudb0pkZQu3t2NQO8ZJesSbMW2cKBy9sHLgjCBYlwAN
l/Y72+qIJCz5W2icgUpJShfeO84SWjybaH/SWKRVYi8uW8YSuPTcakTpLw/wLSLu
VJdcobp7LOJFYVUui0pD1B/OIZ27omopiLYiHaOdko6xfSetcPN16I1fFw8vjfk=
=nNFO
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
