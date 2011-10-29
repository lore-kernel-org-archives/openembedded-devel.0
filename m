Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK8GQ-0002Yb-AU for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:43:54 +0200
Received: from g225082113.adsl.alicedsl.de ([92.225.82.113]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK8Ao-00021d-6p for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:38:06 +0000
Message-ID: <1319891872.3756.20.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 14:37:52 +0200
In-Reply-To: <ff2c3e6a8645c6120d4770be1592e7644ab72ad2.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<ff2c3e6a8645c6120d4770be1592e7644ab72ad2.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 06/12] liblinebreak: import from openembedded classic
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
X-List-Received-Date: Sat, 29 Oct 2011 12:43:54 -0000
X-Groupsio-MsgNum: 35068
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-4ugY+VPZsSQpX7IMCrRS"

--=-4ugY+VPZsSQpX7IMCrRS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Denis, dear Martin,


Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

as replied to the other message please add the version and the commit
ID.

> The License was verified and LIC_FILES_CHKSUM was added
>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../liblinebreak/liblinebreak_1.2.bb               |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2=
.bb
>=20
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/m=
eta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> new file mode 100644
> index 0000000..03c4352
> --- /dev/null
> +++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Liblinebreak is an implementation of the line breaking =
algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
> +HOMEPAGE =3D "http://vimgadgets.sourceforge.net/liblinebreak/"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D3715191da62bafb5cfc4ff36195b2=
ec3"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}=
/liblinebreak-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] =3D "d18039259001ccb24b5dd4648c49c5ad"
> +SRC_URI[sha256sum] =3D "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a1=
50af8b718d0c7b76"

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-4ugY+VPZsSQpX7IMCrRS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6r86AACgkQPX1aK2wOHVgEeACdHRokRiMEhl4KR1mrLw0ybj71
bD4Ani+QeQFqRipUYIgCCA/jQ0ciZ1yy
=z+BM
-----END PGP SIGNATURE-----

--=-4ugY+VPZsSQpX7IMCrRS--
