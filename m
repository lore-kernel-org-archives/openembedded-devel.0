Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1532A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:29:45 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y8AXK-0002wC-15 from Joe_MacDonald@mentor.com ;
	Mon, 05 Jan 2015 08:29:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Jan 2015 08:29:45 -0800
Received: by burninator (Postfix, from userid 1000)	id BDC5F580D10; Mon,  5
	Jan 2015 11:29:41 -0500 (EST)
Date: Mon, 5 Jan 2015 11:29:41 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: lchristina26 <lchristina26@hotmail.com>
Message-ID: <20150105162941.GB12135@mentor.com>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
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
X-List-Received-Date: Mon, 05 Jan 2015 16:29:46 -0000
X-Groupsio-MsgNum: 53662
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version=
 3.1.0] On 14.12.22 (Mon 14:29) lchristina26 wrote:

> Signed-off-by: Leah <lchristina26@hotmail.com>
> ---
>  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}                    | 7=
 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.bb =3D>=
 cyassl_3.3.0.bb} (74%)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> similarity index 74%
> rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index e3edab6..b6f852d 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "CyaSSL Embedded SSL Library"
> +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
>  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
>                 optimized for embedded and RTOS environments. It can be \
>                 Up to 20 times smaller than OpenSSL while still supportin=
g \
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
> =20
>  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> =20
> -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> -SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d4c=
05506aa98a296fe3"
> =20
>  inherit autotools
> +
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUqrv1AAoJEEn8ffcsOfaWTrcH/1wTCWWvu7k24NQGtW1Wj822
XuyI6z8pajy1tiEXopPN5Mge5k4x1j9zXJNW2A8csibC+EfgE2o9XHak+v0F6BbQ
Sb/ldL6fTN+LNhBdZw12Dyo4J3XwOvvi4fAuFLTRutJdN82xQQ+ii7pG98PTFpfq
8ZTXDtraHsfyvtBuA8BbYNiKpU2JcrdLv+y6zyCbRuYUlCHzZYvn0US7s3stpMjT
lvz4NExurK0jYS4DoM5dac4ua92HRicLFQ9PtBL8Qrih6JFfqPIeYPd/WqZ+1fHi
xXr3yePRYFo2PPzn59tSymovl/JOGxWkxQW70WOOAubhIBIyAhAjoi3AQC2p2Uo=
=TBjt
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
