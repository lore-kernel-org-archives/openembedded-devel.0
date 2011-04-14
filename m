Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QASgE-000872-PT for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 21:58:18 +0200
Received: from f053041005.adsl.alicedsl.de ([78.53.41.5] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QASeM-0000tt-KT; Thu, 14 Apr 2011 19:56:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302782262-22894-1-git-send-email-Chase.Maupin@ti.com>
References: <1302782262-22894-1-git-send-email-Chase.Maupin@ti.com>
Date: Thu, 14 Apr 2011 14:58:24 +0200
Message-ID: <1302785904.4879.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] matrix-gui: Bump up SRCREV
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
X-List-Received-Date: Thu, 14 Apr 2011 19:58:18 -0000
X-Groupsio-MsgNum: 31179
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HI7FA3nx49cxM0maRyOs"

--=-HI7FA3nx49cxM0maRyOs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase, dear Jeff,


Am Donnerstag, den 14.04.2011, 06:57 -0500 schrieb Chase Maupin:
> From: Jeff Lance <j-lance1@ti.com>
>=20
> * Bump up SRCREV
>   * add am389x platform support
>   * am1808 add correct instructions for running profibus demo
>=20
> Signed-off-by: Jeff Lance   <j-lance1@ti.com>
> ---
>  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
>  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
>  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-=
common_1.4.bb
> index 04cdb2f..d436044 100644
> --- a/recipes/ti/matrix-gui-common_1.4.bb
> +++ b/recipes/ti/matrix-gui-common_1.4.bb
> @@ -4,5 +4,5 @@ require matrix-gui-common.inc
>  # prebuilt version in the repository.
>  RRECOMMENDS_${PN} =3D "am-sysinfo"
> =20
> -SRCREV =3D "243"
> -PR =3D "${INC_PR}.8"
> +SRCREV =3D "245"
> +PR =3D "${INC_PR}.9"
> diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3=
.bb
> index 4519437..fb7e4b3 100644
> --- a/recipes/ti/matrix-gui-e_1.3.bb
> +++ b/recipes/ti/matrix-gui-e_1.3.bb
> @@ -1,5 +1,5 @@
>  require matrix-gui-e.inc
> =20
> -SRCREV =3D "243"
> -PR =3D "${INC_PR}.7"
> +SRCREV =3D "245"
> +PR =3D "${INC_PR}.8"
> =20
> diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
> index 727aca1..2c38fc3 100644
> --- a/recipes/ti/matrix-gui_1.3.bb
> +++ b/recipes/ti/matrix-gui_1.3.bb
> @@ -1,4 +1,4 @@
>  require matrix-gui.inc
> =20
> -SRCREV =3D "243"
> -PR =3D "${INC_PR}.3"
> +SRCREV =3D "245"
> +PR =3D "${INC_PR}.4"

is the bump of `PR` needed? Is not the increment of `SRCREV` implying
that already?


Thanks,

Paul

--=-HI7FA3nx49cxM0maRyOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2m71gACgkQPX1aK2wOHVjSvgCeKyEEmpyaarATbP4pVScpitL2
o/QAn3Hrux4YLtqDFMsm3AGjU93Shk8a
=Fmz3
-----END PGP SIGNATURE-----

--=-HI7FA3nx49cxM0maRyOs--
