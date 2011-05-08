Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxe6-0003Aj-TS for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:39:14 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxcg-0004D1-BN for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:37:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304822586-14872-3-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-3-git-send-email-otavio@ossystems.com.br>
Date: Sun, 08 May 2011 08:36:32 +0200
Message-ID: <1304836592.4124.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 03/11] setxkbmap: add 1.2.0 version
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
X-List-Received-Date: Sun, 08 May 2011 06:39:15 -0000
X-Groupsio-MsgNum: 31722
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-T4dFr7PBiQFjjUdGf1Nc"

--=-T4dFr7PBiQFjjUdGf1Nc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nit pick: in the summary: add version 1.2.0


Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:

Please always note when you imported it from the old repository.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-=
oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
> new file mode 100644
> index 0000000..46576ce
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
> @@ -0,0 +1,8 @@
> +require xorg-app-common.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D22c34ea36136407a77702a8b784f9=
bd0"
> +DEPENDS +=3D " libxkbfile "

No spaces.

> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "2f6df89201eb9a2cbfb905d6b82a191e"
> +SRC_URI[archive.sha256sum] =3D "999591bf1ba8ca2a7d480b2c01702396e6c349d4=
99fb583c0de136ec00dbae39"


--=-T4dFr7PBiQFjjUdGf1Nc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GOfAACgkQPX1aK2wOHVgKDACfQ11gRFg3cWiR9IALNxR3Ls56
GzwAn3DrnL1sxBC8CCW4N+U/7wOM5fP0
=lO4O
-----END PGP SIGNATURE-----

--=-T4dFr7PBiQFjjUdGf1Nc--
