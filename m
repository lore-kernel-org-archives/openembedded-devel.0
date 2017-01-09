Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 782C460621
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 13:46:20 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cQaHF-0003fC-Dt from Joe_MacDonald@mentor.com ;
	Mon, 09 Jan 2017 05:46:21 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Jan 2017 05:46:20 -0800
Received: by burninator (Postfix, from userid 1000)	id 5B5B25805F6; Mon,  9
	Jan 2017 08:46:20 -0500 (EST)
Date: Mon, 9 Jan 2017 08:46:20 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Message-ID: <20170109134620.GC21527@mentor.com>
References: <1483777903-9531-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1483777903-9531-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lftp: update SRC_URI with new source
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
X-List-Received-Date: Mon, 09 Jan 2017 13:46:27 -0000
X-Groupsio-MsgNum: 64664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

[[oe] [meta-networking][PATCH] lftp: update SRC_URI with new source] On 17.=
01.07 (Sat 09:31) Oleksandr Kravchuk wrote:

> Use official web-site of lftp, which keeps tarballs with old versions.

In line with my response on the tcpdump, please just send a v2 of the
uprev patch with the SRC_URI updated, since the lftp update hasn't been
merged yet anyway.

Thank you.
-J.

>=20
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb b/me=
ta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> index b627963..0b44abc 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> @@ -6,7 +6,7 @@ SECTION =3D "console/network"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -SRC_URI =3D "http://fossies.org/linux/misc/lftp-${PV}.tar.bz2 \
> +SRC_URI =3D "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
>             file://fix-gcc-6-conflicts-signbit.patch \
>            "
>  SRC_URI[md5sum] =3D "7b54407ab24c1e78b45fe445d83eb5fd"
> --=20
> 2.7.4
>=20
--=20
-Joe MacDonald.
:wq

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYc5QsAAoJEEn8ffcsOfaWkVEH/jffzUe8mBLrA664NAaXemyF
M5F3QNT2NCFZE/9eXb7u0Hz3c/orabwpyXgFpOiRoKPH+CZ/UQInEjApaTe8rL1k
HEW08JgpgSqrIrLm1RHaMwv5B6Qfl0QbQX57avABF1UzahoauondKpv4M3ZQxYwc
pv8cAzLxDQr5azkx8NNHEL+xIermI6T8LDp1w2UApx3Q9kWGkRMkUKbcSIHzArK1
v8ueg5ItMubR3cCmoKMWFDUHucTM2f5d+HyEASKHJ8WYiv+8LGD98e1dM0k0nj0W
NXJG4gufUjvE3XnEHq21IctYoHQnSShjdlN5UQmVgh8htSxtnDjTOCutEeeuKbs=
=aokS
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
