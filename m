Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2kwU-0003MP-Ar for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 14:51:14 +0100
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2kui-0008Tz-8x for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 13:49:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300971676-31774-1-git-send-email-heroor@gmail.com>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
Date: Thu, 24 Mar 2011 14:49:22 +0100
Message-ID: <1300974563.3795.29.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/3] TI IPC: Fix License field.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 13:51:14 -0000
X-Groupsio-MsgNum: 30598
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/hc1ROQRFSyiJl/RkaP/"

--=-/hc1ROQRFSyiJl/RkaP/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 24.03.2011, 18:31 +0530 schrieb Siddharth Heroor:
> From: Siddharth Heroor <heroor@ti.com>
>=20
> * The correct license for TI IPC is BSD and not TI.

Was the original license a mistake or was it relicensed?

> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/ti/ti-ipc.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
> index cd6ad6e..fc9b908 100644
> --- a/recipes/ti/ti-ipc.inc
> +++ b/recipes/ti/ti-ipc.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "TI Inter Process Ccommunication (IPC) Mechanisms (for U=
ni- and Multi- Processor Configurations)"
>  HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ipc/index.html"
>  SECTION =3D "devel"
> -LICENSE =3D "TI"=20
> +LICENSE =3D "BSD"=20
> =20
>  require ti-paths.inc
>  require ti-staging.inc

All Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>. I would
push them or do the TI people want to push these?


Thanks,

Paul

--=-/hc1ROQRFSyiJl/RkaP/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2LS+IACgkQPX1aK2wOHVjAIACeMZ3MCgbFEjRgWzEK2EP8+WHz
iIYAn3KWJpZFArBjGgjykhbd/67GQKRq
=HJ2E
-----END PGP SIGNATURE-----

--=-/hc1ROQRFSyiJl/RkaP/--
