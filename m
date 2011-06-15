Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWmx3-0000kG-4E for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 12:03:57 +0200
Received: from f053045092.adsl.alicedsl.de ([78.53.45.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWmup-0005XM-3i for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 10:01:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
Date: Wed, 15 Jun 2011 12:00:31 +0200
Message-ID: <1308132031.4304.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [[meta-oe][PATCH 3/3] freerdp-extension-xpunlimited: bump SRCREV due library renaming
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
X-List-Received-Date: Wed, 15 Jun 2011 10:03:57 -0000
X-Groupsio-MsgNum: 32685
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-K0EiicpCid+rNKG17N7H"

--=-K0EiicpCid+rNKG17N7H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Otavio,


Am Dienstag, den 14.06.2011, 16:49 +0000 schrieb Otavio Salvador:

nitpick: I think it is due *to*.

Additionally it would be nice, if you could be more elaborate what
library was renamed. An URL would be good enough.

Additionally in my opinion it would be great if you could add a short
note what build configuration you used for testing.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimite=
d_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_gi=
t.bb
> index 4fc6928..c9721f4 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.b=
b
> +++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.b=
b
> @@ -14,7 +14,7 @@ PR =3D "r0"
> =20
>  inherit pkgconfig cmake
> =20
> -SRCREV =3D "d27f90a0128c687ce74cc922dba8b7eeb33f0654"
> +SRCREV =3D "e952627ff4c116b4ce8541c91cb96bd5422c4a0d"
>  SRC_URI =3D "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.gi=
t;protocol=3Dgit"
> =20
>  S =3D "${WORKDIR}/git"


Thanks,

Paul

--=-K0EiicpCid+rNKG17N7H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk34gr8ACgkQPX1aK2wOHVikAgCfXlyP1jULjMRp3wS57ozMUWJY
Y4oAn309DPOROeHEdptiDQtoiata9gtk
=9KeF
-----END PGP SIGNATURE-----

--=-K0EiicpCid+rNKG17N7H--
