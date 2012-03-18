Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S9C0P-0007WK-ST for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 10:02:25 +0100
Received: from f053036091.adsl.alicedsl.de ([78.53.36.91]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S9Bs8-0000FI-4q for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 08:53:52 +0000
Message-ID: <1332060803.7678.2.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 09:53:23 +0100
In-Reply-To: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
References: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] midori: Add project home page info
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
X-List-Received-Date: Sun, 18 Mar 2012 09:02:26 -0000
X-Groupsio-MsgNum: 37815
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-TMiKrYQdG6xDmkBReIqi"

--=-TMiKrYQdG6xDmkBReIqi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 16.03.2012, 13:41 -0600 schrieb Gary Thomas:
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-connectivity/midori/midori.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/rec=
ipes-connectivity/midori/midori.inc
> index 4c7147e..dccb3ee 100644
> --- a/meta-oe/recipes-connectivity/midori/midori.inc
> +++ b/meta-oe/recipes-connectivity/midori/midori.inc
> @@ -1,4 +1,5 @@
>  DESCRIPTION =3D "Midori is a lightweight web browser."
> +HOMEPAGE =3D "http://www.twotoasts.de/index.php?/pages/midori_summary.ht=
ml"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-TMiKrYQdG6xDmkBReIqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9looMACgkQPX1aK2wOHVhsyACfel55XyBlXXGIUVTeUpptpd9Q
DacAn20RVYtFVoki2PHVGylPl5LIaJE3
=BpQ2
-----END PGP SIGNATURE-----

--=-TMiKrYQdG6xDmkBReIqi--
