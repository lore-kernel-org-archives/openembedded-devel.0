Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qty46-0006fJ-Ph for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:35:03 +0200
Received: from f053044176.adsl.alicedsl.de ([78.53.44.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qtxzk-0007Rx-GF for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 08:30:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
Date: Thu, 18 Aug 2011 10:30:23 +0200
Message-ID: <1313656223.4016.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
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
X-List-Received-Date: Thu, 18 Aug 2011 08:35:04 -0000
X-Groupsio-MsgNum: 33683
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gfISohrwU+Xf8Ris9VoI"

--=-gfISohrwU+Xf8Ris9VoI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Donnerstag, den 18.08.2011, 10:18 +0200 schrieb Martin Jansa:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../e17/e-wm/wizard-module-skipping.patch          |   63 --------------=
------
>  meta-efl/recipes-efl/e17/e-wm_svn.bb               |    4 -
>  2 files changed, 0 insertions(+), 67 deletions(-)
>  delete mode 100644 meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.=
patch
>=20
> diff --git a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch b=
/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
> deleted file mode 100644
> index d124325..0000000
> --- a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
> +++ /dev/null

[=E2=80=A6]

> diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/=
e17/e-wm_svn.bb
> index 9272aab..38257b5 100644
> --- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
> +++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
> @@ -16,10 +16,6 @@ SRC_URI =3D "\
>    file://applications.menu \
>  "
> =20
> -SRC_URI_append_shr =3D " \
> -  file://wizard-module-skipping.patch \
> -"
> -
>  EXTRA_OECONF =3D "\
>    --with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc \
>    --with-eet-eet=3D${STAGING_BINDIR_NATIVE}/eet \

sorry for bothering. I do not have an overview yet. Could somebody
elaborate if such distribution overrides are now deprecated? Will that
patch be applied in the SHR layer?


Thanks,

Paul

--=-gfISohrwU+Xf8Ris9VoI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5MzZ8ACgkQPX1aK2wOHViJXACeNW5ZC+Q+BvFrziUODyBsmvUl
rgcAn3Qro8b7NehnHLavcr0c8gUWqIBf
=Fpk8
-----END PGP SIGNATURE-----

--=-gfISohrwU+Xf8Ris9VoI--
