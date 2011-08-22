Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qvba9-0005Fr-09 for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:58:53 +0200
Received: from f053036249.adsl.alicedsl.de ([78.53.36.249]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvbVc-0006a7-9C for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 20:54:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:53:57 +0200
In-Reply-To: <22ec18224f7a7c64850c76b14017dff2ff4345f2.1314044687.git.Martin.Jansa@gmail.com>
References: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
	<22ec18224f7a7c64850c76b14017dff2ff4345f2.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314046450.28437.0.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-efl][PATCH 4/4] elfe: Add LIC_FILES_CHKSUM to recipe
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
X-List-Received-Date: Mon, 22 Aug 2011 20:58:53 -0000
X-Groupsio-MsgNum: 33780
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-3xQ9dqPXzuanPu3878V+"

--=-3xQ9dqPXzuanPu3878V+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 22.08.2011, 22:26 +0200 schrieb Martin Jansa:
> From: pespin <pespin.shar@gmail.com>

Koen, please fix up the name before merging it.

> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/e17/elfe_svn.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/=
e17/elfe_svn.bb
> index 8b8f09d..b5126f9 100644
> --- a/meta-efl/recipes-efl/e17/elfe_svn.bb
> +++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
> @@ -1,4 +1,5 @@
>  LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f38e182dcaf30fe8=
a35"
>  PV =3D "0.0.1+svnr${SRCPV}"
>  PR =3D "${INC_PR}.0"

--=-3xQ9dqPXzuanPu3878V+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5SweUACgkQPX1aK2wOHVhcqQCeKC5CyWzdtDUGe6QDC5OkWOma
qv8An3eXuj+Q8sbDANKylEaU1mKawzQC
=GzCA
-----END PGP SIGNATURE-----

--=-3xQ9dqPXzuanPu3878V+--
